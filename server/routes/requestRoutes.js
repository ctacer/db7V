

module.exports.selectObjects = function (req, res) {

    var tableName = registry.get ("dbConfig" ).tables["uobject"];
    registry.get ("dbGateway" ).select (tableName, void 0, function (data) {
        console.log (data);
        res.send (data);
    });
};

module.exports.selectClasses = function (req, res) {

    var tableName = registry.get ("dbConfig" ).tables["classes"];
    registry.get ("dbGateway" ).select (tableName, void 0, function (data) {
        console.log (data);
        res.send (data);
    });
};

module.exports.getTemplate = function (req, res) {
    var type = req.query.type;
    var templates = registry.get ("config" ).templates;

    if ( !type ) {
        res.send ( { 'err' : true, 'msg' : 'invalid request' } );
        return;
    }
    if ( templates.hasOwnProperty (type) ) {
        res.sendfile ( registry.get ("rootDirname") + templates[type] );
    }
    else {
        res.send ( { 'err' : true, 'msg' : 'type is not valid' } );
    }
};