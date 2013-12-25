

var config = {
    "production" : {
        "server" : {
            "host" : "http://localhost",
            "port" : 3000
        },
        "mainRouteComponent" : ""
    },
    "development" : {
        "mainRouteComponent" : "/dev"
    },
    "testing" : {
        "mainRouteComponent" : "/test"
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