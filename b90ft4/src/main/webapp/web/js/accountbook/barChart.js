/**
 * http://usejsdoc.org/
 */

var ratio;

$(document).ready(function(){
	
	$.ajax({
		url:"accRatio.do",
		async:false
	}).done(function(result) {
		console.log(result);
		ratio=result;
	});
	
    if($("#occupancyRatio").length!=0) {
    	
    	$.jqplot.config.enablePlugins = true;
    	var s1 = [ratio];
    	var ticks = ['가계부 작성률'];
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
 
//    $('#occupancyRatio').bind('jqplotDataClick', 
//        function (ev, seriesIndex, pointIndex, data) {
//            $('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
//        }
//    );
	
});