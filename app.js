'use strict'

var express = require('express');
var app = express();

var path = require('path');
var server = require('http').createServer(app);
var io = require('socket.io')(server);
var bodyParser = require('body-parser');

var port = process.env.PORT || 80;

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(express.static('public'));

/*app.get('/', function (req, res) {
    res.send('Hello World!');
});*/

app.get('/', function (req, res) {
    res.render('index', {
        titulo: 'Pagina de Inicio'
    });
});

server.listen(port, () => {
    console.log(`Servidor activo na porta:${port}`);
});