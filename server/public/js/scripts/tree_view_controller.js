

var treeViewController = ( function () {

    var config ;
    var init = function (__config) {
        config = __config;

        loadData ();
        //initSelectNode ();
    };
    var buildUrl = function (route) {
        return config.server.protocol + config.server.host + config.server.port + route;
    };

    var loadData = function () {
        var dataReceived = function (res) {
            console.log (res);
        };
        loadDataByUrl ( buildUrl(config.server.routes.getObjects), dataReceived );
        loadDataByUrl ( buildUrl(config.server.routes.getClasses), dataReceived );
    };

    var loadDataByUrl = function (url, callback) {
        $.get (url ,callback);
    };

    var initSelectNode = function () {
        var treeNodes = $ ("." + config.css.collapsableContent);
        var treeViewClicked = function () {
            treeNodes.removeClass (config.css.selectedText);
            $ (this).addClass (config.css.selectedText);
        };
        treeNodes.click (treeViewClicked);
    };

    return {
        "initialize" : init
    }
} ) ();