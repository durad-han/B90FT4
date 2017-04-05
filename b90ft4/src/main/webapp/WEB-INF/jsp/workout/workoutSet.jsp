<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title</title>
</head>
<body>
<!-- workoutSetNo로 개체식별,workoutNo로 운동 종류 식별,count와time 둘 중 하나가 비어있는걸로 표시할 내용 식별 -->
	<ul class="pagination pagination-lg mtm mbm" id="setUl">

		<c:forEach var='l' items='${setList}' varStatus="loop">
		
			<c:choose>
				<c:when test="${l.typeBTime eq '0'}">
				  <li><a href="#"> ${loop.count} 세트<br>0/${l.typeACount}<br>${l.workoutNo}</a></li>
				</c:when>
				<c:when test="${l.typeACount eq '0'}">
				  <li><a href="#"> ${loop.count} 세트<br>${l.typeBTime}초<br>${l.workoutNo}</a></li>
				</c:when>
				<c:otherwise>
					<li>등록된 세트가 없습니다.<a href="#">세트 등록</a></li>
				</c:otherwise>
			</c:choose>
		
		</c:forEach>
		
	  </ul>
							
</body>
</html>