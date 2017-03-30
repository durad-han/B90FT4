console.log("schedule.js 입니다...");
console.log('${schedule}');
console.dir('${schedule}');

//----- mobiPicker -----------------------------------------------------------
$( document ).on( "pagecreate", pageselector, function() {
    var picker = $( "input[type='text']", this );
    picker.mobipick();
});

picker.on( "change", function() {
    var date = $( this ).val();
    var dateObject = $( this ).mobipick( "option", "date" );
});

var mpFrom = $( ".min-date" ).mobipick();
var mpTo   = $( ".max-date" ).mobipick();
mpFrom.on( "change", function() {
    mpTo.mobipick( "option", "minDate", mpFrom.mobipick( "option", "date" ) );
});
mpTo.on( "change", function() {
    mpFrom.mobipick( "option", "maxDate", mpTo.mobipick( "option", "date" ) );
});


//----- schedule -------------------------------------------------------------
function schedule(){
	var html = "";
	for(var i = 0 ; i < 9 ; i++){
		html += "<li><span>"+i+"시</span><input type='checkbox' name='schAchieve'><a href='#'>"+ i+"번째 제목이 이곳에</a></li>";
	}
	$("#schedules").html(html)
	
}

function prevNext(){
	$("#prev").html("<li><span>13:00</span><input type='checkbox' name='schAchieve'><a href='#'>이전 스케줄 제목이 이곳에</a></li>")
	$("#next").html("<li><span>22:30</span><input type='checkbox' name='schAchieve'><a href='#'>다음 스케줄 제목이 이곳에</a></li>")
}

function goDetail(){
	console.log("goDetail")
	var html = "";
		html += "<div id='schedule'>";
		html += "	<div id='schTitle'>";
		html += "		<h3>"+${schedule.title}+"</h3>";
		html += "	</div>";
		html += "	<div id='schTime'>";
		html += "		<h5>"+${schedule.start}+"</h5>";
		html += "	</div>";
		html += "	<div id='schContent'>";
		html += "		<p>"+${schedule.content}+"</p>";
		html += "	</div>";
		html += "	<div id='schOption'>";
		html += "		<span>예산 : 35,000</span>";
		
		switch('${schedule.importance}'){
		case '1':
			html += "		<span>★ ☆ ☆</span>";
			break;
		case '2':
			html += "		<span>★★ ☆</span>";
			break;
		case '3':
			html += "		<span>★★★</span>";
			break;
		}
		html += "	</div>";
		html += "</div>";
	$("#schDetail").html(html)
}

function goForm(){
	console.log("goForm")
}


schedule();
prevNext();
goDetail();