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
	html += "<form id='scheduleForm'>"
	html += "<div class='form-body pal'>"
	html += "<div class='form-group' id='schedule'>"
	html += "    <div class='input-icon right'>"
	html += "        <i class='fa fa-user'></i>"
	html += "        <input id='inputTitle' type='text' placeholder='"+result.title+"' class='form-control' /></div>"
	html += "</div>"
	html += "<div class='row'>"
	html += "    <div class='col-md-6'>"
	html += "        <div class='form-group'>"
	html += "            <input id='inputStart' type='text' placeholder='"+result.start+"' class='form-control' /></div>"
	html += "    </div>"
	html += "    <div class='col-md-6'>"
	html += "        <div class='form-group'>"
	html += "            <input id='inputEnd' type='text' placeholder='"+result.end+"' class='form-control' /></div>"
	html += "    </div>"
	html += "</div>"
	html += "<div class='form-group'>"
	html += "    <div class='input-icon right'>"
	html += "        <i class='fa fa-user'></i>"
	html += "        <input id='inputContent' type='text' placeholder='"+result.content+"' class='form-control' /></div>"
	html += "</div>"
	html += "<div class='form-group'>"
	html += "   <select class='form-control' id='inputImportance'>"
	switch(result.importance){
	case '1':
		html += "       <option value='0'>☆ ☆ ☆</option>"
		html += "       <option value='1' selected='selected'>★ ☆ ☆</option>"
		html += "       <option value='2'>★ ★ ☆</option>"
		html += "       <option value='3'>★ ★ ★</option>"
		break;
	case '2':
		html += "       <option value='0'>☆ ☆ ☆</option>"
		html += "       <option value='1'>★ ☆ ☆</option>"
		html += "       <option value='2' selected='selected'>★ ★ ☆</option>"
		html += "       <option value='3'>★ ★ ★</option>"
		break;
	case '3':
		html += "       <option value='0'>☆ ☆ ☆</option>"
		html += "       <option value='1'>★ ☆ ☆</option>"
		html += "       <option value='2'>★ ★ ☆</option>"
		html += "       <option value='3' selected='selected'>★ ★ ★</option>"
		break;
	default:
		html += "       <option value='0' selected='selected'>☆ ☆ ☆</option>"
		html += "       <option value='1'>★ ☆ ☆</option>"
		html += "       <option value='2'>★ ★ ☆</option>"
		html += "       <option value='3'>★ ★ ★</option>"
	break;
	}
		
	html += "   </select></div>"
	html += "<div class='form-actions text-center pal'>"
	html += "	<button onclick='goModify("+result.scheduleNo+");' class='btn btn-warning'>수정</button>"
	html += "	<button onclick='goDelete("+result.scheduleNo+");' class='btn btn-danger'>삭제</button>"
	html += "</div>"
	html += "</form>"
	html += "</div>"
		
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
		prevHtml += "이전 스케줄 : ";
		prevHtml += "<strong>"+result.title+"</strong>";
		prevHtml += "<p class='date'>"+result.start+"</p>";
		prevHtml += "</p>";
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
		nextHtml += "다음 스케줄 : ";                                            
		nextHtml += "<strong>"+result.title+"</strong>";                    
		nextHtml += "<p class='date'>"+result.start+"</p>";                 
		nextHtml += "</p>";                                                 
		nextHtml += "</a>";                                                 
		$("#next").html(nextHtml)
	})
}

//----- 스케줄 입력
function insertForm(){
	console.log("insertForm")
}

//----- 스케줄 수정
function goModify(scheduleNo){
	console.log("goModify : "+scheduleNo+"번 스케줄")
	
}

//----- 스케줄 삭제
function goDelete(scheduleNo){
	console.log("goDelete : "+scheduleNo+"번 스케줄")
	
}

$("#scheduleForm").submit(function(){
	console.log("스케줄 폼 가로챔?")
})
