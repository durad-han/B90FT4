<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
	<div id="sum_box" class="row mbl">
		<!-- 운동 리스트 호출 -->
		<c:forEach var='l' items='${list}'>
			<div class="col-sm-6 col-md-3">
				<div class="panel task db mbm">
					<div class="panel-body" onclick="workoutMove(${l.workoutNo})">
						<%-- <div class="panel-body" onclick="workoutMove(${l.workoutNo},'${l.workoutType}')"> --%>
						<p class="icon">
							<i class="icon fa fa-signal"></i>
						</p>
						<h4 class="value">
							<span>215</span>
						</h4>
						<p class="description">${l.workoutId}운동타입 - ${l.workoutType}</p>
						<div class="progress progress-sm mbn">
							<div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;" class="progress-bar progress-bar-danger">
								<span class="sr-only">70% Complete (success)</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	<div id="workoutMainButtons">
		<button id="workoutUpdateBtn">운동 편집</button>
	</div>
	
	<script src="${pageContext.request.contextPath}/web/js/workout/workoutList.js"></script>