var conncetion = require('../connection');

var row;

function getAll(){
    conncetion.query('SELECT * FROM section', function (err, rows) {
        if (err) {
            row = []
            return err;
        }else{
            return rows;
        }

    })

}


module.exports = getAll();