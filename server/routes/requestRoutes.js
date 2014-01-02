
var getTablesByReference = function (currentClass, universityProto) {
    var tables = [];
    var references = [];
    var currentReference, table;
    var currentLevel = 0;

    while ( currentClass && universityProto.fields.hasOwnProperty (currentClass) ) {
        table = {};
        table.level = currentLevel;
        table.name = currentClass;
        table.fields = universityProto.fields[currentClass];
        tables.push ( table );
        currentReference = universityProto.references[currentClass];
        if (currentReference.hasOwnProperty ("id")) {
            references.push (currentReference);
            currentClass = currentReference.id.table;
        }
        else {
            currentClass = null;
        }
        currentLevel ++;
    }

    return { 'tables' : tables, 'references' : references };
};

module.exports.selectObjects = function (req, res) {

    var tableName = registry.get ("dbConfig" ).tables["uobject"];
    registry.get ("dbGateway" ).select (tableName, void 0, function (data) {
        res.send (data);
    });
};

module.exports.selectClasses = function (req, res) {

    var tableName = registry.get ("dbConfig" ).tables["classes"];
    registry.get ("dbGateway" ).select (tableName, void 0, function (data) {
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

module.exports.getInsertFields = function (req, res) {
    var currentClass = req.query.class;
    var universityProto = registry.get ("universityProto");

    if (!currentClass || !universityProto.fields.hasOwnProperty (currentClass)) {
        res.send ( { 'err' : true, 'msg' : 'invalid request' } );
        return;
    }
    res.send ( getTablesByReference (currentClass, universityProto) );
};

module.exports.insertObject = function (req, res) {
    var tables = req.body.data;
    if (!tables || !tables.length) {
        res.send ({ 'err' : true });
        return;
    }
    registry.get ('dbGateway').insertRecordTree (tables, function (result) {
        res.send ({ 'ok' : true });
    });
};

module.exports.getEditFields = function (req, res) {
    var currClass = req.query.class;
    var currRecordId = req.query.id;
    if (!currClass || !currRecordId) {
        res.send ( { 'err' : true, 'msg' : 'invalid request' } );
        return;
    }
    var availableData = getTablesByReference (currClass, registry.get ("universityProto"));
    registry.get ('dbGateway').selectRecordTree (availableData.tables, currRecordId, function (resultedTables) {
        res.send (resultedTables);
    } );
};

module.exports.updateObject = function (req, res) {
    var tables = req.body.data;
    var condition = {};
    condition.id = req.body.objectId;
    if (!tables || !tables.length || !condition.id) {
        res.send ({ 'err' : true });
        return;
    }
    registry.get ('dbGateway').updateRecordTree (tables, condition, function (result) {
        res.send ({ 'ok' : true });
    });
};

module.exports.deleteObject = function (req, res) {
    var currObjectId = req.body.id;

    if (!currObjectId) {
        res.send ({ 'err' : true });
        return;
    }
    registry.get ('dbGateway').deleteRecordTree ( currObjectId, function (result) {
        res.send ({ 'ok' : true });
    });
};