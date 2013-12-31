

var dbManager = ( function () {

    var config, classes;

    var init = function (__config) {
        config = __config;
    };

    var setClasses = function (__classes) {
        classes = __classes;
    };

    var getAvailableClasses = function (object) {
        var currClassId = object[config.serverData.uObjects.class];
        var currClass = classes[currClassId];
        return currClass.children;
    };

    var openInsertForm = function (objects) {
        templateBuilder.buildInsertForm ( getAvailableClasses (objects[0]) );
        setSelectHandler ();
    };

    var setSelectHandler = function () {
        var selector = "#" + config.css.recordType;
        var selectElement = $ (selector);
        var classSelected = function () {
            var id = $ (this).val ();
            var className = $ (selector + " option:selected").text ();
            console.log (id, className);
        };

        selectElement.change ( classSelected );
    };

    return {
        "initialize" : init,
        "setClasses" : setClasses,
        "openInsertFrom" : openInsertForm
    };

} ) ();