<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>B90FT4 | 운동</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
	<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/web/css/workout/workoutTypeA.css' />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/workout/timerTest.css"/>
	<script src="${pageContext.request.contextPath}/web/js/common/handlebars.min.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/workout/handlebarsHelper.js"></script>
</head>
<body>
<div>
<!-- 위로가기 ==================================================================================================== -->
	<a id="totop" href="#"><i class="fa fa-angle-up"></i></a>       
<!-- 상단 메뉴 시작 ==================================================================================================== -->
<div id="header-topbar-option-demo" class="page-header-topbar">
    <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
	<div class="navbar-header">
	    <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only"> toggle </span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
	    <a id="logo" href="http://14.32.66.123:9092/b90ft4/main/main.do" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">B90FT4</span><span style="display: none" class="logo-text-icon">µ</span></a>
	        </div>
	        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
              <ul class="nav navbar-nav">
              <li><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a></li>
<!-- 메뉴 옵션들 ==================================================================================================== -->
                  <li class="active"><a href="http://14.32.66.123:9092/b90ft4/main/main.do">메인</a></li>
                  <li class="dropdown"><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleList.do" data-toggle="dropdown" class="dropdown-toggle">스케줄<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                      	  <li><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleList.do">스케줄 리스트</a></li>
                          <li><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleCalendar.do">스케줄 캘린더</a></li>
                          <li><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleGraph.do">스케줄 그래프</a></li>
                          <li class="divider"></li>
                          <li><a href="#">임시메뉴</a></li>
                      </ul>
                  </li>
                  <li><a href="http://14.32.66.123:9092/b90ft4/diary/list.do">다이어리</a></li>
                  <li><a href="http://14.32.66.123:9092/b90ft4/accountBook/main.do">가계부</a></li>
                  <li><a href="http://14.32.66.123:9092/b90ft4/workout/workout.do">운동</a></li>
<!-- 미사용 드롭다운 샘플 ==================================================================================================== -->
                  <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">드롭다운 샘플<b class="caret" ></b></a>
                      <ul class="dropdown-menu">
                          <li><a href="#">Action</a></li>
                          <li><a href="#">Another action</a></li>
                          <li><a href="#">Something else here</a></li>
                          <li class="divider"></li>
                          <li><a href="#">Separated link</a></li>
                          <li class="divider"></li>
                          <li><a href="#">One more separated link</a></li>
                      </ul>
                  </li>
              </ul>
<!-- 로그인 & 메모 ==================================================================================================== -->
              <ul class="nav navbar-nav navbar-right">
              	<li><a href="#callModal">Login</a></li>
				<li style='margin-right: 20px;'>
                <input type="checkbox" id="showAndHideMemo" name='memoOpt' value='1' checked/>
					<label for='showAndHideMemo'>메모 보기</label>
                </li>
                <li>
	                <div id="addMemo">
						<button><img src="icon_add_stickynote.gif" />메모 추가</button>
					</div>
                </li>
              </ul>
    </div>     
	</nav>
</div>
<!-- 상단메뉴 종료 ==================================================================================================== -->
		<div id="wrapper">
			<!--BEGIN SIDEBAR MENU-->
			<nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;" data-position="right" class="navbar-default navbar-static-side">
				<div class="sidebar-collapse menu-scroll">
					<ul id="side-menu" class="nav">

						<div class="clearfix"></div>

						<li class="active"><a href="/b90ft4/workout/workout.do"><i
								class="fa fa-fw">
									<div class="icon-bg bg-green"></div>
							</i><span class="menu-title">운동 하기</span></a></li>
						<li><a href="#"><i class="fa fa-fw">
									<div class="icon-bg bg-violet"></div>
							</i><span class="menu-title">칼로리 계산</span></a></li>
						<li><a href="#"><i class="fa fa-fw">
									<div class="icon-bg bg-blue"></div>
							</i><span class="menu-title">차트</span></a></li>
					</ul>					
				</div>
			</nav>
			<!--END SIDEBAR MENU-->
			<!--BEGIN PAGE WRAPPER-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<div class="page-header pull-left">
						<div class="page-title">운동</div>
					</div>
					<ol class="breadcrumb page-breadcrumb pull-right">
						<li><i class="fa fa-home"></i>&nbsp;<a href="http://14.32.66.123:9092/b90ft4/main/main.do">Home</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="hidden"><a href="#">운동</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="active">운동</li>
					</ol>
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
				</div>
				<!--END CONTENT-->
				<!--BEGIN FOOTER-->
				<div id="footer">
					<div class="copyright">
						<a>B90FT4 Footer</a>					
					</div>
				</div>
				<!--END FOOTER-->
			</div>
			<!--END PAGE WRAPPER-->
		</div>
	</div>
<script id="workoutList" type="text/x-handlebars-template">

	<div id="sum_box" class="row mbl">
	<!-- 운동 리스트 호출 -->

		{{#list}} 
			<div class="col-sm-6 col-md-3">
				<div class="panel task db mbm">
					<div class="panel-body" onclick="workoutMove({{workoutNo}})">
						<%-- <div class="panel-body" onclick="workoutMove(${l.workoutNo},'${l.workoutType}')"> --%>
						<p class="icon">
							<i class="icon fa fa-signal"></i>
						</p>
						<h4 class="value">
							<span>215</span>
						</h4>
						<p class="description">{{workoutId}}운동타입 - {{workoutType}}</p>
						<div class="progress progress-sm mbn">
							<div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;" class="progress-bar progress-bar-danger">
								<span class="sr-only">70% Complete (success)</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		{{/list}} 
	</div>
	<div id="workoutMainButtons">
		<button class='btn btn-primary' id="workoutUpdateBtn">운동 편집</button>
 		
	</div>
   
</script>

<script id="workoutForm" type="text/x-handlebars-template">

<!--BEGIN MODAL CONFIG PORTLET-->

            <div id="modal-config" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="close">
                                &times;</button>
                            <h4 class="modal-title">
                               	 세트 추가,수정,삭제</h4>
                        </div>
                        <div class="modal-body">
                            <p>
                            	김추가 이수정 박삭제                            
                                </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-default">
                                취소</button>
                            <button type="button" class="btn btn-primary">
                                저장</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--END MODAL CONFIG PORTLET-->
         <!-- 운동 폼 호출 -->
            <div id="setContainer">
				<ul class="pagination pagination-lg mtm mbm" id="setUl">
					{{#setList}}						
						{{#isZero}}
							<li onclick="workoutTypeLoad({{workoutSetNo}},{{workoutNo}},{{typeACount}},{{typeBTime}},{{spentCal}},{{intervalTime}})"><a> {{counter @index}} 세트<br>0/{{typeACount}}회</a></li>
						{{else}}
							<li onclick="workoutTypeLoad({{workoutSetNo}},{{workoutNo}},{{typeACount}},{{typeBTime}},{{spentCal}},{{intervalTime}})"><a> {{counter @index}} 세트<br>0/{{typeBTime}}초</a></li>
						{{/isZero}}
					{{/setList}}
					
				</ul>
            </div>
		<!-- 운동 내용 호출 -->
			<div id="typeContainer">
			</div>
			<div>
				<div class="buttons">
					<button id="setEndBtn" class='btn btn-primary' onclick="endWorkout()">운동 끝내기</button>
					<!-- <button id="viewChartBtn" class='btn btn-primary' >차트보기</button> --> 
				</div>
					<br>
					<br>
					<br>
			</div>

</script>

    <script src="${pageContext.request.contextPath}/web/js/workout/workout.js"></script>
</body>
</html>