/**
 * main controller object
 */
var mainController = ( function () {

    var config;
    var initialize = function (__config) {
        config = __config;

        setWindowHandlers ();
        resizeHandler ();
        initNavigations ();
        initDBButtons ();
    };

    var resizeHandler = function () {
        var innerhHeight = window.innerHeight;
        innerhHeight -= config.margins.header + config.margins.footer;
        $ ("#" + config.css.leftContainer + ",#" + config.css.rightContainer + ",#" + config.css.browseTreeView ).css ("height", innerhHeight + "px");
    };

    var setWindowHandlers = function () {
        $ (window).resize (resizeHandler);
    };

    var initNavigations = function () {
        intiHomePage ();
    };

    var intiHomePage = function () {
        var homeClick = function () {
            $ ("#" + config.css.rightContainer).removeClass (config.css.visible);
            browser.close ();
        };
        $ ("#" + config.css.homeBtn).click ( homeClick );
    };

    var initDBButtons = function () {
        initAddEntityButton ();
        initEditEntityButton ();
        initInfoEntityButton ();
        initDeleteEntityButton ();
    };

    var initAddEntityButton = function () {
        var addEntityBtnClicked = function () {
            var selectedTreeNode = $ ("#" + config.css.leftContainer + " ." + config.css.collapsableContent + "." + config.css.selectedText);
            if ( !selectedTreeNode.length ) return;

            $ ("#" + config.css.rightContainer ).addClass (config.css.visible);
            dbManager.openInsertFrom (treeViewController.getObjectsById ( $ (selectedTreeNode[0] ).attr ("data-id") ), $(selectedTreeNode[0]).parents('[data-server]').attr('data-server'));
        };
        $ ("#" + config.css.addEntityBtn ).click (addEntityBtnClicked);
    };

    var initEditEntityButton = function () {
        var editButtonClicked = function () {
            var selectedTreeNode = $ ("#" + config.css.leftContainer + " ." + config.css.collapsableContent + "." + config.css.selectedText);
            if ( !selectedTreeNode.length ) return;

            $ ("#" + config.css.rightContainer ).addClass (config.css.visible);
            dbManager.openEditFrom (
                treeViewController.getObjectsById ( $(selectedTreeNode[0]).attr("data-id"), $(selectedTreeNode[0]).parents('[data-server]').attr('data-server') ), $(selectedTreeNode[0]).parents('[data-server]').attr('data-server') );
        };
        $ ("#" + config.css.editEntryBtn).click (editButtonClicked);
    };

    var initInfoEntityButton = function () {
        var infoButtonClicked = function () {
            var selectedTreeNode = $ ("#" + config.css.leftContainer + " ." + config.css.collapsableContent + "." + config.css.selectedText);
            if ( !selectedTreeNode.length ) return;

            $ ("#" + config.css.rightContainer ).addClass (config.css.visible);
            dbManager.openInfoFrom (treeViewController.getObjectsById ( $ (selectedTreeNode[0] ).attr ("data-id"), $(selectedTreeNode[0]).parents('[data-server]').attr('data-server') ), $(selectedTreeNode[0]).parents('[data-server]').attr('data-server'));
        };
        $ ("#" + config.css.infoEntryBtn).click (infoButtonClicked);
    };

    var initDeleteEntityButton = function () {
        var deleteButtonClicked = function () {
            var selectedTreeNode = $ ("#" + config.css.leftContainer + " ." + config.css.collapsableContent + "." + config.css.selectedText);
            if ( !selectedTreeNode.length ) return;

            $ ("#" + config.css.rightContainer ).addClass (config.css.visible);
            dbManager.openDeleteFrom (treeViewController.getObjectsById ( $ (selectedTreeNode[0] ).attr ("data-id"), $(selectedTreeNode[0]).parents('[data-server]').attr('data-server') ), $(selectedTreeNode[0]).parents('[data-server]').attr('data-server'));
        };
        $ ("#" + config.css.deleteEntryBtn).click (deleteButtonClicked);
    };

    var getSelectedObject = function () {
        var selectedTreeNode = $ ("#" + config.css.leftContainer + " ." + config.css.collapsableContent + "." + config.css.selectedText);
        if ( !selectedTreeNode.length ) return null;
        return treeViewController.getObjectsById ( $ (selectedTreeNode[0] ).attr ("data-id"), $(selectedTreeNode[0]).parents('[data-server]').attr('data-server') );
    };

    return {
        "initialize" : initialize,
        "getSelectedObject" : getSelectedObject
    }

} ) ();