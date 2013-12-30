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

    };
    return dbFunctions;
};