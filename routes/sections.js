var express = require('express');
var router = express.Router();

var Section = require('../models/section');

/*DISPLAY ADD NEW SECTION PAGE*/
router.get('/addSection', function(req, res, next) {

    res.render('newSection');
});


/* ADD NEW SECTION */
router.post('/addSection', function(req, res) {

    var sectionId = req.body.sectionId;
    var sectionName = req.body.sectionName;

    var newSection = new Section({
        _id :sectionId,
        sectionName : sectionName,
        createdAt : Date()
    });

    Section.createSection(newSection,function (err,section) {
        if(err) throw err;
        console.log(section);
    });

    res.redirect('/');

});
module.exports = router;
