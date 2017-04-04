/**
 * 
 */
$("#videoCloseBtn").addClass("hidden");

function videoLoad() {


        var video = document.getElementById('myVideo');

        if (navigator.webkitGetUserMedia) {

			navigator.webkitGetUserMedia({audio:true, video:true},

                function(stream) { video.src = webkitURL.createObjectURL(stream); },

                function(error) { alert('ERROR: ' + error.toString()); } );
				$("#videoLoadBtn").addClass("hidden");
				$("#videoCloseBtn").removeClass("hidden");
				
        } else {

            alert('webkitGetUserMedia not supported');

        }

    }

function videoClose(){
	video.close();
	
	$("#videoCloseBtn").addClass("hidden");
	$("#videoLoadBtn").removeClass("hidden");
}
function moveWorkoutList(){
	location.href="workout.do";
}
