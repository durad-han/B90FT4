<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--BEGIN MODAL CONFIG PORTLET-->
<div id="modal-config" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" aria-hidden="true"
					class="close">&times;</button>
				<h4 class="modal-title">세트 추가,수정,삭제</h4>
			</div>
			<div class="modal-body">
				<p>김추가 이수정 박삭제</p>
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-default">
					취소</button>
				<button type="button" class="btn btn-primary">저장</button>
			</div>
		</div>
	</div>
</div>
<!--END MODAL CONFIG PORTLET-->

<!--BEGIN CONTENT-->
<div id="setContainer">
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
					<li>등록된 세트가 없습니다.</li>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		<li><a href="#">세트 등록</a></li>
	</ul>

</div>
<div id="typeContainer">
	<c:choose>
		<c:when test="${선택된 setNo 의 workoutType eq 'A'}">
			<c:import url="workoutTypeA.jsp"></c:import>
		</c:when>
		<c:when test="${선택된 setNo 의 workoutType eq 'B'}">
			<c:import url="workoutTypeB.jsp"></c:import>
		</c:when>
		<c:when test="${선택된 setNo 의 workoutType eq 'C'}">
			<c:import url="workoutTypeC.jsp"></c:import>
		</c:when>
	</c:choose>
</div>
<div>
	<div class="buttons">
		<button id="setEndBtn" onclick="endWorkout()">운동 끝내기</button>
		<button id="viewChartBtn">차트보기</button>
	</div>
	<br> <br> <br>
</div>
<!--END CONTENT-->
