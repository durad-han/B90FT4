
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
	

/*
        if (navigator.webkitGetUserMedia) {

			navigator.webkitGetUserMedia({audio:true, video:true},

                function(stream) { video.src = webkitURL.createObjectURL(stream); },

                function(error) { alert('ERROR: ' + error.toString()); } );
			
			
				$("#videoLoadBtn").addClass("hidden");
				$("#videoCloseBtn").removeClass("hidden");
				
        } else {

            alert('지원하지 않는 브라우저 입니다.');

        }
*/
	
    }

function videoClose(){
	var video = document.querySelector('video');
	video.pause();
	video.srcObject = null;
	
	$("#videoCloseBtn").addClass("hidden");
	$("#videoLoadBtn").removeClass("hidden");
}
/*function moveWorkoutList(){
	location.href="workout.do";
}*/
function endWorkout(){
	alert("끝ㅋ");
	moveWorkoutList();
}

