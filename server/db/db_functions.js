/**
 * Custom queries to DB
 * @return
 */
module.exports = function(){
    var mysql = require('mysql');
    var MySQLPool = require("mysql-pool").MySQLPool;
    var dbGateway = require("./db_gateway.js")();

    var client = new MySQLPool({
        poolSize: 4,
        user:     SC.config.db.user,
        password: SC.config.db.password,
        database: SC.config.db.dbName
    });

    var __tables = [{id: "t_category",name: "category"}
        ,{id: "t_color", name: "color"}
        ,{id: "t_manufacturer", name: "manufacturer"}
        ,{id: "t_model", name: "model"}]; 

    var dbFunctions = {
        'getById' : function (table, idKeyValue, cb){
            cb = cb || function () {};
            var query = 'SELECT * FROM `' + table + '` WHERE ';
            for(key in idKeyValue){
                query += '`' + key + '`= \'' +  global.DA.utils.addSlashes(idKeyValue[key]) + '\', ';
            }
            query = query.substr(0,query.length-2);
            client.query(query, function(error, result, fields){
                if (error){
                    throw error;
                }
                cb(result);
            });
        },
        /*
        *   method returns all rows of specified table
        */
        'getTableRows' : function (tableName, cb){
            dbGateway.select( tableName, false, cb );
        },
        /*
        *   method returns all rows of specified tables refers to getTableRows method
        */
        'getALL' : function(cb){
            cb = cb || function(){};

            var res = {}, id = 0;
            var self = this;

            function __loc(){
                //console.log(res,id);
                if(id < __tables.length ){
                    this.getTableRows( __tables[id].id ,function(result){
                        res[__tables[id].name] = result;
                        id++;
                        __loc.call(self);
                    });
                }
                else
                    cb(res);

            }
            __loc.call(self);
        },
        /*
        *   method select data from model,category,manufacturer tables relative to ralations between tables
        */
        'SelectModelByRelations' : function( manufacturerName, categoryName, cb){
            cb = cb || function(){};

            var query = 
                "SELECT " + 
                    "tm.id, " + 
                    "tm.model_name, " + 
                    "tm.t_manufacturer_id, " + 
                    "tm.t_category_id, " + 
                    "tmf.manufacturer_name, " + 
                    "tc.category_name " +
                " FROM t_model AS tm" +
                " LEFT JOIN t_manufacturer AS tmf" +
                    " ON tm.t_manufacturer_id=tmf.id" +
                " LEFT JOIN t_category AS tc" +
                    " ON tm.t_category_id=tc.id" +
                " WHERE " + 
                    " tc.category_name=" + "\"" + categoryName + "\"" + " AND " +
                    " tmf.manufacturer_name=" + "\"" + manufacturerName + "\"" + ";"

            dbGateway.execute( query, cb );
        },
        /*
        *   inserts data into tables with argument data = { 'tableColumnName' : 'somevar', ...}
        */
        'insertData' : function(table, data, cb){
            dbGateway.insertUpdate( table , data, cb );
        },
        /*
        *   check if record exist in table
        */
        'checkForMatch' : function( table, data, cb){
            dbGateway.selectFirst( table, data, cb);
        },
        /*
        *   inserts new product
        */
        'insertProduct' : function( table, data, cb){
            dbGateway.insertUpdate( table , data, cb );
        },
        /*
        *   get all images of specified product , data ~= {t_product_id: product id}
        */
        'getImages' : function( table, data, cb ){
            dbGateway.select( table, data, cb );
        },
        /*
        *   get all information about all products( model name, manufacturer name, category name ,creation time )
        */
        'getProduct' : function( cb ){
            var query = 
            //SELECT tp.id,tp.creation_time,tp.miscellaneous,tm.id AS model_id,tm.model_name,tmf.id AS manufacturer_id,tmf.manufacturer_name,
                "SELECT " +
                    "tp.id, " +
                    "tp.creation_time, " +
                    "tp.miscellaneous, " +
                    "tc.id AS category_id, " +
                    "tc.category_name, " +
                    "tm.model_name, " +
                    "tm.id AS model_id, " +
                    "tmf.manufacturer_name, " +
                    "tmf.id AS manufacturer_id, " +
                    "tcl.id AS color_id, " +
                    "tcl.color_name " +
                "FROM t_product AS tp " +
                "LEFT JOIN t_model AS tm " +
                    "ON tp.t_model_id=tm.id " +
                "LEFT JOIN t_manufacturer AS tmf " +
                    "ON tm.t_manufacturer_id=tmf.id " +
                "LEFT JOIN t_category AS tc " +
                    "ON tm.t_category_id=tc.id " +
                "LEFT JOIN t_color AS tcl " +
                    "ON tp.t_color_id=tcl.id;";
           dbGateway.execute( query, cb );
        }
    };
    return dbFunctions;
};