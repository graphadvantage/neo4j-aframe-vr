var express = require('express');
var http = require('http');
var path = require('path');
var app = express();

app.set('port', process.env.PORT || 3000);

app.set('appPath', 'public');
app.use(express.static(__dirname +'/public'));

app.route('/*')
  .get(function(req, res) {
    res.sendfile(app.get('appPath') + '/index.html');
  });

app.listen(app.get('port'), function() {
  console.log("Node app is running on port:" + app.get('port'))
});
