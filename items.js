/**
 * Created by PC on 4/8/2018.
 */
var express = require('express');
var router = express.Router();

var items;

/*
router.get('/', function(req, res, next) {
    res.render('items/all_matiriels', { title: 'Express' });
});
*/

//create my sql
const mysql=require('mysql');
//create connection
var db = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'stock'
});

//connect
db.connect(function(err){
    if(err){
        throw err;
    }
    console.log('mysql connected.');

});

db.query("SELECT * FROM batch",
    function (err, res) {
    if(err) throw err;
    if(res.length>0){
        items = res;
    }
    else {
        items=null;
    }
});

router.get('/items',function (req,res,next) {
    res.render('items/batchs',{
        items:items
    });
});

module.exports = router;
