

module.exports.select = function (req, res) {

    var testTable = registry.get ("dbConfig" ).tables["uObject"];
    registry.get ("dbGateway" ).select (testTable, void 0, function (data) {
        res.send (data);
    });
};