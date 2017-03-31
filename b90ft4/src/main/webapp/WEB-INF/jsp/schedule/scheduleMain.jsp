<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule</title>
<jsp:include page="../common/baseinclude.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/schedule/schedule.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/bootstrap/mobipick/css/mobipick.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/web/bootstrap/mobipick/external/xdate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/bootstrap/mobipick/external/xdate.i18n.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/bootstrap/mobipick/js/mobipick.js"></script>

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
				<input class="min-date" type="text"/>
				<input class="max-date" type="text"/>
			</div>
			<div id="scheduleList">
			scheduleList
				<ul id="schedules">
				
				<c:forEach var="schedules" items='${schedule}'>
					<li>
					<a href="javascript:goDetail();">
						<fmt:formatDate value='${schedules.start}' pattern="hh:mm"/>
						<input type="checkbox">
						<c:out value='${schedules.title }'/>
					</a>
					</li>
				</c:forEach>
				<c:if test='${empty schedule}'>
					<li><a href="javascript:goForm();">지금 스케줄을 추가해보세요</a></li>
				</c:if>
				
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
			
			<button>새 스케줄 등록</button>
			
		</div>
	</div>
	
	<div id="footer">
	footer
	</div>
	
</div>

<script>
function goDetail(){
	console.log("goDetail!")
	$.ajax({
		url : "/b90ft4/schedule/rschedule.json",
		type: "POST",
		data: {scheduleNo : 2},
		dataType: "json"
	}).done(printSchedule);
}

function printSchedule(result){
	console.log("디테일 꾸미기")
	var html = "";
		html += "<div id='schedule'>";
		html += "	<div id='schTitle'>";
		html += "		<h3>"+result.title+"</h3>";
		html += "	</div>";
		html += "	<div id='schTime'>";
		html += "		<h5>"+result.start+"</h5>";
		html += "	</div>";
		html += "	<div id='schContent'>";
		html += "		<p>"+result.content+"</p>";
		html += "	</div>";
		html += "	<div id='schOption'>";
		html += "		<span>예산 : 35,000</span>";
		console.log(result.importance);
		switch(result.importance){
		case '1':
			html += "		<span>★ ☆ ☆</span>";
			break;
		case '2':
			html += "		<span>★ ★ ☆</span>";
			break;
		case '3':
			html += "		<span>★ ★ ★</span>";
			break;
		default:
			html += "		<span>☆ ☆ ☆</span>";
			break;
		}
		html += "	</div>";
		html += "</div>";
	$("#schDetail").html(html)
}
</script>
<script src="${pageContext.request.contextPath}/web/js/schedule/scheduleMain.js"></script>
</body>
</html>