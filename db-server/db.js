var pg = require('pg');
var config = require(__dirname + '/config.js');

var conString = "postgres://" + config.db.user + ":" + config.db.password + "@localhost/" + config.db.dbname;

var client = new pg.Client(conString);
client.connect(function(err) {
  if(err) {
    return console.error('could not connect to postgres', err);
  }
});

module.exports = {

  select: function (table, cb) {

    if (!client) {
      return cb({ error: 'No DB connection!' });
    }

    client.query('SELECT * FROM "' + table + '";', function(err, result) {
      if(err) {
        return console.error('error running query', err);
      }
      cb(result);
    });
  },

  'Address': function (recordId, cb) {
    client.query('SELECT * FROM "Schools" WHERE address=' + recordId + ';', function(err, result) {
      if(err) {
        return console.error('error running query', err);
      }
      cb(result);
    });
  },
  'Contacts': function (recordId, cb) {
    client.query('SELECT * FROM "School" WHERE contacts=' + recordId + ';', function(err, result) {
      if(err) {
        return console.error('error running query', err);
      }
      cb(result);
    });
  },
  'Departments': function (recordId, cb) {
    /*client.query('SELECT * FROM "School" WHERE contacts=' + recordId + ';', function(err, result) {
      if(err) {
        return console.error('error running query', err);
      }
      cb(result);
    });*/
  },
  'Faculties': function (recordId, cb) {
    client.query('SELECT * FROM "School" WHERE id=' + recordId + ';', function(err, result) {
      if(err) {
        return console.error('error running query', err);
      }
      cb(result);
    });
  },
  'Workers': function (recordId, cb) {
    client.query('SELECT * FROM "School" WHERE id=' + recordId + ';', function(err, result) {
      if(err) {
        return console.error('error running query', err);
      }
      cb(result);
    });
  }

};