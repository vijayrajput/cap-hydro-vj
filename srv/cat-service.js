const cds = require('@sap/cds')
module.exports = async function(){ 
    const {Books, Authors} = this.entities;
    this.after ('READ','Books', each => {
        if (each.availiableStock > 111) each.title += ` -- 11% discount!`
      })

    this.on ('health', () => true)  

    this.on('getStock', Books, async req => {
        console.log(req.query);
        const result = await cds.run(req.query);
        console.log(result[0].availiableStock);
        return result[0].availiableStock;
    })

}
