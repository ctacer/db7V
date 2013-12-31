
(function (exports) {

    var jsHelper = {};

    jsHelper.seque = function () {
        return [].slice.call(arguments).reduce ( function (currSeq, currFn) {
            return function () {
                return currFn.call (null, currSeq.apply (null, arguments) );
            };
        });
    };

    jsHelper.map = function (mapCallback, iterable) {
        return [].map.call (iterable, mapCallback);
    };

    /**
     * usage example
     * var sequeExample = jsHelper.seque ( function (a) { return a*a; }, function (a) { return a+10; } );
     * var sampleArray = [10,15,20,30];
     * var result = jsHelper.map ( sequeExample, sampleArray );
     *
     * result : [110, 235, 410, 910]
     */

    var ajax = {};

    ajax.get = function (url, callback) {
        $.get (url ,callback);
    };

    ajax.buildUrl = function (config, route) {
        return config.server.protocol + config.server.host + config.server.port + route;
    };

    var helper = {};
    helper.jsHelper = jsHelper;
    helper.ajax = ajax;

    exports.helper = helper;

} ) (this);