var express = require('express');
var router = express.Router();
var mysql = require('mysql')

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'the_app_database'
})

connection.connect(function(err) {
    if (err) throw err
    console.log('You are now connected...')

    connection.query('CREATE TABLE people(id int primary key, name varchar(255), age int, address text)', function(err, result) {
        if (err) throw err
        connection.query('INSERT INTO people (name, age, address) VALUES (?, ?, ?)', ['Larry', '41', 'California, USA'], function(err, result) {
            if (err) throw err
            connection.query('SELECT * FROM people', function(err, results) {
                if (err) throw err
                console.log(results[0].id)
                console.log(results[0].name)
                console.log(results[0].age)
                console.log(results[0].address)
            })
        })
    })
})

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
