<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/workout/workoutTypeB.css" />
</head>
<body>

	<!--BEGIN CONTENT-->
	<div id="setContainer">
		<ul class="pagination pagination-lg mtm mbm">
			<c:import url="workoutSet.jsp"></c:import>
		</ul>
	</div>
	<div id="typeBContainer">
		<div>
			<video width="70%" height="70%" autoplay="autoplay" id="myVideo" />
		</div>
		<div>
			<button id="videoLoadBtn" onclick="videoLoad()">영상 보기</button>
			<button id="videoCloseBtn" onclick="videoClose()">영상 끄기</button>
		</div>
	</div>

	<!--END CONTENT-->

	<script src="${pageContext.request.contextPath}/web/js/workout/workoutTypeB.js"></script>

</body>
</html>