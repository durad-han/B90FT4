<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Menu</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main/main.css">
<jsp:include page="../common/baseinclude.jsp"></jsp:include>
</head>
<body>

	<div id="wrap">
		<div id="header">
		</div>
		
		<div id="container">
			
			<h1> Main (JSP) </h1>
			
			<div id="menuList">
			
			<div id="menu01" class="menuIcon">Schedule</div>
			<div id="menu02" class="menuIcon">Diary</div>
			<div id="menu03" class="menuIcon">Account Book</div>
			<div id="menu04" class="menuIcon">Workout</div>
			<div id="menu05" class="menuIcon">Null</div>
			<div id="menu06" class="menuIcon">Options</div>
			
			</div>
			
		<div id="footer">
		</div>
			
		</div>
	
	</div>
<script src="${pageContext.request.contextPath}/web/js/main/main.js"></script>
</body>
</html>