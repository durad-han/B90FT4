(function() {
  $(document).ready(function() {
    var count, rotateY, setValueFunc, value, zero;
    zero = 0;
    rotateY = 180;
    value = -1;
    count = -1;
    maxValue = 6;
    max = "/"+maxValue;
    breakTimeVal = 10;
    
    breakTime = function(){
    	
    	alert("쉬십셔");
    }
    
    
    setValueFunc = function() {
		if(count === maxValue){

	    	$(".container").css({
	    		"transform": "rotateY(" + (zero = zero + rotateY) + "deg)"
	    	});
	    	alert("쉬ㅅ");
			if (count % 2 === 0) {
				$(".value_back").text(value + max);
				count = -1;
		    	value = -1;
					return $(".value_front").text("Start!");
			}
			 else {
				 $(".value_front").text(value + max);
				count = 0;
		    	value = 0;
					return $(".value_back").text("Start!");
			}
				
		    	

		}
		
		if (count % 2 === 0) {
			return $(".value_front").text(value + max);
		} else {
			return $(".value_back").text(value + max);
		}
    };

    $(".front").on("mousedown", function() {
      count++;
      $(".container").css({
        "transform": "rotateY(" + (zero = zero + rotateY) + "deg)"
      });
      value++;
      return setValueFunc();
    });
    $(".back").on("mousedown", function() {
    	count++;
    	$(".container").css({
    		"transform": "rotateY(" + (zero = zero + rotateY) + "deg)"
    	});
    	value++;
    	return setValueFunc();
    });
  });
  
  

}).call(this);