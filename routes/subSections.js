var express = require('express');
var router = express.Router();
var connection = require('../connection');



// router.get('/addSubsection/:section_id',function (req,res,next) {
//
//     if(req.params.section_id){
//         connection.query("SELECT MAX(subSection_id) as subSection_id FROM subsection  WHERE subSection_id LIKE '" + req.params.section_id + "%' ;", function (err, row) {
//             if (err){
//                 throw err;
//             }else {
//                 console.log(row);
//
//                 if(row[0].subSection_id){
//                     var current_subSection = row[0].subSection_id;
//                     var ascii = current_subSection.charCodeAt(1);
//                     var new_second_letter = String.fromCharCode(ascii+1);
//                     var new_subsection_id = current_subSection.charAt(0)+new_second_letter;
//                     console.log(new_subsection_id);
//                     res.render('newSubsection', {subSection_id:new_subsection_id});
//                 }else{
//                     console.log("No subsections");
//                     var section_id = req.params.section_id;
//                     var start_second_letter = 'A';
//                     var new_subsection_id = section_id+start_second_letter;
//                     console.log(new_subsection_id);
//                     res.render('newSubsection', {subSection_id:new_subsection_id});
//                 }
//             }
//         });
//     }else{
//         res.render('/');
//     }
//
// });

router.get('/addSubsection/:section_id',function (req,res,next) {

    if(req.params.section_id){
        connection.query("SELECT MAX(subSection_id) as subSection_id FROM subsection  WHERE subSection_id LIKE '" + req.params.section_id + "%' ; SELECT * FROM subSection WHERE subSection_id LIKE '" + req.params.section_id + "%'",[1,2], function (err, row) {
            if (err){
                throw err;
            }else {
                console.log(row);

                if(row[0][0].subSection_id){
                    var current_subSection = row[0][0].subSection_id;
                    var ascii = current_subSection.charCodeAt(1);
                    var new_second_letter = String.fromCharCode(ascii+1);
                    var new_subsection_id = current_subSection.charAt(0)+new_second_letter;
                    console.log(new_subsection_id);
                    res.render('newSubsection', {subSection_id:new_subsection_id , subSections:row[1]});
                }else{
                    console.log("No subsections");
                    var section_id = req.params.section_id;
                    var start_second_letter = 'A';
                    var new_subsection_id = section_id+start_second_letter;
                    console.log(new_subsection_id);
                    res.render('newSubsection', {subSection_id:new_subsection_id});
                }
            }
        });
    }else{
        res.render('/');
    }

});




module.exports = router;
