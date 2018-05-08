var express = require('express');
var router = express.Router();
var connection = require('../connection');


/* GET home page. */
router.get('/', function(req, res, next) {

    connection.query('SELECT * FROM section WHERE is_deleted=0', function (err, rows) {
        if (err){
            throw err;
        }else {
          console.log(rows);
          res.render('index', {sections:rows});
        }
    });

});

/* GET dashboard page. */
router.get('/dashboard', function(req, res, next) {

    // connection.query('SELECT * FROM section WHERE is_deleted=0', function (err, rows) {
    //     if (err){
    //         throw err;
    //     }else {
    //         console.log(rows);
    //         res.render('index', {sections:rows});
    //     }
    // });

    res.render('dashboard');

});


/* GET issueForm page. */
router.get('/issueForm', function(req, res, next) {

    // connection.query('SELECT * FROM section WHERE is_deleted=0', function (err, rows) {
    //     if (err){
    //         throw err;
    //     }else {
    //         console.log(rows);
    //         res.render('index', {sections:rows});
    //     }
    // });

    res.render('issueForm');

});


module.exports = router;
