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
<style>

.shape{    
	border-style: solid; border-width: 0 70px 40px 0; float:right; height: 0px; width: 0px;
	-ms-transform:rotate(360deg); /* IE 9 */
	-o-transform: rotate(360deg);  /* Opera 10.5 */
	-webkit-transform:rotate(360deg); /* Safari and Chrome */
	transform:rotate(360deg);
}
.offer{
	background:#fff; border:1px solid #ddd; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); margin: 15px 0; overflow:hidden;
}
/* .offer:hover { */
/*     -webkit-transform: scale(1.1);  */
/*     -moz-transform: scale(1.1);  */
/*     -ms-transform: scale(1.1);  */
/*     -o-transform: scale(1.1);  */
/*     transform:rotate scale(1.1);  */
/*     -webkit-transition: all 0.4s ease-in-out;  */
/* -moz-transition: all 0.4s ease-in-out;  */
/* -o-transition: all 0.4s ease-in-out; */
/* transition: all 0.4s ease-in-out; */
/*     } */
    
.shape {
	border-color: rgba(255,255,255,0) #d9534f rgba(255,255,255,0) rgba(255,255,255,0);
}
.offer-radius{
	border-radius:7px;
}
.offer-danger {	border-color: #d9534f; }
.offer-danger .shape{
	border-color: transparent #d9534f transparent transparent;
}
.offer-success {	border-color: #5cb85c; }
.offer-success .shape{
	border-color: transparent #5cb85c transparent transparent;
}
.offer-default {	border-color: #999999; }
.offer-default .shape{
	border-color: transparent #999999 transparent transparent;
}
.offer-primary {	border-color: #428bca; }
.offer-primary .shape{
	border-color: transparent #428bca transparent transparent;
}
.offer-info {	border-color: #5bc0de; }
.offer-info .shape{
	border-color: transparent #5bc0de transparent transparent;
}
.offer-warning {	border-color: #f0ad4e; }
.offer-warning .shape{
	border-color: transparent #f0ad4e transparent transparent;
}

.shape-text{
	color:#fff; font-size:12px; font-weight:bold; position:relative; right:-40px; top:2px; white-space: nowrap;
	-ms-transform:rotate(30deg); /* IE 9 */
	-o-transform: rotate(360deg);  /* Opera 10.5 */
	-webkit-transform:rotate(30deg); /* Safari and Chrome */
	transform:rotate(30deg);
}	
.offer-content{
	padding:0 20px 10px;
}
@media (min-width: 487px) {
  .container {
    max-width: 750px;
  }
  .col-sm-6 {
    width: 50%;
  }
}
@media (min-width: 900px) {
  .container {
    max-width: 970px;
  }
  .col-md-4 {
    width: 33.33333333333333%;
  }
}

@media (min-width: 1200px) {
  .container {
    max-width: 1170px;
  }
  .col-lg-3 {
    width: 25%;
  }
  }
}

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
		<div class="col-md-12">
			<div class="offer offer-success" style="width: 100% !important;">
				<div class="shape">
					<div class="shape-text">
														
					</div>
				</div>
				
				
					<div class="offer-content">
				
						  <h2 style="margin-top: 20px;"> <c:out value="${diaryVO.title}"/> </b>  </h2>
						  <hr>
						
						<h3 class="lead">
						 	   <fmt:formatDate value="${diaryVO.diaryDate}" pattern="yyyy-MM-dd" />
						   
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
						 
						  
						  	  <c:choose>
									<c:when test="${diaryVO.emotionCode eq 1}">
										<img src="${pageContext.request.contextPath}/web/image/diary/emotion/superhappy.jpg" width="90px" height="50px"		/>
									</c:when>                                                                               
									                                                                                        
									<c:when test="${diaryVO.emotionCode eq 2}">                                             
										<img src="${pageContext.request.contextPath}/web/image/diary/emotion/happy.jpg" 	width="90px" height="50px"	/>
									</c:when>                                                                                
									                                                                                         
									<c:when test="${diaryVO.emotionCode eq 3}">                                              
										<img src="${pageContext.request.contextPath}/web/image/diary/emotion/enjoy.jpg" 	width="90px" height="50px"	/>
									</c:when>                                                                                
									                                                                                         
									<c:when test="${diaryVO.emotionCode eq 4}">                                              
										<img src="${pageContext.request.contextPath}/web/image/diary/emotion/sad.jpg" 		width="90px" height="50px"	/>
									</c:when>                                                                               
									                                                                                        
									<c:when test="${diaryVO.emotionCode eq 5}">                                             
										<img src="${pageContext.request.contextPath}/web/image/diary/emotion/angry.jpg"		width="90px" height="50px" />
									</c:when>                                                                              
									                                                                                       
									<c:when test="${diaryVO.emotionCode eq 6}">                                          
										<img src="${pageContext.request.contextPath}/web/image/diary/emotion/despair.jpg"	width="90px" height="50px"	 />
									</c:when>                                                                                
									                                                                                         
									<c:when test="${diaryVO.emotionCode eq 7}">                                              
										<img src="${pageContext.request.contextPath}/web/image/diary/emotion/sulk.jpg"		width="90px" height="50px" />
									</c:when>                                                                                
							 </c:choose> 
							 
						  
						  
						</h3>		
						
						<hr>
									
						<p>
							${diaryVO.content}
						</p>
					
				</div>
			</div>
		</div>
		
		<div class="row">
		
		    <div class="col-md-9"></div>
		    <div class="col-md-3">
		  	    <a href='updateForm.do?diaryNo=<c:out value="${diaryVO.diaryNo}"/>' class="btn btn-success btn-lg">수정</a>
				<a href='delete.do?no=${diaryVO.diaryNo}' class="btn btn-danger btn-lg" id="deleteDiary">삭제</a>
				<a href='list.do' class="btn btn-info btn-lg">목록</a>
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
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/freelancer.min.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>
	
    <!-- 차트 js -->
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
	
	
</div>
</body>

</html>
