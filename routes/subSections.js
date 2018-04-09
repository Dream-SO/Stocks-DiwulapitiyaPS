var express = require('express');
var router = express.Router();
var connection = require('../connection');

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
            res.render('subSections', {subSections:rows , sectionnName:req.params.section_name});
        }
    });

});






module.exports = router;
