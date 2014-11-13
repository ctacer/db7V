
var express = require('express');
var bodyParser = require('body-parser');
var http = require("http");

var app = express();

var config = require(__dirname + '/config.js');

app.set('port', config.server.port);
app.set('views', __dirname + '/views');

app.use(express.static('public'))
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());

app.get('/get/template', function (req, res) {
    var type = req.query.type;
    var templates = config.templates;

    if (!type) {
        res.send({ 'err' : true, 'msg' : 'invalid request' });
        return;
    }
    if (templates.hasOwnProperty(type)) {
        res.sendfile(__dirname + templates[type]);
    }
    else {
        res.send({ 'err' : true, 'msg' : 'type is not valid' });
    }
});

app.get('/', function (req, res) {
  res.sendfile(__dirname + "/views/index.html");
});

http.createServer(app).listen(app.get('port'), function(){
  console.log("server is listening on port " + app.get('port'));
});
