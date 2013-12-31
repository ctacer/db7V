

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