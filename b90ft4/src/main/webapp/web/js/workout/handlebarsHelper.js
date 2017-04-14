/**
 * 
 */

Handlebars.registerHelper('isZero', function(options) {
/*	console.log("val:"+val);
	console.log("val2:"+val2);
*/
	var zero = 0;
      if(zero == parseInt(this.typeBTime)){
    	  return options.fn(this);
      }
      else{
    	  return options.inverse(this);
      }
    });

Handlebars.registerHelper("counter", function (index){
    return index + 1;
});