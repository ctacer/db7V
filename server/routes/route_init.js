

module.exports = function ( app ) {

    var routeConfig = registry.get ("config" ).routes.paths;
    var requestRouteConfig = registry.get ("config" ).routes.requests;
    var postRouteConfig = registry.get ("config" ).routes.postRequests;
    var routes = registry.get ("mainRoute" );
    var requestRoutes = registry.get ("requestRoute" );
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
    for ( var key in requestRouteConfig ) {
        if ( !requestRouteConfig.hasOwnProperty (key) || !requestRoutes.hasOwnProperty (key) ) continue;
        app.get ( mainRouteComponent + requestRouteConfig[key], requestRoutes[key] );
    }

    for ( var key in postRouteConfig ) {
        if ( !postRouteConfig.hasOwnProperty (key) || !requestRoutes.hasOwnProperty (key) ) continue;
        app.post ( mainRouteComponent + postRouteConfig[key], requestRoutes[key] );
    }
};