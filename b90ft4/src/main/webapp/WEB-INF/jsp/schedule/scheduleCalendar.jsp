<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>B90FT4 | Schedule</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- try google cal -->
<!-- <script type="text/javascript"> -->
<!--  	var googleCalendarId="bi6gttp37c8sjfj693cm8l6c1k@group.calendar.google.com"; -->
<!--  	var googleCalendarApiKey="bad613f17e871e7094213d9e34b464d86a2e8229"; -->
<!--  	var maxGcalEvents = 5; -->
<!--  	//optional parameters----------------------------------------------- -->
<!--  	//var colorBox=["green","red"];	 -->
<!-- </script> -->
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
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
	    <a id="logo" href="../main/main.do" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">B90FT4</span><span style="display: none" class="logo-text-icon">µ</span></a>
	        </div>
	        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
<!-- 메뉴 옵션들 ==================================================================================================== -->
              <ul class="nav navbar-nav">
              <li><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a></li>
                  <li class="active"><a href="../main/main.do">메인</a></li>
                  <li class="dropdown"><a href="../schedule/scheduleList.do" data-toggle="dropdown" class="dropdown-toggle">스케줄<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                      	  <li><a href="../schedule/scheduleList.do">스케줄 리스트</a></li>
                          <li><a href="../schedule/scheduleCalendar.do">스케줄 캘린더</a></li>
                          <li><a href="../schedule/scheduleGraph.do">스케줄 그래프</a></li>
                          <li class="divider"></li>
                          <li><a href="#">임시메뉴</a></li>
                      </ul>
                  </li>
                  <li><a href="../diary/list.do">다이어리</a></li>
                  <li><a href="../accountBook/budget.do">가계부</a></li>
                  <li><a href="../workout/workout.do">운동</a></li>
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

<!-- 전체 래퍼 시작 ==================================================================================================== -->
<div id="wrapper">

<!-- 서브메뉴 시작 ==================================================================================================== -->
    <nav id="sidebar" role="navigation" class="navbar-default navbar-static-side">
    <div class="sidebar-collapse menu-scroll">
        <ul id="side-menu" class="nav">
            <div class="clearfix"></div>
<!-- 사이드바 메뉴들 ==================================================================================================== -->
            <li><a href="#"><i class="fa fa-tachometer fa-fw">
                <div class="icon-bg bg-orange"></div>
            </i><span class="menu-title">기능</span></a></li>
            <li><a href="#"><i class="fa fa-desktop fa-fw">
                <div class="icon-bg bg-pink"></div>
            </i><span class="menu-title">Schedule : </span></a>
            </li>
            <li><a href="scheduleList.do"><i class="fa fa-send-o fa-fw">
                <div class="icon-bg bg-green"></div>
            </i><span class="menu-title">Schedule List</span></a>
            </li>
            <li><a href="scheduleCalendar.do"><i class="fa fa-edit fa-fw">
                <div class="icon-bg bg-violet"></div>
            </i><span class="menu-title">Schedule Calendar</span></a>
            </li>
            <li><a href="scheduleGraph.do"><i class="fa fa-th-list fa-fw">
                <div class="icon-bg bg-blue"></div>
            </i><span class="menu-title">Schedule Graph</span></a>
            </li>
<!-- 미사용 사이드바 메뉴들 ==================================================================================================== -->
            <li><a href="#"><i class="fa fa-file-o fa-fw">
                <div class="icon-bg bg-yellow"></div>
            </i><span class="menu-title">Grids</span></a>
            </li>
            <li><a href="#"><i class="fa fa-gift fa-fw">
                <div class="icon-bg bg-grey"></div>
            </i><span class="menu-title">Grids</span></a>
            </li>
            <li><a href="#"><i class="fa fa-envelope-o">
                <div class="icon-bg bg-primary"></div>
            </i><span class="menu-title">Grids</span></a>
            </li>
            <li><a href="#"><i class="fa fa-bar-chart-o fa-fw">
                <div class="icon-bg bg-orange"></div>
            </i><span class="menu-title">Grids</span></a>
            </li>
        </ul>
    </div>
</nav>
<!-- 서브메뉴 종료 ==================================================================================================== -->
          
<!-- 주 화면 래퍼 ==================================================================================================== -->
<div id="page-wrapper">

<!-- 타이틀 영역 시작 ==================================================================================================== -->
 <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
     <div class="page-header pull-left">
         <div class="page-title">
             Schedule Calendar</div>
     </div>
     <ol class="breadcrumb page-breadcrumb pull-right">
         <li><i class="fa fa-home"></i>&nbsp;<a href="../main/main.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="hidden"><a href="#">Schedule Calendar</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="active">Schedule Calendar</li>
     </ol>
     <div class="clearfix">
     </div>
</div>
<!-- 타이틀 영역 종료 ==================================================================================================== -->

<!-- 메인 컨텐츠 시작 ==================================================================================================== -->
<div class="page-content">
	<div class="col-lg-12">
<!-- 페이지 컨텐츠 시작 ==================================================================================================== -->
<div class="page-content">
	<div class="row">
<!-- 달력 ==================================================================================================== -->
	<div class="col-md-12">
		<div class="panel">
		<div class="panel-body">
		
		<div id='calendar'></div>
			
		</div>
		</div>
	</div>
<!-- 달력 ==================================================================================================== -->
	</div>
</div>
<!-- 페이지 컨텐츠 종료 ==================================================================================================== -->
	</div>
</div>
<!-- 메인 컨텐츠 종료 ==================================================================================================== -->
                
<!-- 푸터 시작 ==================================================================================================== -->
<div id="footer">

</div>
<!-- 푸터 종료 ==================================================================================================== -->

</div>
<!-- 주 화면 래퍼 종료 ==================================================================================================== -->
</div>
<!-- 전체 래퍼 종료 ==================================================================================================== -->

</div>
<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
<c:import url ="/WEB-INF/jsp/schedule/calendarInclude.jsp"/>

<!-- try google cal -->
<%-- <script src="${pageContext.request.contextPath}/web/js/schedule/gcal-events.min.js"></script> --%>
<script>
if ('${msg}') {
	swal("스케줄 입력", '${msg}', "success");
}
</script>
</body>
</html>