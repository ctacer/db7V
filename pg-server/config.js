module.exports = {
  "server" : {
    "host" : "http://localhost",
    "port" : 3002
  },
  "db" : {
    "host" : 'localhost',
    "port" : 5432,
    "user" : 'postgres',
    "password" : '',
    "dbname" : 'university2.0.'
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