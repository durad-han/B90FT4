console.log("scheduleMain.js 로드됨...");

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
//----- 좌측 스케줄 리스트로부터 선택된 스케줄 detail 값 받아오기
function goDetail(sNo){
	console.log("goDetail")
	console.log(sNo + "번 스케줄 출력");
	
	$.ajax({
		url : "/b90ft4/schedule/rschedule.json",
		type: "POST",
		// 리스트의 a 스크립트 링크 내부에 심어놓은 스케줄 고유번호
		data: {scheduleNo : sNo},
		dataType: "json"
	}).done(printSchedule);
}

//----- 받아온 값으로 스케줄 출력
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
		
		// 중요도 설정
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
	prevNext(result.scheduleNo);
}

//----- 해당 스케줄의 이전, 다음 스케줄 연결 생성
function prevNext(scheduleNo){
	var prevHtml = "";
	var nextHtml = "";
	
	$.ajax({
		//고민점 : 이전 글이 삭제되어 고유번호가 비어있을 경우 건너뛰어 그 이전 글을 받아오려면?
		url : "/b90ft4/schedule/rschedule.json",
		type: "POST",
		data: {scheduleNo : scheduleNo-1},
		dataType: "json"
	}).done(function(result){
		console.log("prev");
		console.dir(result);
		prevHtml += "<a href='javascript:goDetail("+result.scheduleNo+")'>";
		prevHtml += "이전 스케줄 "+result.start + result.title;
		prevHtml += "</a>";
		$("#prev").html(prevHtml)
	})
	
	$.ajax({
		url : "/b90ft4/schedule/rschedule.json",
		type: "POST",
		data: {scheduleNo : scheduleNo+1},
		dataType: "json"
	}).done(function(result){
		console.log("next");
		console.dir(result);
		nextHtml += "<a href='javascript:goDetail("+result.scheduleNo+")'>";
		nextHtml += "다음 스케줄 "+result.start + result.title;
		nextHtml += "</a>";
		$("#next").html(nextHtml)
	})
}

//----- 스케줄 입력 폼 띄우기
function goForm(){
	console.log("goForm")
}


