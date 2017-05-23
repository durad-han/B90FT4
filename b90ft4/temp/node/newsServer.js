var http = require("http");
var url = require("url");
var express = require("express");
var bodyParser = require("body-parser");
var crypto = require("crypto");
var CORS = require("cors");
var xml2js = require('xml2js');
var parser = new xml2js.Parser();
var res = require("request");

/*
    http://www.chosun.com/site/data/rss/rss.xml 속보
    http://myhome.chosun.com/rss/www_section_rss.xml 오늘의 주요 뉴스
    http://newsplus.chosun.com/hitdata/xml/newsplus/index/index.xml 인기 뉴스
	http://www.chosun.com/site/data/rss/it.xml it
	http://www.chosun.com/site/data/rss/politics.xml 정치
	http://www.chosun.com/site/data/rss/culture.xml 문화
	http://www.chosun.com/site/data/rss/national.xml 사회
	http://danmee.chosun.com/site/data/rss/rss.xml 생활, 여성
	http://english.chosun.com/site/data/rss/rss.xml 영문 뉴스
 */

var news = {};

var j = 0;

var newsArr = [
  ['rss','http://www.chosun.com/site/data/rss/rss.xml'],
  ['today','http://myhome.chosun.com/rss/www_section_rss.xml'],
  ['it','http://www.chosun.com/site/data/rss/it.xml'],	   // IT
  ['politics','http://www.chosun.com/site/data/rss/politics.xml'], // 정치
  ['culture','http://www.chosun.com/site/data/rss/culture.xml'],  // 문화
  ['life','http://danmee.chosun.com/site/data/rss/rss.xml'],   // 생활,여성
  ['engilshNews','http://english.chosun.com/site/data/rss/rss.xml']   // 영문 뉴스.
];

function bringNews() {
	for(var i=0;i<newsArr.length;i++) {
		makeNews(i);
	}
	
	j++;
	console.log(j+"번 갱신");
	var d = new Date();
	console.log((d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.toLocaleTimeString())
}

function makeNews(i) {
	res(newsArr[i][1], function (error, response, body) {

		if (error || response.statusCode !== 200) {
			console.log("요청시 에러발생");
		} else {
			var type = newsArr[i][0];
			news[type] = '';
			news[type] += body;
			parser.parseString(news[newsArr[i][0]], function (err, result) {
				news[newsArr[i][0]] = JSON.stringify(result);
			});
		}
	});
}

bringNews();
var app = express();

app.use(CORS());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

setInterval(bringNews,86400000);


app.get("/news",function (request,response) {
	response.writeHeader(200, {"Content-Type": "text/html; charset=UTF-8"});
	response.end(news[request.query.category]);
});

http.createServer(app).listen(10005, function () {
    console.log('Server running at 10005 Port');
});

