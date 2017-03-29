function workoutList(){
	var html = "";
	for(var i = 0 ; i < 10 ;i++){
		html += "<ul id = basic1>"
	}
	$("#basicList").html(html)
	/*
	<ul id = basic1>		
	<li id = "basic1Graph">O</li>
	<li id = "basic1Percentage">95%</li>
	<li id = "basic1Name">기본운동A</li>
</ul>
<ul id = basic2>		
	<li id = "basic2Graph">O</li>
	<li id = "basic2Percentage">40%</li>
	<li id = "basic2Name">기본운동B</li>
</ul>
<ul id = basic3>		
	<li id = "basic3Graph">O</li>
	<li id = "basic3Percentage">85%</li>
	<li id = "basic3Name">기본운동C</li>
</ul>
<ul id = basic4>		
	<li id = "basic4Graph">O</li>
	<li id = "basic4Percentage">80%</li>
	<li id = "basic4Name">기본운동D</li>
</ul>
	 */
	
workoutList();
}