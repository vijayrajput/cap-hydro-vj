const cds = require('@sap/cds')
module.exports = async function(){ 

    this.after ('READ','Books', each => {
        if (each.availiableStock > 111) each.title += ` -- 11% discount!`
      })

}
