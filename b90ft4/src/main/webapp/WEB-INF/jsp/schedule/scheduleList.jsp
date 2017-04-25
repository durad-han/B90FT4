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
                  <li><a href="../main/news.do">뉴스</a></li>
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
             Schedule List</div>
     </div>
     <ol class="breadcrumb page-breadcrumb pull-right">
         <li><i class="fa fa-home"></i>&nbsp;<a href="../main/main.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="hidden"><a href="#">Schedule List</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="active">Schedule List</li>
     </ol>
     <div class="clearfix">
     </div>
</div>
<!-- 타이틀 영역 종료 ==================================================================================================== -->

<!-- 메인 컨텐츠 시작 ==================================================================================================== -->
<div class="page-content">
	<div id="tab-general">
	<div class="row mbl">
	
	<div class="col-lg-12">
<!-- 페이지 컨텐츠 시작 ==================================================================================================== -->
<div class="page-content">
	<div class="row">
	
<!-- 바디 판넬 시작 ==================================================================================================== -->
	<div class="col-lg-4">
		<div class="panel">
		<div class="panel-body">
			<div class="side-timeline">
			<div id="grid-layout-table-1" class="box jplist">
			
<!-- 스케줄 타임라인 시작 ==================================================================================================== -->
<div class="side-scroll">
<section id="cd-timeline" class="timeline-container">

<c:forEach var="schedules" items='${scheduleMap["scheduleList"]}'>
		<div class="cd-timeline-block">
			<div class="cd-timeline-img cd-picture">
				<i class="fa fa-edit fa-fw">
	            </i>
<!-- 				<img src="/webapp/web/css/schedule/img/cd-icon-picture.svg" alt="Picture"> -->
			</div> <!-- cd-timeline-img -->

			<div class="cd-timeline-content">
				<h2><a href="javascript:goDetail(${schedules.scheduleNo});"><c:out value='${schedules.title }'/></a></h2>
				<p><a href="javascript:goDetail(${schedules.scheduleNo});"><c:out value='${schedules.content }'/></a></p>
				<a href="javascript:goDetail(${schedules.scheduleNo});" class="cd-read-more">상세</a>
				<span class="cd-date"><c:out value='${schedules.start}'/></span>
			</div> <!-- cd-timeline-content -->
		</div> <!-- cd-timeline-block -->
</c:forEach>
<c:if test='${empty scheduleMap["scheduleList"]}'>
<div class="cd-timeline-block">
			<div class="cd-timeline-img cd-picture">
				<i class="fa fa-edit fa-fw">
	            </i>
<!-- 				<img src="/webapp/web/css/schedule/img/cd-icon-picture.svg" alt="Picture"> -->
			</div> <!-- cd-timeline-img -->
			<div class="cd-timeline-content">
				<h2><a href="#;">스케줄이 존재하지 않습니다</a></h2>
				<p><a href="#;">스케줄을 등록하세요</a></p>
				<a href="#;" class="cd-read-more">상제</a>
				<span class="cd-date"></span>
			</div> <!-- cd-timeline-content -->
		</div> <!-- cd-timeline-block -->
</c:if>

<div class="list" id="9">content</div>  
<div id="loading"></div>

</section>
</div>
<!-- 스케줄 타임라인 종료 ==================================================================================================== -->
				
        	</div>
			</div>
		</div>
		</div>
	</div>
<!-- 바디 판넬 종료 ==================================================================================================== -->

<!-- 디테일 페이지 시작 ==================================================================================================== -->
	<div class="col-lg-8">
		<div class="panel">
		<div class="panel-body">
		
			<!-- 이전 스케줄 링크 -->
			<div class="alert alert-success" id="prev"><strong>이전 스케줄</strong> 스케줄 링크</div>
			
            <div class="panel panel-orange">
				<div class="panel-heading">
				    Schedule Detail</div>
				    
				<!-- 스케줄 상세 -->
				<div class="panel-body pan" id="schDetail">
				<div class="clz-insertSchedule">
				
				<!-- 스케줄 입력 폼 시작 -->
				<form name="insertSchedule" action="insertSchedule.do" onsubmit="return scheduleForm();" method="post">
				<div class="form-body pal">
				
				<div class="form-group">
				    <div class="input-icon right">
				        <i class="fa fa-user"></i>
				        <input id="inputTitle" name="title" type="text" placeholder="제목" class="form-control" />
				    </div>
				</div>
				
				<div class="row">
				    <div class="col-md-6">
				        <div class="form-group">
				            <input id="inputStart" name="start" type="text" placeholder="시작 시간" value="" />
				        </div>
				    </div>
				    <div class="col-md-6">
				        <div class="form-group">
				            <input id="inputEnd" name="end" type="text" placeholder="종료 시간" value="" />
				        </div>
				    </div>
				</div>
				
				<div class="form-group">
				    <div class="input-icon right">
				        <i class="fa fa-user"></i>
				        <input id="inputContent" name="content" type="text" placeholder="내용" class="form-control" />
				    </div>
				</div>
				
<!-- ============ 임시 하드코딩 ============	-->
				<div class="form-group">
				    <div class="input-icon right">
				        <i class="fa fa-user"></i>
				        <input id="inputCategory" name="category" type="text" placeholder="카테고리" value="1" class="form-control" />
				    </div>
				</div>
				<div class="form-group">
				        <input id="inputUserId" name="userId" type="hidden" value="tester01" class="form-control" />
				        <input id="inputImportance" name="importance" type="hidden" value="0" class="form-control" />
				        <input id="inputScheduleNo" name="scheduleNo" type="hidden" value="1" class="form-control" />
				        <input id="inputAchieve" name="achieve" type="hidden" value="1" class="form-control" />
				</div>
<!-- ============ 임시 하드코딩============	-->
				<div class="form-group text-center">
			    	<div class="stars"></div>
				    <div class="stars-msg"></div>
				</div>
				    
				<div class="form-actions text-center pal">
					<button class="btn btn-success">추가</button>
				</div>
				</div>
				</form>
				</div>
				</div>
			</div>

			<!-- 다음 스케줄 링크 -->
			<div class="alert alert-success" id="next"><strong>다음 스케줄</strong> 다음 스케줄 링크</div>
 
		</div>
		</div>
	</div>
<!-- 디테일 페이지 종료 ==================================================================================================== -->
	
	</div>
</div>
<!-- 페이지 컨텐츠 종료 ==================================================================================================== -->
	</div>
	</div>
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
<c:import url ="/WEB-INF/jsp/schedule/scheduleInclude.jsp"/>

<script>
if ('${msg}') {
	swal("스케줄 입력", '${msg}', "success");
}
</script>
</body>
</html>
