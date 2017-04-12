
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
$("#videoCloseBtn").addClass("hidden");
var video = document.getElementById('myVideo');

function videoLoad() {

	var constraints = { audio: true, video: true}; 

	navigator.mediaDevices.getUserMedia(constraints)
	.then(function(mediaStream) {
	  var video = document.querySelector('video');
	  video.srcObject = mediaStream;
	  video.onloadedmetadata = function(e) {
	    video.play();
	  };
	});
	$("#videoLoadBtn").addClass("hidden");
	$("#videoCloseBtn").removeClass("hidden");
	
    }

function videoClose(){
	var video = document.querySelector('video');
	video.pause();
	video.srcObject = null;
	
	$("#videoCloseBtn").addClass("hidden");
	$("#videoLoadBtn").removeClass("hidden");
}
function workoutTypeLoad(workoutSetNo,typeACount,typeBTime,intervalTime,workoutDescription){
	var type="";
	if(typeACount != 0){
		type = "A";
	}else{ 
		type = "B";
	}
	
	var html = "";
	//typeA load
	if(type = "A"){
		alert("typeA load");
		
		html += "<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/web/css/workout/workoutTypeA.css' />";
	}
	//typeB load
	else if(type = "B"){
		alert("typeB load");
		
		

		html += "<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/web/css/workout/workoutTypeB.css' />"+
				"<div id='setContainer'>"+
				"<ul class='pagination pagination-lg mtm mbm'>"+
				"<c:import url='workoutSet.jsp'></c:import>"+
				"</ul>"+
				"</div><div id='typeBContainer'>"+
				"<div><video width='70%' height='70%' autoplay='autoplay' id='myVideo' /></div><div>"+
				"<button id='videoLoadBtn' onclick='videoLoad()'>영상 보기</button>"+
				"<button id='videoCloseBtn' onclick='videoClose()'>영상 끄기</button></div></div>";
				
	}
	$('#typeContainer').html(html);
	
}


listLoad();

function endWorkout(){
	listLoad();
}


