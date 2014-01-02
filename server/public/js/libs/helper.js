
(function (exports) {

    var js = {};

    js.seque = function () {
        return [].slice.call(arguments).reduce ( function (currSeq, currFn) {
            return function () {
                return currFn.call (null, currSeq.apply (null, arguments) );
            };
        });
    };

    js.map = function (mapCallback, iterable) {
        return [].map.call (iterable, mapCallback);
    };

    js.sortByField = function (arrayToSort, fieldToSort) {
        arrayToSort.sort (function (object, next) {
            return object[fieldToSort] > next[fieldToSort];
        });
    };

    /**
     * usage example
     * var sequeExample = js.seque ( function (a) { return a*a; }, function (a) { return a+10; } );
     * var sampleArray = [10,15,20,30];
     * var result = js.map ( sequeExample, sampleArray );
     *
     * result : [110, 235, 410, 910]
     */

    var ajax = {};

    ajax.get = function (url, callback) {
        $.get (url ,callback);
    };

    ajax.post = function (url, postData, callback) {
        $.post (url ,postData, callback);
    };

    ajax.buildUrl = function (config, route) {
        return config.server.protocol + config.server.host + config.server.port + route;
    };

    var helper = {};
    helper.js = js;
    helper.ajax = ajax;

    exports.helper = helper;

} ) (this);