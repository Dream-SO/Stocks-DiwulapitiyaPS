var mongoose = require('mongoose');

//Section Schema
var SectionSchema = mongoose.Schema({
    _id:{
        type:String
    },
    sectionName:{
        type:String
    },
    subSections:{
        type:Array
    },
    createdAt:{
        type:Date
    }
});

var Section = module.exports = mongoose.model('section',SectionSchema);

module.exports.createSection = function (newSection,callback) {
    newSection.save(callback);

}

