var userId = $("#userIdTag").text();
var gvWorkoutSetNo = "";
var gvWorkoutNo = "";
var gvTypeACount = "";
var gvTypeBTime = "";
var gvSpentCal = "";
var gvIntervalTime = "";
var gvIsLast = "";
var gvSetIndex ="";
var gvToday = $.datepicker.formatDate("yy-mm-dd",new Date());
var gvIntakeCal = "";
var timerId = "";
//page load함수들
function tempMove(){
	$(".page-content").load("/b90ft4/web/view/workout/Charts.html");
}

function workoutMoveCal(){
	$(".page-content").load("/b90ft4/web/view/workout/workoutCal.html");
}

function workoutMoveChart(){
	$(".page-content").load("/b90ft4/web/view/workout/workoutChart.html");
}

function workoutMove(workoutNo){
	$.ajax({
		url:"workoutForm.do",
		dataType:"json",
		data:{"workoutNo" : workoutNo}
	}).done(function(result) {
		console.dir(result);
		//핸들바 템플릿 가져오기
		var source = $("#workoutForm").html();
		//핸들바 템플릿 컴파일
		var template = Handlebars.compile(source);	
		//핸들바 템플릿에 바인딩할 데이터
		var data = {
				setList : result
		}; 
		//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
		var html = template(data);
		//console.log(html);
		//생성된 HTML을 DOM에 주입
		$('.page-content').html(html);
		/*$(".page-content").load("/b90ft4/web/view/workout/workoutList.html");*/
		//해당 운동의 첫번째 세트 띄워줌
		$("#setNo1").trigger("click");

	
	});
}

function listLoad(result){
	
	$.ajax({
		url:"workoutList.do",
		dataType:"json",
		data:{userId : "admin"}
	}).done(function(result) {
		//console.dir(result);
		//핸들바 템플릿 가져오기
		var source = $("#workoutList").html();
		//핸들바 템플릿 컴파일
		var template = Handlebars.compile(source);	
		//핸들바 템플릿에 바인딩할 데이터
		
		var data = {
				list : result
		}; 
		
		//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
		var html = template(data);
		//console.log(html);
		//생성된 HTML을 DOM에 주입
		$('.page-content').html(html);
/*		$('.page-content').append(html);*/
		/*$(".page-content").load("/b90ft4/web/view/workout/workoutList.html");*/
	


	});
}


//타입별 로드될 html 작성
function workoutTypeLoad(workoutSetNo,workoutNo,typeACount,typeBTime,spentCal,intervalTime,isLast,setIndex){
	 gvWorkoutSetNo = workoutSetNo;
	 gvWorkoutNo = workoutNo;
	 gvTypeACount = typeACount;
	 gvTypeBTime = typeBTime;
	 gvSpentCal = spentCal;
	 gvIntervalTime = intervalTime;
	 gvIsLast = isLast;
	 gvSetIndex = setIndex;
	//console.log("workoutTypeLoad function started");
	//console.log("gvSetIndex : " + gvSetIndex);
	//setUl의 li중 id가 setNo로 시작하는 놈의 a태그에 스타일 먹이기. a태그가 li태그 잡아먹어서.
	$("#setUl li[id^='setNo'] a").attr("style", "background:#ffffff;color:rgb(10,10,10)");
	//현재 li class 주기
	$("#setUl li[id='setNo"+gvSetIndex+"'] a").attr("style", "background:rgb(240, 173, 78);color:rgb(250,250,250)");
	
	var position_x = $("#setUl a[id='set"+setIndex+"']").offset().left + ($("#setUl a[id='set"+setIndex+"']").width() / 2);
	var position_y = $("#setUl a[id='set"+setIndex+"']").offset().top - 50;
	$("#pointer").offset({ top: position_y, left: position_x-35});
	
	
	var type = "";
	if(typeACount != 0){
		type = "A";
	}else{ 
		type = "B";
	}
	console.log(type);
	var html = "";
	//typeA load
	if(type == "A"){
		$("#typeContainer").load("/b90ft4/web/view/workout/sample.html");
	}

	
	//typeB load
	else if(type == "B"){
		console.log("typeB load");
	
		$("#typeContainer").load("/b90ft4/web/view/workout/workoutTypeB.html");
		//해당 운동의 첫번째 세트 띄워줌 ERRORCODE2
		//$("#setNo1").trigger("click");
	}
	
	/*console.log(html);*/
}

listLoad();

//today calorie column insert
function calColumnInsert(){
	//console.log("calColumnInsertload : " );
	var today = $.datepicker.formatDate("yy-mm-dd",new Date());
	//console.log("today : "+today );
	gvToday = today;
	console.log("gvToday : " + gvToday);
	console.log("calColumnInsertload2 : " );
	$.ajax({
		url:"InsertWorkoutStatistics.do",
		dataType:"json",
		data : {"today" : gvToday , "userId" : userId }
		}).done(function(result){
			
			console.log("calColumnInsertload3 : " );
			console.dir(result);
			
		});
	console.log("calColumnInsertload4 : " );
	
	
}
calColumnInsert();
//today calorie colunm update
function calIncDec(){
//console.log("calIncDec load");
var spentCal = parseInt(gvSpentCal);
var intakeCal = parseInt(gvIntakeCal);
if(isNaN(spentCal)){
	spentCal = 0;
}
if(isNaN(intakeCal)){
	intakeCal = 0;
}
//console.log("spentCal : " + spentCal);
//console.log("intakeCal : " + intakeCal);

$.ajax({
	url : "UpdateWorkoutStatistics.do",
	dataType : "json",
	data : {"spentCal" : spentCal , "intakeCal" : intakeCal ,"today" : gvToday, "userId" : userId} 
}).done(function(result){
	console.log("얻거나 소모한 칼로리 저장됨.");
	});
}

calIncDec();
