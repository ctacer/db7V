

var treeViewController = ( function () {

    var config ;
    var classes = {};
    var uObjects = {};

    var init = function (__config) {
        config = __config;

        loadData ();
    };

    var loadData = function () {
        // helper.ajax.get ( helper.ajax.buildUrl(config.server.locations.server1, config.server.routes.getObjects), objectsReceived('server1') );
        helper.ajax.get ( helper.ajax.buildUrl(config.server.locations.server1, config.server.routes.getClasses), function (classes) {
            classesReceived('server1') (classes);
            helper.ajax.get ( helper.ajax.buildUrl(config.server.locations.server1, config.server.routes.getObjects), objectsReceived('server1') );
        });

        // helper.ajax.get ( helper.ajax.buildUrl(config.server.locations.server2, config.server.routes.getObjects), objectsReceived('server2') );
        // helper.ajax.get ( helper.ajax.buildUrl(config.server.locations.server2, config.server.routes.getClasses), classesReceived('server2') );
        helper.ajax.get ( helper.ajax.buildUrl(config.server.locations.server2, config.server.routes.getClasses), function (classes) {
            classesReceived('server2') (classes);
            helper.ajax.get ( helper.ajax.buildUrl(config.server.locations.server1, config.server.routes.getObjects), objectsReceived('server2') );
        });
    };

    var rerfeshObjects = function () {
        helper.ajax.get ( helper.ajax.buildUrl(config.server.locations.server1, config.server.routes.getObjects), objectsReceived('server1') );
        helper.ajax.get ( helper.ajax.buildUrl(config.server.locations.server2, config.server.routes.getObjects), objectsReceived('server2') );
    };

    var objectsReceived = function (server) {
        return function (objects) {
            uObjects[server] = objects;
            templateBuilder.buildTreeView (objects, { server: server });
            intiUI ();
        };
    };

    /**
     * function parses classe children property
     * replace id of children with class name
     */
    var replaceIdsWithClassNames = function () {
        var child;
        var activeServer = dbManager.getServer();
        for (var server in classes) {
            for ( var id in classes[server] ) {
                for (var j = 0; j < classes[server][id].children.length; j ++) {
                    child = classes[server][id].children[j];
                    if ( classes[server][child] ) {
                        classes[server][id].children[j] = {
                            "id" : child,
                            "name" : classes[server][child].name
                        };
                    }
                }
            }
        }
    };

    /**
     * function callback , will be called when all classes are loaded from server
     * @param responseClasses
     */
    var classesReceived = function (server) {
        return function (responseClasses) {
            console.log(responseClasses);
            var classesMappings = config.serverData.classes;
            var key, children;
            classes[server] = {};
            for (var i = 0; i < responseClasses.length; i ++ ) {
                key = responseClasses[i][classesMappings.id];
                children = responseClasses[i][classesMappings.children];
                if ( !children ) children = "";

                children = children.split (/\s+/);
                classes[server][key] = {
                    "id" : key,
                    "name" : responseClasses[i][classesMappings.name],
                    "children" : children
                };
            }

            replaceIdsWithClassNames ();
            dbManager.setClasses (classes[server], server);
        };
    };

    var intiUI = function () {
        initSelectNode ();
        setTriggerHandlers ( $ ("#" + config.css.leftContainer) );
    };

    var setTriggerHandlers = function (content) {
        var triggers = content.find ("." + config.css.collapsableTrigger);
        var triggerClick = function () {
            var parent = $ (this).parent ();
            parent.find ("." + config.css.collapsableChild).toggleClass (config.css.hidden);
            $ (this).toggleClass (config.css.active);
        };
        triggers.off ('click').on ('click', triggerClick);
    };

    var initSelectNode = function () {
        var treeNodes = $ ("#" + config.css.leftContainer + " ." + config.css.collapsableContent);
        var treeViewClicked = function () {
            treeNodes.removeClass (config.css.selectedText);
            $ (this).addClass (config.css.selectedText);
        };
        treeNodes.click (treeViewClicked);
    };

    var getObjectsById = function (conditionId, parentServer) {
        var returnObjects = [];
        var activeServer = dbManager.getServer();
        if ( !conditionId ) return uObjects[activeServer];


        for (var i = 0; i < uObjects[activeServer].length; i ++) {
            if ( uObjects[activeServer][i].id == conditionId ) {
                returnObjects.push (uObjects[activeServer][i]);
            }
        }
        
        if (!returnObjects.length && parentServer) {
            for (var i = 0; i < uObjects[parentServer].length; i ++) {
                if ( uObjects[parentServer][i].id == conditionId ) {
                    returnObjects.push (uObjects[parentServer][i]);
                }
            }
        }
        return returnObjects;
    };

    var uploadNewServer = function (link) {
        config.server.locations[link] = { host: link, label: link };
        // config.css[link] = link;
        helper.ajax.get ( helper.ajax.buildUrl(link, config.server.routes.getObjects), objectsReceived(link) );
        helper.ajax.get ( helper.ajax.buildUrl(link, config.server.routes.getClasses), classesReceived(link) );
    };

    return {
        "initialize" : init,
        "getObjectsById" : getObjectsById,
        "rerfeshObjects" : rerfeshObjects,
        "setTriggerHandlers" : setTriggerHandlers,
        "uploadNewServer" : uploadNewServer
    }
} ) ();