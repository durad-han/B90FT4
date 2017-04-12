<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>B90FT4 | Main</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main/main.css">

<!-- 	네이버 로그인 임시 -->
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 	//네이버 로그인 임시 -->
  
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
	    <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only"> 토글 </span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
	    <a id="logo" href="/b90ft4/main/main.do" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">B90FT4</span><span style="display: none" class="logo-text-icon">µ</span></a>
	        </div>
	        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
              <ul class="nav navbar-nav">
              <li><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a></li>
<!-- 메뉴 옵션들 ==================================================================================================== -->
                  <li class="active"><a href="/b90ft4/main/main.do">메인</a></li>
                  <li class="dropdown"><a href="/b90ft4/schedule/scheduleList.do" data-toggle="dropdown" class="dropdown-toggle">스케줄<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                      	  <li><a href="/b90ft4/schedule/scheduleList.do">스케줄 리스트</a></li>
                          <li><a href="/b90ft4/schedule/scheduleCalendar.do">스케줄 캘린더</a></li>
                          <li><a href="/b90ft4/schedule/scheduleGraph.do">스케줄 그래프</a></li>
                          <li class="divider"></li>
                          <li><a href="#">임시메뉴</a></li>
                      </ul>
                  </li>
                  <li><a href="/b90ft4/diary/list.do">다이어리</a></li>
                  <li><a href="/b90ft4/accountBook/main.do">가계부</a></li>
                  <li><a href="/b90ft4/workout/workout.do">운동</a></li>
<!-- 미사용 드롭다운 샘플 ==================================================================================================== -->
                  <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">드롭다운<b class="caret"></b></a>
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
              <ul class="nav navbar-nav navbar-right">
                  <li><a href="#callModal">Login</a></li>
<!-- 미사용 드롭다운 샘플2 ==================================================================================================== -->
                  <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Dropdown<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                          <li><a href="#">Action</a></li>
                          <li><a href="#">Another action</a></li>
                          <li><a href="#">Something else here</a></li>
                          <li class="divider"></li>
                          <li><a href="#">Separated link</a></li>
                      </ul>
                  </li>
              </ul>
    </div>     
	</nav>
</div>
<!-- 상단메뉴 종료 ==================================================================================================== -->

<!-- 전체 래퍼 시작 ==================================================================================================== -->
<div id="wrapper">

<!-- 서브메뉴 시작 ==================================================================================================== -->
    <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
        data-position="right" class="navbar-default navbar-static-side">
    <div class="sidebar-collapse menu-scroll">
        <ul id="side-menu" class="nav">
            <div class="clearfix"></div>
<!-- 사이드바 메뉴들 ==================================================================================================== -->
            <li><a href="#"><i class="fa fa-tachometer fa-fw">
                <div class="icon-bg bg-orange"></div>
            </i><span class="menu-title">기능</span></a></li>
            <li><a href="http://127.0.0.1:9090/b90ft4/schedule/scheduleList.do"><i class="fa fa-desktop fa-fw">
                <div class="icon-bg bg-pink"></div>
            </i><span class="menu-title">Schedule</span></a>
            </li>
            <li><a href="http://127.0.0.1:9090/b90ft4/diary/list.do"><i class="fa fa-send-o fa-fw">
                <div class="icon-bg bg-green"></div>
            </i><span class="menu-title">Diary</span></a>
            </li>
            <li><a href="http://127.0.0.1:9090/b90ft4/accountBook/main.do"><i class="fa fa-edit fa-fw">
                <div class="icon-bg bg-violet"></div>
            </i><span class="menu-title">Account Book</span></a>
            </li>
            <li><a href="http://127.0.0.1:9090/b90ft4/workout/workout.do"><i class="fa fa-th-list fa-fw">
                <div class="icon-bg bg-blue"></div>
            </i><span class="menu-title">Workout</span></a>
            </li>
            <li><a href="http://127.0.0.1:9090/b90ft4/main/options.do"><i class="fa fa-file-o fa-fw">
                <div class="icon-bg bg-yellow"></div>
            </i><span class="menu-title">Options</span></a>
            </li>
<!-- 미사용 사이드바 메뉴들 ==================================================================================================== -->
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
             Main Menu</div>
     </div>
     <ol class="breadcrumb page-breadcrumb pull-right">
         <li><i class="fa fa-home"></i>&nbsp;<a href="../main/main.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="hidden"><a href="#">Main Menu</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="active">Main Menu</li>
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
		<div class="col-md-12">
			<div id="area-chart-spline" style="width: 50%; height: 300px; display: none;">
			</div>
		</div>
	</div>

	<div class="col-lg-12">
<!-- 페이지 컨텐츠 시작 ==================================================================================================== -->
<div class="page-content">
	<div class="row">
		<div class="modal" id="callModal">
		<div id="loginMenu">
			 <div id="naver_id_login"> <a href="#close">닫기</a></div>
		</div>
		</div>
		<div id="menuList">
			
			<div id="menu01" class="menuIcon">Schedule</div>
			<div id="menu02" class="menuIcon">Diary</div>
			<div id="menu03" class="menuIcon">Account Book</div>
			<div id="menu04" class="menuIcon">Workout</div>
			<div id="menu05" class="menuIcon">Login (임시) </div>
			<div id="menu06" class="menuIcon">Options</div>
			
		</div>
	
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
<jsp:include page="/WEB-INF/jsp/common/frameInclude.jsp"/>
<script src="${pageContext.request.contextPath}/web/js/main/main.js"></script>

<script type="text/javascript">
	var naver_id_login = new naver_id_login("q_ZhPmwu3AMenQdKmDGj", "http://127.0.0.1:9090/b90ft4/login/login.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain("http://127.0.0.1:9090/b90ft4/main/main.do");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
</body>
</html>
