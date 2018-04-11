var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var expressHbs = require('express-handlebars');
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/stockdb');
var db = mongoose.connection;

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var itemsRouter = require('./routes/items');

var sectionsRouter = require('./routes/sections');


/*
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
// gobal siteTitle and base url
const  siteTitle = "Stock";
const  baseURL = "http://localhost/3000";
*/

var app = express();
// view engine setup
app.engine('.hbs', expressHbs({defaultLayout: 'main' , extname: '.hbs'}));
app.set('view engine', '.hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

app.use('/items', itemsRouter);
app.use('/sections',sectionsRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

// Set Port
app.set('port', (process.env.PORT || 4000));

app.listen(app.get('port'), function(){
    console.log('Server started on port '+app.get('port'));
});

module.exports = app;
