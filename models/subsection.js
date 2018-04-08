var mongoose = require('mongoose');

//sub section Schema
var SubSectionSchema = mongoose.Schema({
    _id:{
        type:String
    },
    subSectionName:{
        type:String
    },
    subSections:{
        type:Array
    },
    createdAt:{
        type:Date
    }
});

var SubSectionSchema = module.exports = mongoose.model('section',SubSectionSchema);

module.exports.createSection = function (newSection,callback) {
    newSection.save(callback);

}

