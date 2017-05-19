<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Cog + I</title>
<!-- chat css -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/chat/chat.css">
    
<c:import url ="/WEB-INF/jsp/common/topInclude.jsp"/>
</head>

<body id="page-top" class="index">

<div class="container">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>

    <!-- Header -->
    <header>
        <div class="container" id="maincontent" tabindex="-1">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/web/image/corgi/Corgi-web-icon-CenterIcon.png" alt="">
                    <div class="intro-text">
                        <h1 class="name">자기 관리를 시작해보세요!</h1>
                        <hr class="star-light">
                        <span class="skills"> 『 적은 밖에 있는것이 아니라 내 안에 있다.
                        나를 극복하는 순간, 나는 황제가 된다. 』 - 칭키스칸 </span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
        
            <div class="row">
            
                <div class="col-lg-12 text-center">
                    <h2>관리 마법사</h2>
                    <hr class="star-primary">
                </div>
            </div>
            
            <div id="spec" class="row">
                <div class="col-sm-6 portfolio-item tooltip-show"  data-html="true" data-toggle = "tooltip"  title = "<h3>가계부</h3>" >
                    <a href="${pageContext.request.contextPath}/accountBook/budget.do" class="portfolio-link">
                    
                    	<!-- 돋보기 배경 -->
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <!-- 돋보기 배경 끝 -->
                        
                        <img src="${pageContext.request.contextPath}/web/image/main/account1.JPG" class="img-responsive" alt="Cabin">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item tooltip-show" data-html="true" data-toggle = "tooltip" title = "<h3>운동</h3>" >
                    <a href="${pageContext.request.contextPath}/workout/workout.do" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/image/corgi/Corgi-workout-icon-01.jpg" class="img-responsive" alt="Slice of cake">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item tooltip-show" data-html="true" data-toggle = "tooltip" title = "<h3>스케쥴</h3>" >
                    <a href="${pageContext.request.contextPath}/schedule/scheduleList.do" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/image/corgi/Corgi-schedule-icon-01.gif" class="img-responsive" alt="Game controller">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item tooltip-show"  data-html="true" data-toggle = "tooltip" title = "<h3>다이어리</h3>" >
                    <a href="${pageContext.request.contextPath}/diary/list.do" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/image/main/diary.jpg" class="img-responsive" alt="Safe">
                    </a>
                </div>
                
            </div>
            
        </div>
        
    </section>
    <script>
//             	  $(function () { $('.tooltip-show').tooltip('show');});
            	  
            	  $(function() {
            		  $('.tooltip-show').each(function() {
	            		  $(this).tooltip("toggle");
	            	  });
            	  });
            	  
            	  
      </script>
    

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
</div>

<c:import url ="/WEB-INF/jsp/common/bottomInclude.jsp"/>
</body>

</html>
