

var dbManager = ( function () {

    var config, classes = {};
    var activeServer = 'server1';

    var init = function (__config) {
        config = __config;
    };

    var setClasses = function (__classes, server) {
        classes[server] = __classes;
    };

    var getAvailableClasses = function (object) {
        var currClassId = object[config.serverData.uObjects.class];
        var currClass = classes[activeServer][currClassId];
        return currClass.children;
    };

    var openInsertForm = function (objects) {
        console.log ("Inserting to", objects[0]);
        $ ('.' + config.css.dbManagmentHeader).removeClass (config.css.hidden);
        var availableClasses = getAvailableClasses (objects[0]);
        if ( !availableClasses || !availableClasses.length || !availableClasses[0]) {
            $ ("#" + config.css.homeBtn).trigger ('click');
            return;
        }
        templateBuilder.buildInsertClasses ( availableClasses );
        $ ('.' + config.css.dbManagmentBody).empty ();
        $ ('.' + config.css.dbManagmentFooter).addClass (config.css.hidden);
        setSelectHandler ( helper.js.clone (objects[0]) );
    };

    var getFieldsForClass = function (choosenClassObject, object) {
        var url = helper.ajax.buildUrl (config.server.locations[activeServer], config.server.routes.getInsertFields);
        url += config.server.requestParams.insertFields + choosenClassObject.name;
        var dataReceived = function (res) {
            if ( !res.tables || !res.references ) return;
            helper.js.sortByField (res.tables, "level");
            templateBuilder.buildInsertForm (res, choosenClassObject, object);
            setInsertButtonClick (res, object);
            setObjectBrowserEvents ();
            setCancelButtonClick ();
        };
        helper.ajax.get ( url, dataReceived );
    };

    var setSelectHandler = function (object) {
        var selector = "#" + config.css.recordType;
        var selectElement = $ (selector);
        var refObject;

        var classSelected = function () {
            var className = $ (selector + " option:selected").text ();
            refObject = mainController.getSelectedObject ()[0];
            console.log (object, refObject);
            getFieldsForClass ( { 'name' :className, 'id' : $ (this).val () }, refObject);
        };

        selectElement.change ( classSelected );
    };

    var parseEditNodes = function (tables, nodes) {
        var tableType, tableField, tableFieldName, tableFieldValue, currentFieldValue, objectId;
        for (var j = 0; j < tables.length; j ++) {
            tables[j].updateFields = {};
            if (tables[j].name == 'uobject') {
                objectId = tables[j].fields.id;
            }
        }

        for (var i = 0; i < nodes.length; i ++) {
            tableType = $ (nodes[i]).attr ('data-table');
            tableField = $ (nodes[i]).find ("." + config.css.fieldElement);
            tableFieldName = tableField.attr ('data-field');
            tableFieldValue = tableField.text ();

            if (tableField.hasClass (config.css.uneditableField)) continue;

            for (var j = 0; j < tables.length; j ++) {
                currentFieldValue = tables[j].fields[tableFieldName];
                if (tables[j].name == tableType) {
                    if (typeof currentFieldValue == "number") {
                        tableFieldValue = parseInt (tableFieldValue);
                        tableFieldValue = isNaN (tableFieldValue) ? 0 : tableFieldValue;
                    }
                    if (tableFieldValue != currentFieldValue) {
                        tables[j].updateFields[tableFieldName] = tableFieldValue;
                    }
                }
            }
        }
        var resultedTables = [];
        for (var i = 0 ; i < tables.length; i ++ ) {
            for (var key in tables[i].updateFields) {
                if (tables[i].updateFields.hasOwnProperty (key)) {
                    resultedTables.push ({ 'name' : tables[i].name, 'fields' : tables[i].updateFields });
                    continue;
                }
            }
        }
        return { 'data' : resultedTables, 'objectId' : objectId };
    };

    var parseInsertNodes = function (tables, nodes, object) {

        var tableType, tableField, tableFieldName, tableFieldValue, fieldType;
        for (var i = 0; i < nodes.length; i ++) {
            tableType = $ (nodes[i]).attr ('data-table');
            tableField = $ (nodes[i]).find ("." + config.css.fieldElement);
            tableFieldName = tableField.attr ('data-field');
            tableFieldValue = tableField.text ();

            for (var j = 0; j < tables.length; j ++) {
                fieldType = tables[j].fields[tableFieldName];
                if (tables[j].name == tableType) {
                    if (fieldType == "Number") {
                        tableFieldValue = parseInt (tableFieldValue);
                        tableFieldValue = isNaN (tableFieldValue) ? 0 : tableFieldValue;
                    }
                    tables[j].fields[tableFieldName] = tableFieldValue;
                }
                if (tables[j].name == 'uobject' && tableFieldName == 'class') {
                    tables[j].fields[tableFieldName] = parseInt (tableField.attr ('data-id'));
                }
                if (tables[j].name == 'uobject' && tableFieldName == 'major') {
                    tables[j].fields[tableFieldName] = object.id || parseInt (tableField.attr ('data-id'));
                    console.log ("major is:\t" + tables[j].fields[tableFieldName], object.id, tableField.attr ('data-id'));
                }
            }
        }
        return tables;
    };

    var postObjectToServer = function (dataToPost) {
        var url = helper.ajax.buildUrl (config.server.locations[activeServer], config.server.routes.insertObject);
        console.log (dataToPost);
        helper.ajax.post (url, { data : dataToPost }, function (res) {
            treeViewController.rerfeshObjects ();
            $ ("#" + config.css.homeBtn).trigger ('click');
        });
    };

    var updateObjectOnServer = function (dataToPost) {
        var url = helper.ajax.buildUrl (config.server.locations[activeServer], config.server.routes.updateObject);
        console.log (dataToPost);
        helper.ajax.post (url, dataToPost, function (res) {
            treeViewController.rerfeshObjects ();
            $ ("#" + config.css.homeBtn).trigger ('click');
        });
    };

    var setInsertButtonClick = function (data, object) {
        var button = $ ("#" + config.css.dbManagmentInsertBtn);
        var buttonClicked = function () {
            var parsedData = parseInsertNodes (data.tables, $ ('.' + config.css.fieldContainer), object );
            postObjectToServer (parsedData);
        };
        button.off ('click').on ('click', buttonClicked);
    };

    var setEditButtonClick = function (data) {
        var button = $ ("#" + config.css.dbManagmentEditBtn);
        var buttonClicked = function () {
            var parsedData = parseEditNodes (data, $ ('.' + config.css.fieldContainer) );
            console.log (parsedData);
            updateObjectOnServer (parsedData);
        };
        button.off ('click').on ('click', buttonClicked);
    };

    var setCancelButtonClick = function () {
        var cancelBtnClicked = function () {
            $ ("#" + config.css.homeBtn).trigger ('click');
        };
        $ ("#" + config.css.dbManagmentCancelBtn )
            .off ('click')
            .on ('click', cancelBtnClicked);
    };

    var openInfoFrom = function (objects) {
        console.log ("Info for", objects[0]);
        $ ('.' + config.css.dbManagmentHeader).addClass (config.css.hidden);
        var objectClass = classes[activeServer][objects[0].class].name;
        if (!objectClass) return;

        var url = helper.ajax.buildUrl (config.server.locations[activeServer], config.server.routes.getInfoFields);
        url += config.server.requestParams.editFieldsClass + objectClass;
        url += config.server.requestParams.editFieldsId + objects[0].id;
        helper.ajax.get (url, function (res) {
            console.log (res);
            var tables = res.map ( function (object) {
                return { 'name' : object.name, 'fields' : object.exportedFields };
            });
            templateBuilder.buildInfoForm (tables, classes[activeServer][objects[0].class], objects[0]);
            //setObjectBrowserEvents ();
            setCancelButtonClick ();
        });
    };

    var openEditFrom = function (objects) {
        console.log ("Inserting over", objects[0]);
        $ ('.' + config.css.dbManagmentHeader).addClass (config.css.hidden);
        var objectClass = classes[activeServer][objects[0].class].name;
        if (!objectClass) return;

        var url = helper.ajax.buildUrl (config.server.locations[activeServer], config.server.routes.getEditFields);
        url += config.server.requestParams.editFieldsClass + objectClass;
        url += config.server.requestParams.editFieldsId + objects[0].id;
        helper.ajax.get (url, function (res) {
            console.log (res);
            var tables = res.map ( function (object) {
                return { 'name' : object.name, 'fields' : object.exportedFields };
            });
            templateBuilder.buildEditForm (tables, classes[activeServer][objects[0].class], objects[0]);
            setObjectBrowserEvents ();
            setCancelButtonClick ();
            setEditButtonClick (tables);
        });
    };

    var setDeleteObjectEvent = function (postData) {
        var buttonClicked = function () {
            var url = helper.ajax.buildUrl (config.server.locations[activeServer], config.server.routes.deleteObject);
            helper.ajax.post (url, postData, function (res) {
                console.log (res);
                treeViewController.rerfeshObjects ();
                $ ("#" + config.css.homeBtn).trigger ('click');
            });
        };
        $ ('#' + config.css.dbManagmentDeleteBtn)
            .off ('click')
            .on ('click', buttonClicked);
    };

    var openDeleteFrom = function (objects) {
        console.log ("Deleting the", objects[0]);
        $ ('.' + config.css.dbManagmentHeader).addClass (config.css.hidden);
        var objectClass = classes[activeServer][objects[0].class].name;
        if (!objectClass) return;


        var className = classes[activeServer][objects[0].class];
        if (className) {
            className = className.name;
        }
        templateBuilder.buildDeleteForm (objects[0]);
        setDeleteObjectEvent ({ 'class' : objects[0].class, 'className' : className, 'id' : objects[0].id });
        setCancelButtonClick ();
    };

    var setObjectBrowserEvents = function () {
        var buttons = $ ("." + config.css.dbManagmentFieldBrowseBtn);

        var buttonClicked = function () {
            var fieldElement = $ (this).parent ().find ("." + config.css.fieldElement);
            var browserDataReceived = function (selectedValue) {
                if (selectedValue) {
                    fieldElement.text (selectedValue);
                }
            };
            browser.open (browserDataReceived);
        };
        buttons.off ('click').on ('click', buttonClicked);
    };

    var switchServer = function (newServer) {
        activeServer = newServer;
    };

    var getServer = function () {
        return activeServer;
    };

    return {
        "initialize" : init,
        "setClasses" : setClasses,
        "openInsertFrom" : openInsertForm,
        "openEditFrom" : openEditFrom,
        "openInfoFrom" : openInfoFrom,
        "openDeleteFrom" : openDeleteFrom,
        "switchServer": switchServer,
        "getServer": getServer
    };

} ) ();