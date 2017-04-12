<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/workout/workoutTypeA.css" />
</head>
<body>

	<!--BEGIN CONTENT-->

	<div id="typeAContainer">
		<div class="setList"></div>
		<div class="container">
			<div class="front">
				<div></div>
				<div class="value_front">Start!</div>
				<div></div>
			</div>
			<div class="back">
				<div></div>
				<div class="value_back">0</div>
				<div></div>
			</div>
		</div>
	</div>
	<!--END CONTENT-->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/workout/workoutTypeA.js"></script>
</body>
</html>