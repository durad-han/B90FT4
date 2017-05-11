var userId = 'tester01';
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

/*
//typeA 관련 함수
var count, rotateY, setValueFunc, value, zero;
zero = 0;
rotateY = 180;
value = -1;
count = -1;
maxValue = 7;
max = "/"+maxValue;
breakTimeVal = 10;

$(".front").on("mousedown", function() {
	console.log(tempWorkoutSetNo);
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
	console.log("backㅋㅋ");
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

*/

/*
//typeB 관련 함수
$("#videoCloseBtn").addClass("hidden");
var video = document.getElementById('myVideo');

function videoLoad() {

	
	var constraints = { audio: true, video: true}; 
	navigator.serviceWorker.register('sw.js',{insecure:true});
	navigator.serviceWorker.register('workout.js',{insecure:true});
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
function slide() {

    // slider type
    $t = "slide"; // opitions are fade and slide
    
  	//variables
    $f = 1000,  // fade in/out speed
    $s = 1000,  // slide transition speed (for sliding carousel)
    $d = 5000;  // duration per slide
    
    $n = $('.slide').length; //number of slides
    $w = $('.slide').width(); // slide width
  	$c = $('.timerContainer').width(); // container width
   	$ss = $n * $w; // slideshow width
  
  	
      function timer() {
        $('.timer').animate({"width":$w}, $d);
        $('.timer').animate({"width":0}, 0);
    }

  
  // fading function
    function fadeInOut() {
      timer();
        $i = 0;    
        var setCSS = {
            'position' : 'absolute',
            'top' : '0',
            'left' : '0'
        }        
        
        $('.slide').css(setCSS);
        
        //show first item
        $('.slide').eq($i).show();
        

        setInterval(function() {
          timer();
            $('.slide').eq($i).fadeOut($f);
            if ($i == $n - 1) {
                $i = 0;
            } else {
                $i++;
            }
            $('.slide').eq($i).fadeIn($f, function() {
                $('.timer').css({'width' : '0'});
            });

        }, $d);
        
    }
    
    function slide() {
      timer();
        var setSlideCSS = {
            'float' : 'left',
            'display' : 'inline-block',
          	'width' : $c
        }
        var setSlideShowCSS = {
            'width' : $ss // set width of slideshow container
        }
        $('.slide').css(setSlideCSS);
        $('.slideshow').css(setSlideShowCSS); 
        
        
        setInterval(function() {
            timer();
            $('.slideshow').animate({"left": -$w}, $s, function(){
                // to create infinite loop
                $('.slideshow').css('left',0).append( $('.slide:first'));
            });
        }, $d);
        
    }
    
    if ($t == "fade") {
        fadeInOut();
        
    } if ($t == "slide") {
        slide();
        
    } else {
      
    }
}

*/
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
	console.log("workoutTypeLoad function started");
	console.log("gvSetIndex : " + gvSetIndex);
	$("#currentSet").html("현재 세트 : "+gvSetIndex);
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
		
/*
		html += "<div id='typeAContainer'>"	+
					"<div class='container'>"+
						"<div class='front'>"+
							"<div></div>"+
							"<div class='value_front'>Start!</div>"+
							"<div></div>"+
						"</div>"+
						"<div class='back'>"+
							"<div></div>"+
							"<div class='value_back'>0</div>"+
							"<div></div>"+
						"</div>"+
					"</div>"+
				"</div>";
		
		$('#typeContainer').html(html);
*/
		
		$("#typeContainer").load("/b90ft4/web/view/workout/workoutTypeA.html");
		//해당 운동의 첫번째 세트 띄워줌 ERRORCODE1
		//$("#setNo1").trigger("click");
	}
	//typeB load
	else if(type == "B"){
		console.log("typeB load");
		/*
		html += "<div id='setContainer'>"+
				"</div><div id='typeBContainer'>"+
				"이번 세트 운동시간 : "+typeBTime+"초"+
				"<br>이번 세트 휴식시간:"+intervalTime+"초"+
				"<div id='view'>"+
				
				"<div id='timeline'>"+
				"<div class='timerContainer'>"+
				  "<div class='timer'></div>"+
				  "<div class='slideshow'>"+
				    "<div class='slide'>01</div>"+
				    "<div class='slide'>02</div>"+
				    "<div class='slide'>03</div>"+
				    "<div class='slide'>04</div>"+
				  "</div>"+
				"</div>"+
				"</div>"+
				
				"<div><video width='70%' height='70%' autoplay='autoplay' id='myVideo' /></div><div>"+
				"<button id='videoLoadBtn' class='btn btn-primary' onclick='videoLoad()'>거울 보기</button>"+	
				"<button id='videoCloseBtn' class='btn btn-default' onclick='videoClose()'>거울 끄기</button></div></div></div>";
		$('#typeContainer').html(html);
		$("#videoCloseBtn").addClass("hidden");
		slide();*/
		
		$("#typeContainer").load("/b90ft4/web/view/workout/workoutTypeB.html");
		//해당 운동의 첫번째 세트 띄워줌 ERRORCODE2
		//$("#setNo1").trigger("click");
	}
	
	/*console.log(html);*/
}


listLoad();

function endWorkout(){
	listLoad();
}

//today calorie column insert
function calColumnInsert(){
	console.log("calColumnInsertload : " );
	var today = $.datepicker.formatDate("yy-mm-dd",new Date());
	console.log("today : "+today );
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
console.log("calIncDec load");
var spentCal = parseInt(gvSpentCal);
var intakeCal = parseInt(gvIntakeCal);
if(isNaN(spentCal)){
	spentCal = 0;
}
if(isNaN(intakeCal)){
	intakeCal = 0;
}
console.log("spentCal : " + spentCal);
console.log("intakeCal : " + intakeCal);

$.ajax({
	url : "UpdateWorkoutStatistics.do",
	dataType : "json",
	data : {"spentCal" : spentCal , "intakeCal" : intakeCal ,"today" : gvToday, "userId" : userId} 
}).done(function(result){
	console.log("얻거나 소모한 칼로리 저장됨.");
	});
}

calIncDec();

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

