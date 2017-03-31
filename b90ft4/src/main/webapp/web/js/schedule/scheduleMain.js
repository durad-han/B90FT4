console.log("schedule.js 입니다...");

//----- mobiPicker -----------------------------------------------------------
//$( document ).on( "pagecreate", function(event) {
//    var picker = $( "input[type='text']", this );
//    picker.mobipick();
//});
//
//picker.on( "change", function() {
//    var date = $( this ).val();
//    var dateObject = $( this ).mobipick( "option", "date" );
//});
//
//var mpFrom = $( ".min-date" ).mobipick();
//var mpTo   = $( ".max-date" ).mobipick();
//mpFrom.on( "change", function() {
//    mpTo.mobipick( "option", "minDate", mpFrom.mobipick( "option", "date" ) );
//});
//mpTo.on( "change", function() {
//    mpFrom.mobipick( "option", "maxDate", mpTo.mobipick( "option", "date" ) );
//});


//----- schedule -------------------------------------------------------------
function prevNext(){
	$("#prev").html("<li><span>13:00</span><input type='checkbox' name='schAchieve'><a href='#'>이전 스케줄 제목이 이곳에</a></li>")
	$("#next").html("<li><span>22:30</span><input type='checkbox' name='schAchieve'><a href='#'>다음 스케줄 제목이 이곳에</a></li>")
}

function goDetail(){
	console.log("goDetail!")
	$.ajax({
		url : "/b90ft4/schedule/rschedule.json",
		type: "POST",
		data: {scheduleNo : 2},
		dataType: "json"
	}).done(printSchedule);
}

function printSchedule(result){
	console.log("디테일 꾸미기")
	var html = "";
		html += "<div id='schedule'>";
		html += "	<div id='schTitle'>";
		html += "		<h3>"+result.title+"</h3>";
		html += "	</div>";
		html += "	<div id='schTime'>";
		html += "		<h5>"+result.start+"</h5>";
		html += "	</div>";
		html += "	<div id='schContent'>";
		html += "		<p>"+result.content+"</p>";
		html += "	</div>";
		html += "	<div id='schOption'>";
		html += "		<span>예산 : 35,000</span>";
		console.log(result.importance);
		switch(result.importance){
		case '1':
			html += "		<span>★ ☆ ☆</span>";
			break;
		case '2':
			html += "		<span>★ ★ ☆</span>";
			break;
		case '3':
			html += "		<span>★ ★ ★</span>";
			break;
		default:
			html += "		<span>☆ ☆ ☆</span>";
			break;
		}
		html += "	</div>";
		html += "</div>";
	$("#schDetail").html(html)
	prevNext();
}

function goForm(){
	console.log("goForm")
}


