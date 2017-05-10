<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>다이어리</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <link rel="apple-touch-icon" href="images/icons/favicon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/jquery-ui-1.10.4.custom.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/animate.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/all.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/main.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/style-responsive.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/zabuto_calendar.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/pace.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/detail.css">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
                  <li><a href="../main/main.do">메인</a></li>
                  <li><a href="../schedule/scheduleList.do">스케줄</a></li>
                  <li class="active"><a href="../diary/list.do">다이어리</a></li>
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

        <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
             <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
            <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                data-position="right" class="navbar-default navbar-static-side">
            <div class="sidebar-collapse menu-scroll">
                <ul id="side-menu" class="nav">
                    
                     <div class="clearfix"></div>
                    <li class="active"><a href="../main/main.do"><i class="fa fa-fw">
                        <div class="icon-bg bg-orange"></div>
                    </i><span class="menu-title">전체</span></a></li>
                    <li><a href="Layout.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-pink"></div>
                    </i><span class="menu-title">일기</span></a>
                       
                    </li>
                   
                </ul>
            </div>
        </nav>
            <div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            다이어리</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="http://14.32.66.123:9092/b90ft4/main/main.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">다이어리</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">다이어리</li>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                <!--BEGIN CONTENT-->
						<div class="page-content" style="min-height: 800px !important;">
					
						<table id="tb-content" style="width:70% !important; min-height: 700px !important;margin-left: 10% !important;">
								
								<tr>
								
									<td colspan="3" style="text-align:center !important; max-height: 120px">
										 <c:choose>
											
												<c:when test="${diaryVO.emotionCode eq 1}">
													<img src="${pageContext.request.contextPath}/web/image/diary/emotion/superhappy.jpg" />
												</c:when>
												
												<c:when test="${diaryVO.emotionCode eq 2}">
													<img src="${pageContext.request.contextPath}/web/image/diary/emotion/happy.jpg" />
												</c:when>
												
												<c:when test="${diaryVO.emotionCode eq 3}">
													<img src="${pageContext.request.contextPath}/web/image/diary/emotion/enjoy.jpg" />
												</c:when>
												
												<c:when test="${diaryVO.emotionCode eq 4}">
													<img src="${pageContext.request.contextPath}/web/image/diary/emotion/sad.jpg" />
												</c:when>
												
												<c:when test="${diaryVO.emotionCode eq 5}">
													<img src="${pageContext.request.contextPath}/web/image/diary/emotion/angry.jpg" />
												</c:when>
												
												<c:when test="${diaryVO.emotionCode eq 6}">
													<img src="${pageContext.request.contextPath}/web/image/diary/emotion/despair.jpg" />
												</c:when>
												
												<c:when test="${diaryVO.emotionCode eq 7}">
													<img src="${pageContext.request.contextPath}/web/image/diary/emotion/sulk.jpg" />
												</c:when>
											
											</c:choose>
											
											 
								 			
								 		</td>
								
								</tr>
								<tr>
								
										  <td style="text-align:center !important; min-height: 800px !important;">
										  <span style="font-size: 80px; !important;margin-right: 600px !important;">
										  	<b><c:out value="${diaryVO.title}"/></b>
										  </span>
								</tr>
								
								<tr>
									<td style="text-align:right !important;">
									 		<fmt:formatDate value="${diaryVO.diaryDate}" pattern="yyyy-MM-dd hh:mm:ss" />
									</td>
									<td style="text-align:right !important;">
								  	<c:choose>
										<c:when test="${diaryVO.weatherCode eq 1}">
											<img src="${pageContext.request.contextPath}/web/image/diary/weather/weather1.jpg" />
										</c:when>
										
										<c:when test="${diaryVO.weatherCode eq 2}">
											<img src="${pageContext.request.contextPath}/web/image/diary/weather/cloud.jpg" />
										</c:when>
										
										<c:when test="${diaryVO.weatherCode eq 3}">
											<img src="${pageContext.request.contextPath}/web/image/diary/weather/rain.jpg" />
										</c:when>
										
										<c:when test="${diaryVO.weatherCode eq 4}">
											<img src="${pageContext.request.contextPath}/web/image/diary/weather/snow.jpg" />
										</c:when>
										
										<c:when test="${diaryVO.weatherCode eq 5}">
											<img src="${pageContext.request.contextPath}/web/image/diary/weather/hail.jpg" />
										</c:when>
									</c:choose>	
							 		</td>
								</tr>
		                                
								<tr>
								 	<td class="content" colspan="3">${diaryVO.content}</td>
								</tr>
								
						</table>
						
						<div class="row">
						    <div class="col-md-9"></div>
						    <div class="col-md-3">
						    <a href='updateForm.do?diaryNo=<c:out value="${diaryVO.diaryNo}"/>' class="btn btn-success btn-lg">수정</a>
								<a href='delete.do?no=${diaryVO.diaryNo}' class="btn btn-danger btn-lg" id="deleteDiary">삭제</a>
								<a href='list.do' class="btn btn-info btn-lg">목록</a>
						    </div>
						</div>
						<hr>
                <!--END CONTENT-->
                <!--BEGIN FOOTER-->
                <!--END FOOTER-->
            </div>
            <!--END PAGE WRAPPER-->
        </div>
    </div>
    </div>
    </div>
    <script>
    
    	$("#deleteDiary").click(function(e) {
    		console.log("삭제");
//     		console.log($("tr.content > td").html());
    		
    		$("tr.content > td").find("img").each(function() {
    			
    			var src = this.src;
    			var ix = src.indexOf("/b90ft4");
    			src = src.substring(ix);

				console.log("src",src);
				
				$.ajax({
					url:"delImg.do",
					data: {
						delPath:src
					},
					async:false
				}).done(function(result) {
					console.log(result);
				});
    			
    		});
    		
    	});
    </script>
    
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-1.10.2.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-migrate-1.2.1.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-ui.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/bootstrap.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/bootstrap-hover-dropdown.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/html5shiv.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/respond.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.metisMenu.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.slimscroll.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.cookie.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/icheck.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/custom.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.news-ticker.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.menu.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/pace.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/holder.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/responsive-tabs.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.categories.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.tooltip.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.fillbetween.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.stack.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.spline.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/zabuto_calendar.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/index.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/data.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/drilldown.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/exporting.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts-more.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-pie.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-more.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/modernizr.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jplist.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jplist.js"></script> --%>

    <!--CORE JAVASCRIPT-->
   


</body>
</html>