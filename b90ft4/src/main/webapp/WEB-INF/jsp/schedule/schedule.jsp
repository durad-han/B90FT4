<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule</title>
<link rel="import" href="../common/baseinclude.jsp">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/schedule/schedule.css">
</head>
<body>
<div id="wrap">

	<div id="header">
	header
	</div>
	
	<div id="container">
		<div id="sideBar">
			<div id="dayList">
			dayList
				<ul>
					<li>datePicker here</li>
					<li>2017 / 03 / 24</li>
					<li><button onclick="">임시조회</button></li>
					
				</ul>
			</div>
			<div id="scheduleList">
			scheduleList
				<ul id="schedules">
					<li><a href="#"></a></li>
				</ul>
			</div>
		</div>

		<div id="scheduleDetail">
		scheduleDetail
			<div id="detailView">
			detailView
				<div id="prev">
				</div>
				
				<div id="schDetail">
				</div>
				
				<div id="next">
				</div>
			</div>
			<button>이게무슨버튼이더라</button>
		</div>
	</div>
	
	<div id="footer">
	footer
	</div>
	
</div>

<script src="${pageContext.request.contextPath}/web/js/schedule/schedule.js"></script>
</body>
</html>