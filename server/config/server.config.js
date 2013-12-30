

var config = {
    "production" : {
        "server" : {
            "host" : "http://localhost",
            "port" : 3000
        },
        "dbConnection" : {
            "host" : 'localhost',
            "port" : 3306,
            "user" : 'web',
            "pass" : 'qwerty',
            "dbName" : 'university'
        },
        "mainRouteComponent" : "",
        "routes" : {
            "requests" : {},
            "paths" : {
                "homePage" : "/index"
            }
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