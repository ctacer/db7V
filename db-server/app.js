
var express = require('express');
var bodyParser = require('body-parser');
var http = require("http");

var app = express();

var config = require(__dirname + "/config.js");
var db = require(__dirname + "/db.js");

app.set('port', config.server.port);

app.use(express.static('public'))
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());

app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  next();
});

app.get('/select', function (req, res) {
	var tableName = req.query.table;

	db.select(tableName, function(result) {
		res.send(result.rows);
	});
});

app.get('/where', function (req, res) {
	var tableName = req.query.table;
	var recordId = req.query.id;

	db[tableName](recordId, function (result) {
		res.send(result.rows);
	});
});

http.createServer(app).listen(app.get('port'), function(){
  console.log("server is listening on port " + app.get('port'));
});