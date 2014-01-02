/**
 * Defines low level common DB functions
 * @returns {{connect: Function, disconnect: Function, insert: Function, remove: Function, select: Function}}
 */
module.exports = function(){
    var config = (registry.get ("config"));
    var MySQLPool = registry.get ("mysqlPool").MySQLPool;
    var client = new MySQLPool({
        poolSize: config.db.poolSize,
        user:     config.db.user,
        password: config.db.password,
        database: config.db.dbName,
        host: config.db.host,
        supportBigNumbers : true
    });

    /**
    * Slashes arguments to use in MySQL DB queries
    */
    var addSlashes = function (str){
        if (str && typeof str != "number"){
            str = str.replace(/\\/g,'\\\\');
            str = str.replace(/\'/g,'\\\'');
            str = str.replace(/\"/g,'\\"');
            str = str.replace(/\0/g,'\\0');
        }
        return str;
    };

    /**
     * Converts object into string of comma separated string of key = 'value' pairs, to use in SQL
     */
    var getKeyValExpr = function(obj){
        var result = '';
        var key;
        for (key in obj) {
            result += '`' + key + '`= ' + client.escape(obj[key]) + ', ';
        }
        if (result.length>0){
            result = result.substr(0, result.length - 2);
        }
        return result;
    };

    var getKeyValExprAnd = function(obj){
        var result = '';
        var key;
        for (key in obj) {
            result += '`' + key + '`= ' + client.escape(obj[key]) + ' AND ';
        }
        if (result.length>0){
            result = result.substr(0, result.length - 5);
        }
        return result;
    };

    /**
     * Single point to execute all the queries
     */
    var executeQuery = function(query, cb){
        cb = cb || function () {};
        client.query(query, function (error, result, fields) {
            if (error) {
                throw error;
            }else{
                cb(result, fields);
            }
        });
    };

    var gateway = {
        'client' : client,

        /**
         * Slashes special characters
         */
        'escape' : function(val){ return client.escape(val); },

        /**
         * Execute custom query
         */
        'execute' : executeQuery,

        /**
         * Inserts record provided as field->val set, Ignores if already exists
         */
        'insertIgnore': function (table, obj, cb) {
            cb = cb || function () {};
            var query = 'INSERT IGNORE INTO `' + table + '` SET ' + getKeyValExpr(obj);
            executeQuery(query, function (result, fields) { cb(result.affectedRows); });
        },

        /**
         * Inserts record provided as field->val set
         */
        'insert': function (table, obj, cb) {
            cb = cb || function () {};
            var query = 'INSERT INTO `' + table + '` SET ' + getKeyValExpr(obj);
            executeQuery(query, function (result, fields){ cb(result); });
        },

        /**
         * Inserts multiple records in one query
         * obj in format: [{key1: val, key2: val }, {key1: val, key2: val }, ...]
         */
        'insertAll': function (table, obj, cb) {
            cb = cb || function () {};
            var query = 'INSERT INTO `' + table + '` VALUES';
            var i=0;
            for(; i < obj.length; i++){
                query += " (";
                for (key in obj[i]) {
                    query +=  client.escape(obj[i][key]) + ', ';
                }
                query = query.substr(0, query.length - 2);
                query += "),";
            }

            if(i > 0){
                query = query.substr(0, query.length - 1);
            }
            executeQuery(query, function (result, fields){ cb(result); });
        },

        /**
         * Inserts or update (if already exists)
         * record provided as field->val set
         */
        'insertUpdate': function (table, obj, cb) {
            cb = cb || function () {};
            var query = 'INSERT INTO `' + table + '` SET ' + getKeyValExpr(obj) + ' ON DUPLICATE KEY UPDATE ' + getKeyValExpr(obj);
            executeQuery(query, function (result, fields){ cb(result); });
        },

        /**
         * Deletes records that fits in given condition (set of field -> value)
         */
        'remove': function (table, condition, cb) {
            cb = cb || function () {};
            var query = 'DELETE FROM `' + table + '` WHERE ' + getKeyValExpr(condition);
            executeQuery(query, function (result, fields) { cb(); } );
        },

        /**
         * Updates given record(s) if they fit in given condition (set of field -> value)
          */
        'update': function (table, fieldVals, condition, cb) {
            cb = cb || function () {};
            var query = 'UPDATE `' + table + '` SET ' + getKeyValExpr(fieldVals) + ' WHERE ' + getKeyValExpr(condition);
            executeQuery(query, function(result, fields){ cb(result) });
        },

        /**
         * Selects data from table where fields given as keys in "condition" object match values.
         */
        'select': function (table, condition, cb) {
            cb = cb || function () {};
            var query = 'SELECT * FROM `' + table + '`';
            if(condition)query = query +' WHERE ' + getKeyValExprAnd(condition);
            executeQuery(query, function(result, fields){cb(result);});
        },

        /**
         * Returns first row that fits in given condition (set of field -> value), or false if not found
         */
        'selectFirst' : function(table, condition, cb){
            cb = cb || function () {};
            var query = 'SELECT * FROM `' + table + '`';
            if(condition)query = query +' WHERE ' + getKeyValExprAnd(condition) + ' LIMIT 1;';
            executeQuery(query, function(result, fields){
                var res = result.length > 0 ? result[0] : false;
                cb(res);
            });
        }

        /**
         * Selects all data from table
         */
        , 'selectAll': function (table, cb) {
            cb = cb || function () {};
            var query = 'SELECT * FROM `' + table + '`';
            executeQuery(query, function(result, fields){cb(result);});
        },

        'updateIncrements' : function (cb) {
            cb = cb || function () {};

            var table = 'uincrements';
            var condition = { 'id' : 1 };
            gateway.selectFirst (table, condition, function (record) {
                gateway.update (table, {'uobject_last_id' : record.uobject_last_id + 1 }, condition, function () {
                    cb ();
                });
            });
        },

        'getIncrements' : function (cb) {
            cb = cb || function () {};

            var table = 'uincrements';
            var condition = { 'id' : 1 };
            gateway.selectFirst (table, condition, function (record) {
                console.log (record);
                cb (record.uobject_last_id + 1);
            });
        },

        'insertRecordTree' : function (recordsArray, cb) {
            cb = cb || function () {};
            recordsArray.sort (function (object, next) {
                return object.level < next.level;
            });

            var insertId, table, insertObject;
            var currentArrayIndex = 0;
            var callback = function () {
                if (currentArrayIndex == recordsArray.length) {
                    cb ();
                    return;
                }
                table = recordsArray[currentArrayIndex].name;
                insertObject = recordsArray[currentArrayIndex].fields;
                insertObject.id = insertId;
                gateway.insert (table, insertObject, function () {
                    currentArrayIndex ++;
                    callback ();
                });
            };

            gateway.getIncrements (function (__insertId) {
                insertId = __insertId;
                callback ();
                gateway.updateIncrements ();
            });
        },

        'selectRecordTree' : function (recordsArray, recordId, cb) {
            cb = cb || function () {};
            var table;
            var currentArrayIndex = 0;

            var condition = {};
            condition.id = recordId;

            var callback = function () {
                if (currentArrayIndex == recordsArray.length) {
                    cb (recordsArray);
                    return;
                }
                table = recordsArray[currentArrayIndex].name;
                gateway.select (table, condition, function (records) {
                    recordsArray[currentArrayIndex].exportedFields = records[0];
                    currentArrayIndex ++;
                    callback ();
                });
            };
            callback ();
        },

        'updateRecordTree' : function (recordsArray, condition, cb) {
            cb = cb || function () {};
            var table, fieldToUpdate;
            var currentArrayIndex = 0;

            var callback = function () {
                if (currentArrayIndex == recordsArray.length) {
                    cb ();
                    return;
                }
                table = recordsArray[currentArrayIndex].name;
                fieldToUpdate = recordsArray[currentArrayIndex].fields;
                gateway.update (table, fieldToUpdate, condition, function (records) {
                    currentArrayIndex ++;
                    callback ();
                });
            };
            callback ();
        },

        'deleteRecordTree' : function (recordId, cb) {
            cb = cb || function () {};

            var table = 'uobject';
            var query =
                "DELETE FROM `" + table + "` WHERE " +
                "id=" + recordId + " OR major=" + recordId;

            gateway.execute (query, cb);
        }
    };

	return gateway;
}