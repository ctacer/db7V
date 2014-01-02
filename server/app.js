
registry = require ( __dirname + "/utils/registry.js" );

var express = require('express');
var app = express();

registry.set ("config", require ( __dirname + "/config/server.config.js") ( app.get ("env") ) );
registry.set ("dbConfig", require (__dirname + "/config/universiity.db.config.js"));
registry.set ("universityProto", require (__dirname + "/db/university_proto.js"));
registry.set ("rootDirname", __dirname );

registry.set ("http", require ("http") );
registry.set ("mysqlPool", require ("mysql-pool") );

registry.set ("routeInitializer", require ( __dirname + "/routes/route_init.js" ) );
registry.set ("mainRoute", require (__dirname + "/routes/pathRoutes.js") );
registry.set ("requestRoute", require (__dirname + "/routes/requestRoutes.js") );

registry.set ("dbGateway", require (__dirname + "/db/db_gateway.js") ( registry.get ("config") ) );

app.set ('port', registry.get ("config" ).server.port );
app.set ('views', __dirname + '/views');

app.use(express.static('public'))
app.use(express.json());
app.use(express.urlencoded());

// development only
if ('development' == app.get('env')) {
    app.use(express.errorHandler());
}

app.get( registry.get ("config" ).routes.mainRouteComponent + "/status", registry.get ("mainRoute" ).getStatus );
registry.get ("routeInitializer") (app);

registry.get ("http").createServer(app).listen(app.get('port'), function(){
    console.log ( "server is listening on port " + app.get('port') );
    console.log ( "server is running in " + app.get ("env") + " mode" );
    console.log ( "server is running with configuration:\n", registry.get ("config") );
});
