

var config = {
    "production" : {
        "server" : {
            "host" : "http://localhost",
            "port" : 3000
        },
        "db" : {
            "host" : 'localhost',
            "port" : 3306,
            "user" : 'web',
            "password" : 'qwerty',
            "dbName" : 'university2.0.',
            "poolSize" : 4
        },
        "mainRouteComponent" : "",
        "routes" : {
            "requests" : {
                "selectObjects" : "/get/objects",
                "selectClasses" : "/get/classes",
                "getTemplate" : "/get/template",
                "getInsertFields" : "/get/fields",
                "getEditFields" : "/get/edit_fields"
            },
            "postRequests" : {
                "insertObject" : "/post/object",
                "updateObject" : "/update/object",
                "deleteObject" : "/delete/object"
            },
            "paths" : {
                "homePage" : "/index"
            }
        },
        "templates" : {
            "tree_view" : "/views/templates/tree_view_template.html"
        }
    },
    "development" : {
    }
};
/**
 * function generates new config based on given enviroment type
  * @param type
 * @returns {{}}
 */
var generateConfig = function ( type ) {
    var productionConfig = config["production"];
    var requestedConfig = config[type] || config["development"];
    var result = {};

    for ( var key in productionConfig ) {
        result[key] = productionConfig[key];
        if ( productionConfig.hasOwnProperty (key) && requestedConfig.hasOwnProperty (key) ) {
            result[key] = requestedConfig[key];
        }
    }

    return result;
};

module.exports = generateConfig;