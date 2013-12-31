

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
        "treeViewContainer" : "tree-view-container",
        "recordType" : "record-type"
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
            "getTemplate" : "/get/template"
        },
        "templates" : {
            "treeView" : "?type=tree_view"
        }
    },
    "serverData" : {
        "classes" : {
            "id" : "ID",
            "name" : "Name",
            "children" : "Children"
        },
        "uObjects" : {
            "class" : "class",
            "id" : "id",
            "major" : "major",
            "name" : "name"
        }
    }
};