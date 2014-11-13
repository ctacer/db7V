/**
 * object that handles all global objects
 */
var registry = ( function ( ) {

    var registryStack = {};

    /**
     * function returns data associated with given key,
     * if it was registrated ,
     * otherwise if will throw new error
     * @param key
     * @returns {*}
     */
    var get = function ( key ) {
        if ( registryStack.hasOwnProperty (key) ) {
            return registryStack[key];
        }
        else {
            throw new Error ( "There is no registered data associated with " + key );
        }
    };

    /**
     * function registrates new data
     * and associate it with given key
     * @param key
     * @param object
     */
    var set = function ( key, object ) {
        registryStack[key] = object;
    };

    return {
        "get" : get,
        "set" : set
    };

} ) ();

module.exports = registry;