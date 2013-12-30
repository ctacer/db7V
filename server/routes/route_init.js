

module.exports = function ( app ) {

    var routeConfig = registry.get ("config" ).routes.paths;
    var requestRouteConfig = registry.get ("config" ).routes.requests;
    var routes = registry.get ("mainRoute" );
    var mainRouteComponent = registry.get ("config" ).mainRouteComponent;

    /**
     * initialize path routes
     */
    for ( var key in routeConfig ) {
        if ( !routeConfig.hasOwnProperty (key) || !routes.hasOwnProperty (key) ) continue;
        app.get ( mainRouteComponent + routeConfig[key], routes[key] );
    }

    /**
     * initialize request routes
     */

};