<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>B90FT4 | 카테고리명</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/jquery-ui-1.10.4.custom.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/font-awesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/animate.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/all.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/main.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/style-responsive.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/pace.css"/>
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">

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
                  <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">드롭다운 샘플<b class="caret"></b></a>
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
            <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                data-position="right" class="navbar-default navbar-static-side">
            <div class="sidebar-collapse menu-scroll">
                <ul id="side-menu" class="nav">
                    
                     <div class="clearfix"></div>
                    <li class="active"><a href="../main/main.do"><i class="fa fa-fw">
                        <div class="icon-bg bg-orange"></div>
                    </i><span class="menu-title">기능</span></a></li>
                    <li><a href="Layout.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-pink"></div>
                    </i><span class="menu-title">기능</span></a>
                       
                    </li>
                    <li><a href="UIElements.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-green"></div>
                    </i><span class="menu-title">기능</span></a>
                       
                    </li>
                    <li><a href="Forms.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-violet"></div>
                    </i><span class="menu-title">기능</span></a>
                      
                    </li>
                    <li><a href="Tables.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-blue"></div>
                    </i><span class="menu-title">기능</span></a>
                          
                    </li>
                    <li><a href="DataGrid.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-red"></div>
                    </i><span class="menu-title">기능</span></a>
                      
                    </li>
                    <li><a href="Pages.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-yellow"></div>
                    </i><span class="menu-title">기능</span></a>
                       
                    </li>
                    <li><a href="Extras.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-grey"></div>
                    </i><span class="menu-title">기능</span></a>
                      
                    </li>
                   
                </ul>
            </div>
        </nav>
            <!--END SIDEBAR MENU-->

            <!--BEGIN CHAT FORM-->

            <!--END CHAT FORM-->
            <!--BEGIN PAGE WRAPPER-->
            <div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            	카테고리 종류</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="http://14.32.66.123:9092/b90ft4/main/main.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">카테고리 종류</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">카테고리 종류</li>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                <!--BEGIN CONTENT-->
                <div>
				******************************
				<br>여기에 내용입력 <br>           
				******************************               
                
                
                </div>
                <!--END CONTENT-->
                <!--BEGIN FOOTER-->
                <div id="footer">
                    <div class="copyright"><a>B90FT4 Footer</a></div>
                </div>
                <!--END FOOTER-->
            </div>
            <!--END PAGE WRAPPER-->
        </div>
    </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/KAdmin-Dark/script/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//bootstrap-hover-dropdown.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//respond.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/custom.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.menu.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/pace.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/holder.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/responsive-tabs.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.categories.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.tooltip.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.fillbetween.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.stack.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.spline.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/zabuto_calendar.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/index.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/main.js"></script>
<!-- 
<script>
		(function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-145464-12', 'auto');
        ga('send', 'pageview');


</script>
 -->
<script src="${pageContext.request.contextPath}/web/js/workout/workout.js"></script>

</body>
</html>