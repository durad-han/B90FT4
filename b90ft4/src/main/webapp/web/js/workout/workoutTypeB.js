var nextSet = gvSetIndex+1;
var timerEnd = 0; 
//이미지 슬라이드 가져오기
function imgSetLoad(){
	console.log("nextSet : "+nextSet);
	var html = "이번 세트 운동시간 : "+gvTypeBTime+"초"+
				"<br>이번 세트 휴식시간 : "+gvIntervalTime+"초"+
				"<div id='view' hidden>"+
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
				"</div>";
	console.log(html);
				
	$('#viewContainer').html(html);
}
imgSetLoad();

//typeB 관련 함수

$("#videoCloseBtn").addClass("hidden");
$("#youtubeCloseBtn").addClass("hidden");
var video = document.getElementById('myVideo');

//운동 시작 관련 함수
var timerHtml = "남은시간 : "+(gvTypeBTime-timerEnd)+"초";
$('#timerContainer').html(timerHtml);
function timerViewSet(){
	timerHtml = "남은시간 : "+(gvTypeBTime-timerEnd)+"초";
	$('#timerContainer').html(timerHtml);	
};
function typeBStart(){
	console.log("typeBStart load");
	//gvTypeBTime = 5;
	timerEnd = 0;
	timerViewSet();
	
	timerId = setInterval(function(){
	timerEnd++;
	timerViewSet();
	console.log(timerEnd);			
	console.log(gvIsLast);

	if(timerEnd == gvTypeBTime){
		if(gvIsLast){
			timerViewSet();
			alert("마지막 세트입니다.");
			//디비에 소모칼로리 보내는 기능 추가하기**
			calIncDec();
			clearInterval(timerId);
	  	}
		console.log("clearInterval load");
		clearInterval(timerId);
		timerViewSet();
		alert(gvIntervalTime+"초 동안 휴식 후 "+nextSet+"세트를 시작합니다.");
		//디비에 소모칼로리 보내는 기능 추가하기**
		calIncDec();
		$("#setNo"+nextSet).trigger("click");
	}
	
},1000); 
}


//사용자 카메라 가져오기
function videoLoad() {

	var constraints = { audio: true, video: true}; 
/* 	navigator.serviceWorker.register('sw.js',{insecure:true});
	navigator.serviceWorker.register('workout.js',{insecure:true}); */
	navigator.mediaDevices.getUserMedia(constraints)
	.then(function(mediaStream) {
	  var video = document.querySelector('video');
	  video.srcObject = mediaStream;
	  video.onloadedmetadata = function(e) {
	    video.play();
	  };
	});
	$("#viewContainer").addClass("hidden");
	$("#videoLoadBtn").addClass("hidden");
	$("#videoCloseBtn").removeClass("hidden");
	
    }

function videoClose(){
	var video = document.querySelector('video');
	video.pause();
	video.srcObject = null;
	
	$("#viewContainer").removeClass("hidden");
	$("#videoCloseBtn").addClass("hidden");
	$("#videoLoadBtn").removeClass("hidden");
}

//youtube 영상 가져오기 
function youtubeOpen() {
		
	var youtubeTag = '<iframe width="80%" height="70%" src="https://www.youtube.com/embed/piHCHNPDO_4" frameborder="0" allowfullscreen></iframe>';
	$("#viewContainer").html(youtubeTag);
		$("#youtubeOpenBtn").addClass("hidden");
		$("#youtubeCloseBtn").removeClass("hidden");
		
	    }
function youtubeClose(){
		imgSetLoad();
		$("#youtubeCloseBtn").addClass("hidden");
		$("#youtubeOpenBtn").removeClass("hidden");
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


slide();

