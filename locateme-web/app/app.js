var express = require('express');
var app = express();

app.use(express.static('bootstrap'));

app.get('/', function (req, res) {
    res.sendFile(__dirname + '/views/index.html');
});

var server = app.listen(3000, function () {
    var host = server.address().address;
    var port = server.address().port;
    console.log('Demo hybrid web app listening at http://%s:%s', host, port);
});
