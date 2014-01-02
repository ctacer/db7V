

var templateBuilder = (function () {

    var config;
    var template;

    var init = function (__config, templateReceived) {
        config = __config;

        loadTemplates (templateReceived);
    };

    var loadTemplates = function (cb) {
        var url = helper.ajax.buildUrl (config, config.server.routes.getTemplate);
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
        currentAppendy.empty ();
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
                objectElement.find ("." + config.css.collapsableContent )
                    .text ( objects[i][uObjectMappings.name] )
                    .attr ( "data-id", objects[i][uObjectMappings.id] )
                    .attr ( "data-class", objects[i][uObjectMappings.class] );

                currentAppendy.append (objectElement);
            }
        }

    };

    var builFormFooter = function (elementToShow) {
        var footer = $ ('.' + config.css.dbManagmentFooter);
        footer.removeClass (config.css.hidden);
        footer.find ("." + config.css.dbManagmentBtn ).addClass (config.css.hidden);
        footer.find ("#" + elementToShow ).removeClass (config.css.hidden);
        footer.find ("#" + config.css.dbManagmentCancelBtn ).removeClass (config.css.hidden);
    };

    var buildEditForm = function (tables, classObject, object) {
        appendObjectTemplates (tables, classObject, object, true);
        builFormFooter (config.css.dbManagmentEditBtn);
    };

    var appendObjectTemplates = function ( tables, classObject, object, toFill) {
        var appendy = $ ('.' + config.css.dbManagmentBody);
        appendy.empty ();

        var field, browseBtn, editableField, valueToFill = '';
        var major = object.name;
        if (toFill) {
            major = treeViewController.getObjects ({ id : object.major })[0];
            if (major) major = major.name;
            else major = object.name;
        }
        for (var i = tables.length - 1; i >= 0; i --) {
            for (var key in tables[i].fields ) {
                if ( toFill ) valueToFill = tables[i].fields[key];

                editableField = "<div data-field=\"" + key + "\" contenteditable=\"true\" class=\"" + config.css.fieldElement + " " + config.css.floatLeft + "\">" + valueToFill + "</div>";

                if ( !tables[i].fields.hasOwnProperty (key) || key == "id" ) continue;
                if (tables[i].name == "uobject" && key == 'class' ) {
                    editableField = "<div data-id=\"" + classObject.id + "\" data-field=\"" + key + "\" class=\"" + config.css.fieldElement + " " + config.css.floatLeft + " " + config.css.uneditableField + "\">" + classObject.name + "</div>";
                }
                if (tables[i].name == "uobject" && key == 'major' ) {
                    editableField = "<div data-id=\"" + object.id + "\" data-field=\"" + key + "\" class=\"" + config.css.fieldElement + " " + config.css.floatLeft + " " + config.css.uneditableField + "\">" + major + "</div>";
                }

                browseBtn = '';
                if (config.serverData.fieldReferences.hasOwnProperty (tables[i].name) && key == config.serverData.fieldReferences[tables[i].name]) {
                    browseBtn = "<div class=\"" + config.css.dbManagmentFieldBrowseBtn + " " + config.css.floatLeft + "\">...</div>";
                }

                field =
                    "<div class=\"" + config.css.fieldContainer + "\" data-table=\"" + tables[i].name + "\">" +
                        "<div class=\"" + config.css.fieldLabel + " " + config.css.floatLeft + "\">" + key + "</div>" +
                        editableField +
                        browseBtn +
                        "<div class=\"" + config.css.floatClear + "\"></div>" +
                    "</div>";
                appendy.append ( $ (field) );
            }
        }
    };

    var buildInsertForm = function (data, classObject, object) {
        appendObjectTemplates (data.tables, classObject, object, false);
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
        "buildDeleteForm" : buildDeleteForm
    };

}) ();