
registry = require ( __dirname + "/utils/registry.js" );

var express = require('express');
var app = express();

registry.set ("config", require ( __dirname + "/config/server.config.js") ( app.get ("env") ) );
registry.set ("rootDirname", __dirname );
registry.set ("http", require ("http") );
registry.set ("mainRoute", require (__dirname + "/routes/mainRoute.js") );

app.set ('port', registry.get ("config" ).server.port );
app.set ('views', __dirname + '/views');

app.use(express.static('public'))
app.use(express.json());
app.use(express.urlencoded());

// development only
if ('development' == app.get('env')) {
    app.use(express.errorHandler());
}

app.get( registry.get ("config" ).mainRouteComponent + "/status", registry.get ("mainRoute" ).getStatus );
app.get( registry.get ("config" ).mainRouteComponent + "/index", registry.get ("mainRoute" ).getHomePage );

registry.get ("http").createServer(app).listen(app.get('port'), function(){
    console.log ( "server is listening on port " + app.get('port') );
    console.log ( "server is running in " + app.get ("env") + " mode" );
    console.log ( "server is running with configuration:\n", registry.get ("config") );
});
