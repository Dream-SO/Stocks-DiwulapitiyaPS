var express = require('express');
var router = express.Router();
var connection = require('../connection');

var Section = require('../models/section');

/*DISPLAY ADD NEW SECTION PAGE*/
// router.get('/addSection', function(req, res, next) {
//     connection.query("SELECT MAX(section_id) as 'section_id' FROM section;",function (err, row) {
//         if (err){
//             throw err;
//         }else {
//             console.log(row);
//             var current_section_id = row[0].section_id;
//             var ascii = current_section_id.charCodeAt(0);
//             var new_section_id = String.fromCharCode(ascii+1);
//             res.render('newSection', {section_id:new_section_id});
//         }
//     });
//
// });

router.get('/addSection', function(req, res, next) {

    connection.query("SELECT MAX(section_id) as 'section_id' FROM section ; SELECT * FROM section WHERE is_deleted=0",[1, 2],function (err, row) {
        if (err){
            throw err;
        }else {
            console.log(row[0]);
            console.log(row[1]);

            var current_section_id = row[0][0].section_id;

            var ascii = current_section_id.charCodeAt(0);

            var new_section_id = String.fromCharCode(ascii+1);
            res.render('newSection', {section_id:new_section_id , sections:row[1]});


        }
    });

});

/* GET subSections page. */
router.get('/:section_name/:section_id', function(req, res, next) {
    connection.query("SELECT section.section_name , subsection.subSection_name , section_subsection.subSection_id" +
        " FROM section , subsection , section_subsection WHERE section_subsection.section_id ='"+req.params.section_id+
        "' AND section.section_id = section_subsection.section_id " +
        "AND section_subsection.subSection_id = subsection.subSection_id ", function (err, rows) {
        if (err){
            throw err;
        }else {
            console.log(rows)
            res.render('subSections', {subSections:rows , sectionnName:req.params.section_name ,sectionId :req.params.section_id });
        }
    });

});


/* ADD NEW SECTION */
router.post('/addSection', function(req, res) {

    var sectionId = req.body.sectionId;
    var sectionName = req.body.sectionName;

    console.log(sectionName);
    console.log(sectionId);

    // var sql = "INSERT INTO section (section_id, section_name) VALUES (sectionId, sectionName);"
    connection.query("INSERT INTO section (section_id, section_name,created_at) VALUES ('" + sectionId + "','" + sectionName + "','" +Date()+ "');", function (err, result) {
        if (err) throw err;
        console.log("1 record inserted");
    });
    res.redirect('/');

});
module.exports = router;
