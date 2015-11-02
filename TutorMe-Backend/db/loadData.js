var mongoose = require('mongoose');
var fs = require('fs');
var schema = require('./schema/index').dir;
var config = JSON.parse(require('fs').readFileSync(__dirname + '/config.json'));
var db_Connection = mongoose.connect(config.ApplicationURI);
//db_Connection.on('error', console.error.bind(console, 'connection error:'));

var studentJson;
var coursesJson;

/* :TODO Loop through directory
var jsonfiles;
fs.reddir('/import/json', function (err, files) {
    if (err) throw err;
    jsonfiles = files;
 });

jsonfiles.forEach(function(file){
    if file.toString
});
*/

//Loads coursescut.json and studentcut.json
fs.readFile('/import/studentcut.json', 'utf8', function (err, data) {
  if (err) throw err;
  studentJson = JSON.parse(data);
});

fs.readFile('/import/coursescut.json', 'utf8', function (err, data) {
  if (err) throw err;
  coursesJson = JSON.parse(data);
});

//Load students and courses model
var Student = db.model('StudentModel');
var Courses = db.model('CoursesModel');
var studentAdd = new Student({
  ID : dat[ 'ID' ],
  OtherID : dat[ 'OtherID' ],
  LastName : dat[ 'LastName' ],
  FirstName : dat[ 'FirstName' ],
  FullName : dat[ 'FullName' ],
  Gender : dat[ 'Gender' ],
  Major : dat[ 'Major' ],
  Email : dat[ 'Email' ],
});

studentAdd.save(function(err){
  if (err) return callback(err,false);
  return callback(null,true);
});
