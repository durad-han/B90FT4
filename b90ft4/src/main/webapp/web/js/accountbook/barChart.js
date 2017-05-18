/**
 * http://usejsdoc.org/
 */

var ratio;

console.log("캬캬캬");

$(document).ready(function(){
	
	var year = new Date().getYear()+1900;
	var month = new Date().getMonth()+1;
	
	month = (month<10) ? "0"+month : month;
	
	console.log(year+"",month);
	makeAccRatio(year,month);
	
//	
	
//	$.ajax({
//		url:"accRatio.do",
//		async:false
//	}).done(function(result) {
////		console.log(result);
//		ratio=result;
//	});
//	
//    if($("#occupancyRatio").length!=0) {
//    	
//    	$.jqplot.config.enablePlugins = true;
//    	var s1 = [ratio];
//    	var ticks = [(new Date().getMonth()+1) + '월 가계부 작성률'];
//	    plot1 = $.jqplot('occupancyRatio', [s1], {
//	        // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
//	        animate: !$.jqplot.use_excanvas,
//	        seriesDefaults:{
//	            renderer:$.jqplot.BarRenderer,
//	            pointLabels: { show: true }
//	        },
//	        axes: {
//	            xaxis: {
//	                renderer: $.jqplot.CategoryAxisRenderer,
//	                ticks: ticks
//	            },
//	            yaxis: {
//	            	min:0,
//	            	max:100,
//	            	markSize:10
//	            }
//	        },
//	        highlighter: { show: false }
//	    });
//    }
 
});

function makeAccRatio(year,month) {
	
	$.ajax({
		url:"accRatio.do",
		data:{
			year:year,
			month:month
		},
		async:false
	}).done(function(result) {
//		console.log(result);
		ratio=result;
	});

	if($("#occupancyRatio").length!=0) {
		
		$("#occupancyRatio").empty();
		$.jqplot.config.enablePlugins = true;
		var s1 = [ratio];
		var ticks = [month + '월 가계부 작성률'];
//		$(".jqplot-xaxis-tick").html("");
		
	    plot1 = $.jqplot('occupancyRatio', [s1], {
	        // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
	        animate: !$.jqplot.use_excanvas,
	        seriesDefaults:{
	            renderer:$.jqplot.BarRenderer,
	            pointLabels: { show: true }
	        },
	        axes: {
	            xaxis: {
	                renderer: $.jqplot.CategoryAxisRenderer,
	                ticks: ticks
	            },
	            yaxis: {
	            	min:0,
	            	max:100,
	            	markSize:10
	            }
	        },
	        highlighter: { show: false }
	    });
	}
	
}







