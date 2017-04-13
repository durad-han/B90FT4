
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

//typeA 관련 함수

(function() {
	  $(document).ready(function() {
	    var count, rotateY, setValueFunc, value, zero;
	    zero = 0;
	    rotateY = 180;
	    value = -1;
	    count = -1;
	    maxValue = 7;
	    max = "/"+maxValue;
	    breakTimeVal = 10;
	    


	    $(".front").on("mousedown", function() {
	      count++;
	      $("#typeAContainer").css({"background": "#0080ff"});
	      $(".container").css({
	        "transform": "rotateY(" + (zero = zero + rotateY) + "deg)"
	      });
	      value++;
	      
	      if(count === maxValue){
	    	  $("#typeAContainer").css({"background": "#ff7373"});
	    	  alert("break time");
	          $(".container").css({
	              "transform": "rotateY(" + (zero = zero + rotateY) + "deg)"
	            });
	    	  value = -1;
	    	  count = -1;
	    	  return $(".value_front").text("Start!");
	      }
	      
	      return $(".value_back").text(value + max);
	    });
	    $(".back").on("mousedown", function() {
	    	count++;
	    	$("#typeAContainer").css({"background": "#0080ff"});
	    	$(".container").css({
	    		"transform": "rotateY(" + (zero = zero + rotateY) + "deg)"
	    	});
	    	value++;
	        if(count === maxValue){
	        	$("#typeAContainer").css({"background": "#ff7373"});
	      	  alert("break time");
	            $(".container").css({
	                "transform": "rotateY(" + (zero = zero + rotateY) + "deg)"
	              });
	      	  value = -1;
	      	  count = -1;
	      	  return $(".value_back").text("Start!");
	        }
	    	return $(".value_front").text(value + max);
	    });
	  });
	  

	}).call(this);


//typeB 관련 함수
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


//타입별 로드될 html 파싱
function workoutTypeLoad(workoutSetNo,workoutNo,typeACount,typeBTime,spentCal,intervalTime){
	
	console.log("workoutTypeLoad function started");
	var type="";
	if(typeACount != 0){
		type = "A";
	}else{ 
		type = "B";
	}
	console.log(type);
	var html = "";
	//typeA load
	if(type == "A"){
		console.log("typeA load");
		
		html += "<meta charset='UTF-8'>"+
				"<div id='typeAContainer'>"+
					"<div class='setList'></div>"+
					"<div class='container'>"+
						"<div class='front'>"+
							"<div></div>"+
							"<div class='value_front'>Start!</div>"+
							"<div></div></div>"+
						"<div class='back'><div></div>"+
							"<div class='value_back'>0</div>"+
							"<div></div></div></div></div>";
	}
	//typeB load
	else if(type == "B"){
		console.log("typeB load");
		
		

		html += "typeB load"+
				"<div id='setContainer'>"+
				"</div><div id='typeBContainer'>"+
				"<div><video width='70%' height='70%' autoplay='autoplay' id='myVideo' /></div><div>"+
				"<button id='videoLoadBtn' onclick='videoLoad()'>영상 보기</button>"+
				"<button id='videoCloseBtn' onclick='videoClose()'>영상 끄기</button></div></div>";
				
	}
	$('#typeContainer').html(html);
	console.log(html);
}


listLoad();

function endWorkout(){
	listLoad();
}


/*function workoutTypeLoad(workoutSetNo,workoutNo,typeACount,typeBTime,spentCal,intervalTime){
	alert(workoutSetNo+" "+workoutNo+" "+typeACount+" "+typeBTime+" "+spentCal+" "+intervalTime);
}*/
/*
function workoutTypeLoad(workoutSetNo,workoutNo,typeACount,typeBTime,spentCal,intervalTime,workoutDescription,WorkoutType){
	alert(workoutSetNo+" "+workoutNo+" "+typeACount+" "+typeBTime+" "+spentCal+" "+intervalTime+" "+workoutDescription+" "+WorkoutType);
}
function workoutTypeLoad(workoutSetNo,workoutNo,typeACount,typeBTime,spentCal,intervalTime,workoutDescription,WorkoutType){
	alert(workoutSetNo+" "+workoutNo+" "+typeACount+" "+typeBTime+" "+spentCal+" "+intervalTime+" "+workoutDescription+" "+WorkoutType);
}
function workoutTypeLoad(workoutSetNo,workoutNo,typeACount,typeBTime,spentCal,intervalTime,workoutDescription,WorkoutType){
	alert(workoutSetNo+" "+workoutNo+" "+typeACount+" "+typeBTime+" "+spentCal+" "+intervalTime+" "+workoutDescription+" "+WorkoutType);
}
function workoutTypeLoad(workoutSetNo,workoutNo,typeACount,typeBTime,spentCal,intervalTime,workoutDescription,WorkoutType){
	alert(workoutSetNo+" "+workoutNo+" "+typeACount+" "+typeBTime+" "+spentCal+" "+intervalTime+" "+workoutDescription+" "+WorkoutType);
}
*/

