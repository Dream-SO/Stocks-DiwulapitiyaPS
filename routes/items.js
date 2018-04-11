/**
 * Created by PC on 4/8/2018.
 */
var express = require('express');
var http = require('http');
var router = express.Router();
var items = express();
var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({extended:true}));

var batches;

// display dashbord about items
router.get('/', function(req, res, next) {
    res.render('items/all_matiriels', { title: 'Express' });
});


//create my sql
const mysql=require('mysql');
//create connection
var db = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'stock_diwulapitiya_ps'
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
        batches = res;
    }
    else {
        batches =null;
    }
});
// getting all batch types
router.get('/batches',function (req,res,next) {
    res.render('items/batchs',{
        items:batches
    });
});
/*
* add batch to database*/
router.post('/add_batch',function (req,res,next) {
   var query1 = "INSERT INTO `batch`(`batch_type`) VALUES (";
   query1 += " '"+req.body.batch_type+"')";
   db.query(query1,function (err,result) {
       if(err) throw err;

       res.redirect('/items/batches');

   });
});
module.exports = router;
