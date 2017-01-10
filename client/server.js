var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use(express.static(__dirname+'/public'));
app.use(bodyParser.json());
app.listen(3000);
console.log('server running on port 3000');