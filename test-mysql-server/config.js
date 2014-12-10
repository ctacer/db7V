module.exports = {
  "server" : {
    "host" : "http://localhost",
    "port" : 3003
  },
  "db" : {
    "host" : 'localhost',
    "port" : 3306,
    "user" : 'web',
    "password" : 'root',
    "dbName" : 'test-university2.0.',
    "poolSize" : 4
  },
  "mainRouteComponent" : "",
  "routes" : {
    "requests" : {
      "selectObjects" : "/get/objects",
      "selectClasses" : "/get/classes",
      "getInsertFields" : "/get/fields",
      "getInfoFields" : "/get/info_fields",
      "getEditFields" : "/get/edit_fields"
    },
    "postRequests" : {
      "insertObject" : "/post/object",
      "updateObject" : "/update/object",
      "deleteObject" : "/delete/object"
    }
  }
  
};