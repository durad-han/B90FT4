<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title</title>
<c:import url ="/WEB-INF/jsp/common/basicInclude.jsp"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/workout/workoutTypeA.css"/>
</head>
<body>
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
	<div>
	<button>끝내기!</button>
	<button>차트보기</button>
	</div>
<script src="${pageContext.request.contextPath}/web/js/workout/workoutTypeA.js"></script>
</body>
</html>