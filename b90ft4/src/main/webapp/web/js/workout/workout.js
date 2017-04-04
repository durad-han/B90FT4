function workoutList(){
	var html = "";
	html += "<ul id = basic1>basic1"
	for(var i = 0 ; i < 10 ;i++){
		html += "<li id = 'basic1Graph'>O</li>"
	}
	html += "</ul>";
	$("#basicList").html(html);
/*	
	var html2="<ul><c:forEach var='l' items='${list}'>" +
			"<li>${l.workoutNo}</li>" +
			"<li>${l.userId}</li>" +
			"<li>${l.workoutId}</li>" +
			"<li>${l.isBasic}</li>" +
			"</c:forEach></ul>";

		
	$("#addableList").html(html2)
	*/
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
	
}
workoutList();
function workoutMove(result){
	var typePath = "";
	switch (result) {
	case 1:
		typePath="A";
		break;
	case 2:
		typePath="B";
		break;
	case 3:
		typePath="B";
		break;

	default:
		typePath="A";
		break;
	}
	location.href="workoutType"+typePath+".do";
}
