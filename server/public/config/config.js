

var config = {
    "css" : {
        "selectedText" : "selected-text",
        "collapsableContent" : "collapsable-content",
        "collapsableElement" : "collapsable-element",
        "rightContainer" : "db-managment-container",
        "leftContainer" : "tree-view-container",
        "visible" : "visible",
        "bodyElement" : "body",
        "homeBtn" : "home-btn",
        "addEntityBtn" : "add-entry-btn",
        "editEntryBtn" : "edit-entry-btn",
        "deleteEntryBtn" : "delete-entry-btn",
        "treeViewContainer" : "tree-view-container",
        "recordType" : "record-type",
        "dbManagmentHeader" : "db-managment-header",
        "dbManagmentBody" : "db-managment-body",
        "dbManagmentFooter" : "db-managment-footer",
        "dbManagmentInsertBtn" : "db-managment-insert-btn",
        "dbManagmentEditBtn" : "db-managment-edit-btn",
        "dbManagmentDeleteBtn" : "db-managment-delete-btn",
        "dbManagmentCancelBtn" : "db-managment-cancel-btn",
        "dbManagmentBtn" : "db-managment-btn",
        "fieldContainer" : "db-managment-field-container",
        "fieldLabel" : "db-managment-field-label",
        "fieldElement" : "db-managment-field-element",
        "dbManagmentFieldBrowseBtn" : "db-managment-field-browse-btn",
        "floatClear" : "clear-float",
        "floatLeft" : "float-left",
        "floatRight" : "float-right",
        "uneditableField" : "uneditable-field",
        "browseTreeView" : "browse-tree-view",
        "hidden" : "hidden",
        "browserCancelBtn" : "browser-cancel-btn",
        "browserOkBtn" : "browser-ok-btn",
        "browserBody" : "browser-body"
    },
    "margins" : {
        "header" : 40,
        "footer" : 50
    },
    "server" : {
        "protocol" : "http://",
        "host" : "localhost",
        "port" : ":3000",
        "routes" : {
            "getObjects" : "/get/objects",
            "getClasses" : "/get/classes",
            "getTemplate" : "/get/template",
            "getInsertFields" : "/get/fields",
            "insertObject" : "/post/object",
            "updateObject" : "/update/object",
            "getEditFields" : "/get/edit_fields",
            "deleteObject" : "/delete/object"
        },
        "requestParams" : {
            "treeView" : "?type=tree_view",
            "insertFields" : "?class=",
            "editFieldsClass" : "?class=",
            "editFieldsId" : "&id="
        }
    },
    "serverData" : {
        "classes" : {
            "id" : "id",
            "name" : "Name",
            "children" : "Children"
        },
        "uObjects" : {
            "class" : "class",
            "id" : "id",
            "major" : "major",
            "name" : "name"
        },
        "fieldReferences" : {
            "group" : "curator",
            "institutionorg" : "chief",
            "universities" : "accredetation"
        }
    }
};