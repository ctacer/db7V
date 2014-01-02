
var browser = (function () {

    var config;
    var init = function (__config) {
        config = __config
    };

    var setSelectionHandlers = function () {
        var treeNodes = $ ("#" + config.css.browseTreeView + " ." + config.css.collapsableContent);
        var treeViewClicked = function () {
            treeNodes.removeClass (config.css.selectedText);
            $ (this).addClass (config.css.selectedText);
        };
        treeNodes.click (treeViewClicked);
    };

    var setHandlers = function (cb) {
        var okBtn = $ ("#" + config.css.browserOkBtn);
        var okButtonClicked = function () {
            var selector = "#" + config.css.browseTreeView + " ." + config.css.collapsableContent + "." + config.css.selectedText;
            var selectedTreeNode = $ (selector);
            if ( selectedTreeNode.length ) {
                cb ( $ (selectedTreeNode[0]).text () );
            }
            else {
                cb ();
            }
            close ();
        };
        okBtn.off ('click').on ('click', okButtonClicked);

        var cancelBtn = $ ("#" + config.css.browserCancelBtn);
        var cancelButtonClicked = function () {
            cb ();
            close ();
        };
        cancelBtn.off ('click').on ('click', cancelButtonClicked);
    };

    var open = function (cb) {
        var container = $ ("#" + config.css.browseTreeView);
        var exportedTreeView = $ ("#" + config.css.leftContainer);
        var exportedTreeViewHtml ;

        container.removeClass (config.css.hidden);
        exportedTreeViewHtml = exportedTreeView.html ().replace (config.css.selectedText, '');
        container.find ("." + config.css.browserBody).append ( $ (exportedTreeViewHtml) );
        setSelectionHandlers ();
        treeViewController.setTriggerHandlers ( $ ("#" + config.css.browseTreeView) );
        setHandlers (cb);
    };

    var close = function () {
        $ ("#" + config.css.browseTreeView).addClass (config.css.hidden);
        $ ("#" + config.css.browseTreeView + " ." + config.css.browserBody).empty ();
    };

    return {
        "initialize" : init,
        "open" : open,
        "close" : close
    };
}) ();