<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>workout</title>
<c:import url ="/WEB-INF/jsp/common/baseinclude.jsp"/>
</head>
<body>
<h1>workout main form h1</h1>
<hr>
<div id = "header"></div>
<div id = "container">

	<div id = "workoutList">
		<div id = "basicList"></div>
		<div id = "addableList"></div>
	</div>
	<div id = "workoutMainButtons">
		<button id = "workoutUpdateBtn">운동 편집</button>
		<button id = "workoutCalManagementBtn">칼로리 관리</button>
		<button id = "workoutViewAllchartBtn">전체 차트 보기</button>
	</div>
</div>

<div id = "footer"></div>
<script src="/WEB-INF/js/workout/workout.js"></script>
</body>
</html>