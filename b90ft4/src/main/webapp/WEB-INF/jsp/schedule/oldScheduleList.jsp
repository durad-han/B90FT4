<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/bootstrap/mobipick/css/mobipick.css" /> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/web/bootstrap/mobipick/external/xdate.js"></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/web/bootstrap/mobipick/external/xdate.i18n.js"></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/web/bootstrap/mobipick/js/mobipick.js"></script> --%>

<div id="wrap">
	
	<div id="container">
	
<!-- 	좌측 사이드 메뉴 컨테이너 -->
		<div id="sideBar">
		
<!-- 		상단 datePicker 위치, 현재 날짜 default, 선택시 해당 날짜의 스케줄 리스트 출력 -->
			<div id="dayList">
			dayList
				<input class="min-date" type="text"/>
				<input class="max-date" type="text"/>
			</div>
			
<!-- 		하단 스케줄 리스트 위치 -->
			<div id="scheduleList">
			scheduleList
				<ul id="schedules">
				
<!-- 			스케줄 모두 로드하여 시간(시:분)과 달성여부(checkbox) 제목을 리스트로 출력	-->
				<c:forEach var="schedules" items='${schedule}'>
					<li>

<!-- 				리스트로 생성되는 스케줄 목록 기본 틀, 클릭시 우측 detail로 출력할 수 있게 a href 로 고유번호 먹여가며 생성 -->
					<a href="javascript:goDetail(${schedules.scheduleNo});">

<!-- 					날짜는 간단히 시작 시각의 hh:mm 출력 -->
						<fmt:formatDate value='${schedules.start}' pattern="hh:mm"/>
						
<!-- 					achieve test하여 checkbox의 checked, disabled 설정. 한번 달성되면 표시되고 비활성화 -->
						<c:choose>
							<c:when test='${schedules.achieve != 0}'>
								<input type="checkbox" name="achieved" checked="checked" disabled="disabled">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="achieved" >
							</c:otherwise>
						</c:choose>
						
<!-- 					제목 출력 -->
						<c:out value='${schedules.title }'/>
					</a>
					</li>
				</c:forEach>
				
<!-- 			해당 날짜 스케쥴이 empty일 시 메세지와 함께 form 링크 제공(수동) -->
				<c:if test='${empty schedule}'>
					<li><a href="javascript:goForm();">지금 스케줄을 추가해보세요</a></li>
				</c:if>
				
				</ul>
			</div>
		</div>

<!-- 	detail 영역. 기본화면에서는 form 링크 제공? 혹은 현재시각 스케줄 출력? 미정. -->
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
	
</div>
<script src="${pageContext.request.contextPath}/web/js/schedule/scheduleMain.js"></script>
