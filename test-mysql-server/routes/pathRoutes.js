
module.exports.getStatus = function (req, res) {
    var serverStatus = ( "server is listening on port " + registry.get ("config" ).server.port + "</br>" );
    serverStatus += ( "server is running with configuration:\n", JSON.stringify (registry.get ("config" ) ) + "</br>" );
    res.send ( serverStatus );
};