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

<style>
.custom-tooltip {
    display: inline-block;
    margin: 10px 20px;
    opacity: 1;
    position: relative;
}

.custom-tooltip .tooltip-inner {
	background: #0088cc;
}

.custom-tooltip.top .tooltip-arrow {
	border-top-color: #0088cc;
}

#maincontent{
	background-image: url(../web/image/Cover.jpg);
	background-size: cover;
	margin-top: 80px;
}

#cover{
	background-color: white;
	margin: 35px 48px 15px 41px;
	padding-bottom: 50px;
}
</style>

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
<!--                 	<div class="col-md-1"></div> -->
<!--                 	<div class="col-md-5"> -->
<!--                     <div class="intro-text" id="cover"> -->
<!--                         <h1 class="name">자기 관리를<br>시작해보세요!</h1> -->
<!--                         <hr class="star-light"> -->
<!--                         <span class="skills"> 『 적은 밖에 있는것이 아니라 내 안에 있다.<br> -->
<!--                         						나를 극복하는 순간, 나는 황제가 된다. 』<br> - 칭키스칸 </span> -->
<!--                     </div> -->
<!--                 	</div> -->
                	<div class="col-md-7">
                	
                    <div class="intro-text" id="cover">
                        <h1 class="name">자기 관리를<br>시작해보세요!</h1>
                        <hr class="star-light">
                        <span class="skills"> 『 적은 밖에 있는것이 아니라 내 안에 있다.<br>
                        						나를 극복하는 순간, 나는 황제가 된다. 』<br> - 칭키스칸 </span>
                	</div>
                	</div>
                	<div class="col-md-5"></div>
                </div>
            </div>
        </div>
    </header>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" style="display: none;">
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
                                <i class="fa fa-krw fa-5x"></i>
                            </div>
                        </div>
                        <!-- 돋보기 배경 끝 -->
                        
                        <img src="${pageContext.request.contextPath}/web/image/corgi/royal-corgi.jpg" class="img-responsive" alt="Cabin">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item tooltip-show" data-html="true" data-toggle = "tooltip" title = "<h3>운동</h3>" >
                    <a href="${pageContext.request.contextPath}/workout/workout.do" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-child fa-5x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/image/corgi/Corgi-workout-icon-01.jpg" class="img-responsive" alt="Slice of cake">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item tooltip-show" data-html="true" data-toggle = "tooltip" title = "<h3>스케쥴</h3>" >
                    <a href="${pageContext.request.contextPath}/schedule/scheduleList.do" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-calendar fa-5x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/image/corgi/Booksprites_9.png" class="img-responsive" alt="schedule">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item tooltip-show"  data-html="true" data-toggle = "tooltip" title = "<h3>다이어리</h3>" >
                    <a href="${pageContext.request.contextPath}/diary/list.do" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-book fa-5x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/image/main/diary.jpg" class="img-responsive" alt="Safe">
                    </a>
                </div>
                
            </div>
            
        </div>
        
    </section>
    
    <script>
    (function hideMain(){
    	console.log("hideMain()")
    	if('${user}')
    	$("#portfolio").css("display","none");
    });
    
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
