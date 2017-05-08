<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    <title>자기관리 : 개인정보</title>
    <!-- Bootstrap Core CSS -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css">

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
</head>

<body id="page-top" class="index">

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
                <a class="navbar-brand" href="../main/main.do">자기 관리</a>
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
                    
                   <li class = "dropdown">
					      <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#schedule">
					          스케줄 <span class = "caret"></span>
					      </a>
					      <ul class = "dropdown-menu">
					         <li><a href = "#">리스트</a></li>
					         <li><a href = "#">달력</a></li>
					      </ul>
				   </li>
                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" >
        <div class="container">
        <br><br><br><br><br><br><br><br>
		<div class="row">
		
			<div class="col-lg-12">
        		<ul id="generalTab" class="nav nav-tabs responsive" style="width: 80%;">
                    <li id="infoTab" class="active"><a href="#info-tab" data-toggle="tab">기본정보</a></li>
                    <li id="bodyTab"><a href="#body-tab" data-toggle="tab">신체정보</a></li>
                    <li id="logTab"><a href="#log-tab" data-toggle="tab">사용기록</a></li>
                </ul>
			</div>
			
		<div class="row">
			<div class="col-lg-12">
			<div id="generalTabContent" class="tab-content responsive">
            	<div id="info-tab" class="tab-pane fade in active" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green">
             		<div class="panel-heading">기본정보</div>
                	<div class="panel-body">
                	
							<form name="insertSchedule" action="insertSchedule.do" onsubmit="return scheduleForm();" method="post">
							<div class="form-body pal">
									
									<div class="form-group">
									        <input id="null" name="null" type="text" placeholder="기본값" class="form-control" />
									</div>
									
									<div class="form-group">
									        <input id="null" name="null" type="text" placeholder="기본값2" class="form-control" />
									</div>
									    
									<div class="form-actions text-center pal">
										<button class="btn btn-warning">수정</button>
									</div>
							</div>
							</form>
                	</div>
                </div>
               	</div>
               	
               	
            	<div id="body-tab" class="tab-pane fade" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green">
             		<div class="panel-heading">신체정보</div>
                	<div class="panel-body">
                	
							<form name="insertSchedule" action="insertSchedule.do" onsubmit="return scheduleForm();" method="post">
							<div class="form-body pal">
									
									<div class="form-group">
								        <input id="null" name="null" type="text" placeholder="머리" class="form-control" />
								        <input id="null" name="null" type="text" placeholder="어깨" class="form-control" />
								        <input id="null" name="null" type="text" placeholder="무릎" class="form-control" />
								        <input id="null" name="null" type="text" placeholder="발" class="form-control" />
									</div>
									    
									<div class="form-actions text-center pal">
										<button class="btn btn-warning">수정</button>
									</div>
							</div>
							</form>
                	</div>
                </div>
               	</div>
               	
               	
            	<div id="log-tab" class="tab-pane fade" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green">
             		<div class="panel-heading">사용기록</div>
                	<div class="panel-body">
                	
							<div class="form-body pal">
									
									<div class="form-group">
									        <input id="null" name="null" type="text" placeholder="뭘 보여줄까" class="form-control" />
									</div>
									    
							</div>
                	</div>
                </div>
               	</div>
               	
               	
            </div>
           	</div>
        </div>
			
		</div>
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
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/contact_me.js"></script> --%>

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/freelancer.min.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>
	
    <!-- 차트 js -->
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
	<c:import url ="/WEB-INF/jsp/schedule/scheduleInclude2.jsp"/>
</div>

</body>

</html>
