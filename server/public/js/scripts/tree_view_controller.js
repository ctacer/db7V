

var treeViewController = ( function () {

    var config ;
    var classes = {};
    var uObjects = [];

    var init = function (__config) {
        config = __config;

        loadData ();
    };

    var loadData = function () {
        helper.ajax.get ( helper.ajax.buildUrl(config, config.server.routes.getObjects), objectsReceived );
        helper.ajax.get ( helper.ajax.buildUrl(config, config.server.routes.getClasses), classesReceived );
    };

    var rerfeshObjects = function () {
        helper.ajax.get ( helper.ajax.buildUrl(config, config.server.routes.getObjects), objectsReceived );
    };

    var objectsReceived = function (objects) {
        uObjects = objects;
        console.log (uObjects);
        templateBuilder.buildTreeView (objects);
        intiUI ();
    };

    /**
     * function parses classe children property
     * replace id of children with class name
     */
    var replaceIdsWithClassNames = function () {
        var child;
        for ( var id in classes ) {
            for (var j = 0; j < classes[id].children.length; j ++) {
                child = classes[id].children[j];
                if ( classes[child] ) {
                    classes[id].children[j] = {
                        "id" : child,
                        "name" : classes[child].name
                    };
                }
            }
        }
    };

    /**
     * function callback , will be called when all classes are loaded from server
     * @param responseClasses
     */
    var classesReceived = function (responseClasses) {
        var classesMappings = config.serverData.classes;
        var key, children;
        for (var i = 0; i < responseClasses.length; i ++ ) {
            key = responseClasses[i][classesMappings.id];
            children = responseClasses[i][classesMappings.children];
            if ( !children ) children = "";

            children = children.split (/\s+/);
            classes[key] = {
                "id" : key,
                "name" : responseClasses[i][classesMappings.name],
                "children" : children
            };
        }

        replaceIdsWithClassNames ();
        dbManager.setClasses (classes);
    };

    var intiUI = function () {
        initSelectNode ();
    };

    var initSelectNode = function () {
        var treeNodes = $ ("#" + config.css.leftContainer + " ." + config.css.collapsableContent);
        var treeViewClicked = function () {
            treeNodes.removeClass (config.css.selectedText);
            $ (this).addClass (config.css.selectedText);
        };
        treeNodes.click (treeViewClicked);
    };

    var getObjects = function (condition) {
        var returnObjects = [];
        if ( !condition ) return uObjects;

        for (var i = 0; i < uObjects.length; i ++) {
            for (var key in condition) {
                if (uObjects[i].hasOwnProperty (key) && uObjects[i][key] == condition[key] ) {
                    returnObjects.push (uObjects[i]);
                }
            }
        }
        return returnObjects;
    };

    return {
        "initialize" : init,
        "getObjects" : getObjects,
        "rerfeshObjects" : rerfeshObjects
    }
} ) ();