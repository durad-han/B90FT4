/**
 * http://usejsdoc.org/
 */
// http://www.chosun.com/site/data/rss/it.xml

/**
 * http://usejsdoc.org/
 */

var http = require("http");
var url = require("url");
var express = require("express");
var bodyParser = require("body-parser");
var crypto = require("crypto");
var CORS = require("cors");
var xml2js = require('xml2js');
var parser = new xml2js.Parser();
var res = require("request");

var xml="";

res("http://www.chosun.com/site/data/rss/it.xml", function (error, response, body) {
	
	if (error || response.statusCode !== 200) {
		console.log("요청시 에러발생");
		
	} else {
		
		xml += body;
		
		parser.parseString(xml, function (err, result) {
			xml = JSON.stringify(result)
		})
	}
	
});

var app = express();

app.use(CORS());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

app.get("/login/pass.do",function (request,response) {
	
	response.writeHeader(200, {"Content-Type": "text/html; charset=UTF-8"});
	response.end(xml);
	
	
});

http.createServer(app).listen(10001, function () {
    console.log('Server running at http://127.0.0.1:10001');
});



