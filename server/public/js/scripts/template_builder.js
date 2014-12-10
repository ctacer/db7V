

var templateBuilder = (function () {

    var config;
    var template;

    var init = function (__config, templateReceived) {
        config = __config;

        loadTemplates (templateReceived);
    };

    var loadTemplates = function (cb) {
        var url = helper.ajax.buildUrl (config.server.locations.home, config.server.routes.getTemplate);
        url += config.server.requestParams.treeView;
        var templateCallback = function (data) {
            if ( !data.err ) {
                template = data;
            }
            cb ();
        };
        helper.ajax.get ( url, templateCallback );
    };

    var sortObjects = function (objectsToSort) {
        //var mappings = config.serverData.uObjects;
        /*var ret = [];
        var currentMin = objectsToSort[0].major, deviation = 1000;

        for (var i = 0; i < objectsToSort.length; i ++) {
            for (var j = 0; j < objectsToSort.length; j ++) {
                for (var k = 0; k < objectsToSort.length; k ++) {
                    if (objectsToSort[k].major < currentMin ) {
                        currentMin = objectsToSort[k].major;
                    }
                }
                if ( objectsToSort[j].major == currentMin ) {
                    ret.push (objectsToSort[j]);
                }
            }
        }
        return ret;*/

        objectsToSort.sort (function (object, next) {
            //console.log (mappings.major, object[mappings.major], next[mappings.major]);
            //if (object[mappings.major] == 0) return true;
            console.log (object.major,next.major, object.major > next.major);
            if ( parseInt (object.major) > parseInt (next.major) ) {
                return 1;
            }
            else if (parseInt (object.major) < parseInt (next.major) ) {
                return -1;
            }
            else {
                return 0;
            }
        });
    };

    var buildTreeView = function (objects, opts) {
        opts = opts || {};
        
        var uObjectMappings = config.serverData.uObjects;
        var objectElement = jQuery (template);
        sortObjects (objects);

        var currentAppendy = $ ('#' + config.css[opts.server]);
        if (currentAppendy.length == 0) {
            currentAppendy = $('[data-link-server="' + opts.server + '"]').find('.collapsable-child');
        }
        currentAppendy.attr('data-server', opts.server);
        currentAppendy.empty ();
        var currentMajor, preventMajor = 0;

        for (var i = 0; i < objects.length; i ++) {
            objectElement = jQuery (template);
            if (objects[i].class == 37) {
                objectElement.attr('data-link-server', objects[i].name);
            }
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
                // currentAppendy = $ (config.css[opts.server] ? ('#' + config.css[opts.server]) : ('[data-link-server="' + opts.server + '"]') + " ." + config.css.collapsableContent + "[data-id='" + currentMajor + "']" ).next ();
                currentAppendy = $ ('#' + config.css[opts.server] + " ." + config.css.collapsableContent + "[data-id='" + currentMajor + "']" ).next ();
                if (!config.css[opts.server]) {
                    currentAppendy = $('[data-link-server="' + opts.server + '"]' + " ." + config.css.collapsableContent + "[data-id='" + currentMajor + "']" ).next ();
                }
                objectElement.find ("." + config.css.collapsableContent )
                    .text ( objects[i][uObjectMappings.name] )
                    .attr ( "data-id", objects[i][uObjectMappings.id] )
                    .attr ( "data-class", objects[i][uObjectMappings.class] );

                currentAppendy.append (objectElement);
            }
            if (objects[i].class == 37) {
                treeViewController.uploadNewServer(objects[i].name);
            }
        }

        $ ('#' + config.css['leftContainer']).find('*').off('click').on('click', function (event) {
            event.preventDefault();
            var server;
            if ($(this).attr('data-server')) {
                server = $(this).attr('data-server');
            }
            else if ($(this).attr('data-link-server')) {
                server = $(this).attr('data-link-server');
            }
            else if ($(this).parents('[data-link-server]').length) {
                server = $(this).parents('[data-link-server]').attr('data-link-server');
            }
            else if ($(this).parents('[data-server]').length) {
                server = $(this).parents('[data-server]').attr('data-server');
            }
            if (server) {
                dbManager.switchServer(server);
            }
            return false;
        });

    };

    var builFormFooter = function (elementToShow) {
        var footer = $ ('.' + config.css.dbManagmentFooter);
        footer.removeClass (config.css.hidden);
        footer.find ("." + config.css.dbManagmentBtn ).addClass (config.css.hidden);
        if ( elementToShow ) {
            footer.find ("#" + elementToShow ).removeClass (config.css.hidden);
        }
        footer.find ("#" + config.css.dbManagmentCancelBtn ).removeClass (config.css.hidden);
    };

    var buildEditForm = function (tables, classObject, object) {
        appendObjectTemplates (tables, classObject, object, {toFill : true});
        builFormFooter (config.css.dbManagmentEditBtn);
    };

    var buildInfoForm = function (tables, classObject, object) {
        appendObjectTemplates (tables, classObject, object, {toFill: true, justShow: true});
        builFormFooter ();
    };

    var appendObjectTemplates = function ( tables, classObject, object, appendOptions) {
        var appendy = $ ('.' + config.css.dbManagmentBody);
        appendy.empty ();

        var field, browseBtn, editableField, label, valueToFill = '';
        var major = object.name;
        var additionalAttributes = "contenteditable=\"true\"";

        if (appendOptions && appendOptions.toFill) {
            major = treeViewController.getObjectsById (object.major)[0];
            if (major) major = major.name;
            else major = object.name;
        }
        for (var i = tables.length - 1; i >= 0; i --) {
            for (var key in tables[i].fields ) {
                if ( appendOptions && appendOptions.toFill ) valueToFill = tables[i].fields[key];
                if ( appendOptions && appendOptions.justShow ) additionalAttributes = '';

                editableField = "<div data-field=\"" + key + "\" " + additionalAttributes + " class=\"" + config.css.fieldElement + " " + config.css.floatLeft + "\">" + valueToFill + "</div>";

                if ( !tables[i].fields.hasOwnProperty (key) || key == "id" ) continue;
                if (tables[i].name == "uobject" && key == 'class' ) {
                    editableField = "<div data-id=\"" + classObject.id + "\" data-field=\"" + key + "\" class=\"" + config.css.fieldElement + " " + config.css.floatLeft + " " + config.css.uneditableField + "\">" + classObject.name + "</div>";
                }
                if (tables[i].name == "uobject" && key == 'major' ) {
                    editableField = "<div data-id=\"" + object.id + "\" data-field=\"" + key + "\" class=\"" + config.css.fieldElement + " " + config.css.floatLeft + " " + config.css.uneditableField + "\">" + major + "</div>";
                }

                browseBtn = '';
                if ( (!appendOptions || !appendOptions.justShow) && config.serverData.fieldReferences.hasOwnProperty (tables[i].name) && key == config.serverData.fieldReferences[tables[i].name]) {
                    browseBtn = "<div class=\"" + config.css.dbManagmentFieldBrowseBtn + " " + config.css.floatLeft + "\">...</div>";
                }
                label = config.translation[key];
                if ( !label ) label = key;

                field =
                    "<div class=\"" + config.css.fieldContainer + "\" data-table=\"" + tables[i].name + "\">" +
                        "<div class=\"" + config.css.fieldLabel + " " + config.css.floatLeft + "\">" + label + "</div>" +
                        editableField +
                        browseBtn +
                        "<div class=\"" + config.css.floatClear + "\"></div>" +
                    "</div>";
                appendy.append ( $ (field) );
            }
        }
    };

    var buildInsertForm = function (data, classObject, object) {
        appendObjectTemplates (data.tables, classObject, object);
        builFormFooter (config.css.dbManagmentInsertBtn);
    };

    var buildInsertClasses = function (classesToBuild) {
        var selectElement = $ ("#" + config.css.recordType);
        var optionTemplate;

        selectElement
            .empty ()
            .append ( $ ("<option>choose object type</option>") );
        for ( var i = 0; i < classesToBuild.length; i ++ ) {
            optionTemplate = "<option value='" + classesToBuild[i].id + "'>" + classesToBuild[i].name + "</option>";
            selectElement.append ( $ (optionTemplate) );
        }
    };

    var buildDeleteForm = function (objectToDelete) {
        var appendy = $ ('.' + config.css.dbManagmentBody);
        appendy.empty ();
        appendy.append ( $ ("<div class=\"\">Are u sure ? You are trying to delete " + objectToDelete.name +" object and all it's childrens</div>") );
        builFormFooter (config.css.dbManagmentDeleteBtn);
    };

    return {
        "initialize" : init,
        "buildTreeView" : buildTreeView,
        "buildInsertClasses" : buildInsertClasses,
        "buildInsertForm" : buildInsertForm,
        "buildEditForm" : buildEditForm,
        "buildInfoForm" : buildInfoForm,
        "buildDeleteForm" : buildDeleteForm
    };

}) ();