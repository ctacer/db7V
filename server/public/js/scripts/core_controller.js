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
        $ ("#" + config.css.leftContainer + ",#" + config.css.rightContainer ).css ("height", innerhHeight + "px");
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
        };
        $ ("#" + config.css.homeBtn).click ( homeClick );
    };

    var initDBButtons = function () {
        initAddEntityButton ();
    };

    var initAddEntityButton = function () {
        var addEntityBtnClicked = function () {
            var selectedTreeNode = $ ("." + config.css.collapsableContent + "." + config.css.selectedText);
            if ( !selectedTreeNode.length ) return;

            $ ("#" + config.css.rightContainer ).addClass (config.css.visible);
        };
        $ ("#" + config.css.addEntityBtn ).click (addEntityBtnClicked);
    };

    return {
        "initialize" : initialize
    }

} ) ();