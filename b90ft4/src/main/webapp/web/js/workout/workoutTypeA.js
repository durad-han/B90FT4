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
function endWorkout(){
	alert("끝ㅋ");
	moveWorkoutList();
}


function moveWorkoutList(){
	location.href="workout.do";
}