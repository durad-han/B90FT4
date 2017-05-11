<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Freelancer - Start Bootstrap Theme</title>
    <!-- Bootstrap Core CSS -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css">

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/templatemo-misc.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/templatemo-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/list.css">
	
	
	<style>
	table td {
		color: black !important;
		font-weight: bold;
		font-size: 20px;
		border: 1px solid black;
	}

</style>
	
	
	</style>
</head>

<body id="page-top" class="index">

<%-- <div class="container" style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100%'> --%>
<div class="container">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
   
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="main.do">자기 관리</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                        
                    <!-- 서브메뉴 드랍다운 -->
                    <li class = "dropdown">
                    
					      <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">
					          가계부 <span class = "caret"></span>
					      </a>
					      
					      <ul class = "dropdown-menu">
					         <li><a href = "#">지출/수입</a></li>
					         <li><a href = "#">대입금/차입금</a></li>
					         <li><a href = "#">설정</a></li>
					      </ul>
					      
				   </li>
                        
                    <li class="page-scroll">
                        <a href="#about">다이어리</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">스케쥴러</a>
                    </li>
                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
               
                <div class="row">
                    <div class="section-header col-md-12">
                        <h2>Diary</h2>
                    </div> <!-- /.section-header -->
                </div> <!-- /.row -->	
				
			    <div class="row">
                	<div class="col-md-12">
	                    <div class="blog-masonry masonry-true">
			                <c:forEach var="diary" items="${list}" varStatus="loop"> 
				                        <div class="post-masonry col-md-4 col-sm-6">
				                            <div class="blog-thumb">
				                                <img src="${pageContext.request.contextPath}/web/image/diary/background2.jpg" alt="">
				                                <div class="overlay-b">
				                                    <div class="overlay-inner">
				                                        <a href="blog-single.html" class="fa fa-link"></a>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="blog-body">
				                                <div class="box-content">
				                                    <h3 class="post-title"><a href='detail.do?diaryNo=<c:out value="${diary.diaryNo}"/>'><c:out value="${diary.title}" /></a></h3>
				                                    <span class="blog-meta"><fmt:formatDate value="${diary.diaryDate}" pattern="yyyy-MM-dd hh:mm:ss" /></span>
				                                </div>
				                            </div>
				                        </div> <!-- /.post-masonry -->
			                </c:forEach>
                
	                    </div> <!-- /.blog-masonry -->
	                </div>
                 </div> <!-- /.row -->
                 
              <div class="row">
                    <div class="col-md-12">
                        	 
                        	 <div class="text-center">
		                            <ul class="pagination pagination-lg mtm mbm">
	  									<c:choose>
	  										<c:when test="${pageResult.prev}">
	                                   		 	<li class=""><a href="#">&laquo;</a></li>
	  										</c:when>
	  										<c:otherwise>
	                                   		 	<li class="disabled"><a href="#">&laquo;</a></li>
	  										</c:otherwise>	
	  									</c:choose>
	  									
			   								<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}" >
			   									
			   									<c:choose>
			   										<c:when test="${i eq pageResult.pageNo}">
				                            	    	<li class="active"><a href="list.do?pageNo=${i}">${i}</a></li>
			   										</c:when>
			   										<c:otherwise>
					                            	    <li><a href="list.do?pageNo=${i}">${i}</a></li>
			   										</c:otherwise>
			   									</c:choose>
			   								
			   								</c:forEach>
			   								
	                                    <c:choose>
	  										<c:when test="${pageResult.next}">
			                                    <li class=""><a href="#">&raquo;</a></li>
	  										</c:when>
	  										<c:otherwise>
			                                    <li class="disabled"><a href="#">&raquo;</a></li>
	  										</c:otherwise>	
	  									</c:choose>
	                                    
		                            </ul>
	                         </div>
	                         
                         <!-- write -->
                         <div align="right">
                         	<a href='${pageContext.request.contextPath}/diary/writeForm.do' class="btn btn-info" role="button">글쓰기</a>
                         </div>
                         <!-- /write -->
                         
                   </div> <!-- /.col-md-12 -->
                </div> <!-- /.row -->


		        	
        </div>
    </section>
    

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
    

    <!-- jQuery -->
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/jquery/jquery.min.js"></script> --%>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/freelancer.min.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>
	
    <!-- 차트 js -->
	
	<!-- diary.js -->
	
	<script>
	<script type="text/javascript">
	    //<![CDATA[
	    $(window).load(function() { // makes sure the whole site is loaded
	        $('.loader-item').fadeOut(); // will first fade out the loading animation
	            $('#pageloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
	        $('body').delay(350).css({'overflow-y':'visible'});
	    })
	    //]]>
	</script>
	
	</script>
    <script src="${pageContext.request.contextPath}/web/js/diary/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/web/js/diary/main.js"></script>
	    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/list.css">
        <!--
        Artcore Template
		http://www.templatemo.com/preview/templatemo_423_artcore
        -->
        <script src="${pageContext.request.contextPath}/web/js/diary/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
	
</div>
</body>

</html>
