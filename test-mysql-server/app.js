
registry = require ( __dirname + "/utils/registry.js" );

var express = require('express');
var bodyParser = require('body-parser');

var app = express();

registry.set ("config", require ( __dirname + "/config.js"));
registry.set ("dbConfig", require (__dirname + "/db/university.config.js"));
registry.set ("universityProto", require (__dirname + "/db/university_proto.js"));
registry.set ("rootDirname", __dirname );

registry.set ("http", require ("http") );
registry.set ("mysqlPool", require ("mysql-pool") );

registry.set ("routeInitializer", require ( __dirname + "/routes/route_init.js" ) );
registry.set ("mainRoute", require (__dirname + "/routes/pathRoutes.js") );
registry.set ("requestRoute", require (__dirname + "/routes/requestRoutes.js") );

registry.set ("dbGateway", require (__dirname + "/db/db_gateway.js") ( registry.get ("config") ) );

app.set ('port', registry.get ("config" ).server.port );

app.use(express.static('public'))
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());

app.get( registry.get ("config" ).routes.mainRouteComponent + "/status", registry.get ("mainRoute" ).getStatus );

app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "http://localhost:3000");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  next();
});

registry.get ("routeInitializer") (app);

registry.get ("http").createServer(app).listen(app.get('port'), function(){
  console.log ( "server is listening on port " + app.get('port') );
});