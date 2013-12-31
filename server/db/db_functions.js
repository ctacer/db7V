/**
 * Custom queries to DB
 * @return
 */
module.exports = function(config){
    var mysql = require('mysql');
    var MySQLPool = require("mysql-pool").MySQLPool;
    var dbGateway = require("./db_gateway.js")(config);

    var client = new MySQLPool({
        poolSize: 4,
        user:     config.db.user,
        password: config.db.password,
        database: config.db.dbName
    });

    var dbFunctions = {

    };
    return dbFunctions;
};