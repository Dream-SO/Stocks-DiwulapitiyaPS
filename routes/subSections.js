var express = require('express');
var router = express.Router();


/* GET subSections page. */
router.get('/', function(req, res, next) {
    res.render('subSections', { title: 'Express' });
});

module.exports = router;
