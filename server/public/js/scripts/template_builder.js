

var templateBuilder = (function () {

    var config;
    var template;

    var init = function (__config, templateReceived) {
        config = __config;

        loadTemplates (templateReceived);
    };

    var loadTemplates = function (cb) {
        var url = helper.ajax.buildUrl (config, config.server.routes.getTemplate);
        url += config.server.templates.treeView;
        var templateCallback = function (data) {
            if ( !data.err ) {
                template = data;
            }
            cb ();
        };
        helper.ajax.get ( url, templateCallback );
    };

    var sortObjects = function (objectsToSort) {
        var mappings = config.serverData.uObjects;
        objectsToSort.sort (function (object, next) {
            return object[mappings.major] > next[mappings.major];
        });
    };

    var buildTreeView = function (objects) {
        var uObjectMappings = config.serverData.uObjects;
        var objectElement = jQuery (template);
        sortObjects (objects);

        var currentAppendy = $ ('#' + config.css.treeViewContainer);
        var currentMajor, preventMajor = 0;

        for (var i = 0; i < objects.length; i ++) {
            objectElement = jQuery (template);
            currentMajor = objects[i][uObjectMappings.major];
            if ( currentMajor == preventMajor ) {
                objectElement.find ("." + config.css.collapsableContent )
                    .text ( objects[i][uObjectMappings.name] )
                    .attr ( "data-id", objects[i][uObjectMappings.id] )
                    .attr ( "data-class", objects[i][uObjectMappings.class] );

                currentAppendy.append (objectElement);
            }
            else {
                preventMajor = currentMajor;
                currentAppendy = $ ("." + config.css.collapsableContent + "[data-id='" + currentMajor + "']" ).next ();
            }
        }

    };

    var buildInsertForm = function (classesToBuild) {
        console.log (classesToBuild);

        var selectElement = $ ("#" + config.css.recordType);
        var optionTemplate;

        for ( var i = 0; i < classesToBuild.length; i ++ ) {
            optionTemplate = "<option value='" + classesToBuild[i].id + "'>" + classesToBuild[i].name + "</option>";
            selectElement.append ( $ (optionTemplate) );
        }
    };

    var buildInsertClasses = function (object) {
        console.log (object);
    };

    return {
        "initialize" : init,
        "buildTreeView" : buildTreeView,
        "buildInsertClasses" : buildInsertClasses,
        "buildInsertForm" : buildInsertForm
    };

}) ();