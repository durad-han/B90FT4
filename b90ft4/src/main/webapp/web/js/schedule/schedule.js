console.log("schedule.js 입니다...");
console.log('${schedule}');
console.dir('${schedule}');

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

function detail(){
	var html = "";
		html += "<div id='schedule'>";
		html += "	<div id='schTitle'>";
		html += "		<h3>동대문에서 저녁약속</h3>";
		html += "	</div>";
		html += "	<div id='schTime'>";
		html += "		<h5>19:00 ~ 22:00</h5>";
		html += "	</div>";
		html += "	<div id='schContent'>";
		html += "		<p>동대문역 어디에서 누구와 저녁 뭐시기 먹자 먹고나서 시장을 좀 둘러본다던가 하는 것도 괜찮겠지 좀 귀찮긴 할텐데 이렇게 돌아다닐 수 있는것도 얼마 안 되니까...</p>";
		html += "	</div>";
		html += "	<div id='schOption'>";
		html += "		<span>예산 : 35,000</span>";
		html += "		<span> ☆ ☆ ☆ </span>";
		html += "	</div>";
		html += "</div>";
	$("#schDetail").html(html)
}



schedule();
prevNext();
detail();