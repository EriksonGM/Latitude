'use strict'

var express = require('express');
var app = express();

var path = require('path');
var server = require('http').createServer(app);
var io = require('socket.io')(server);
var bodyParser = require('body-parser');

var mongoose = require("mongoose");

const config = require('./config')


/*
mongoose.connect(config.db, (err, res) => {
    if (err) {
      return console.log(`Error al conectar a la base de datos: ${err}`)
    }
    console.log('Conexión a la base de datos establecida...')
  
    app.listen(config.port, () => {
      console.log(`API REST corriendo en http://localhost:${config.port}`)
    })
  })
*/
var port = process.env.PORT || 80;

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(express.static('public'));
/*
app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname + '/pages/login.html'));
});
*/
/*
app.get('/', function (req, res) {
    res.send('Hello World!');
});
*/

app.get('/post', function (req, res) {
    sql.close()
    sql.connect(config).then(() => {
        return sql.query`Select * from EstadoInteracao`
    }).then(result => {
        console.dir(result)
        res.status(200).send(result);
    }).catch(err => {
        res.status(200).send(err)
    })/**/

    //res.status(200).send('Donde estas');
});

app.get('/', function (req, res) {
    res.render('index', {
        titulo: 'Pagina de Inicio',
        subtitulo: 'Seja bem vindo',
        servicos: [{
            nome: 'Facebook',
            icon: 'fa fa-facebook',
            estado: true
        },
        {
            nome: 'Whatsapp',
            icon: 'fa fa-whatsapp',
            estado: true
        },
        {
            nome: 'Twitter',
            icon: 'fa fa-twitter',
            estado: true
        },
        {
            nome: 'LinkedIn',
            icon: 'fa fa-linkedin',
            estado: true
        },
        {
            nome: 'Telegram',
            icon: 'fa fa-telegram',
            estado: true
        },
        {
            nome: 'Skype',
            icon: 'fa fa-skype',
            Estado: false
        },
        ]
    });
});
/*
mongoose.connect(config.db, (err, res) => {
    if (err) throw err
    console.log('Conectado com a base de dados.');

    server.listen(port, () => {
        console.log(`Servidor activo na porta:${port}`);
    });
});
*/

server.listen(port, () => {
    console.log(`Servidor activo na porta:${port}`);
});