<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

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
<%--     <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css"> --%>

    <!-- Theme CSS -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet"> --%>
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet"> --%>
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/news.css" rel="stylesheet"> --%>
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/memo.css" rel="stylesheet"> --%>
	
<!--     <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"> -->
<!--  	<script src="http://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

    <!-- Custom Fonts -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> --%>
<!--     <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"> -->
<!--     <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css"> -->
	<%@include file="/WEB-INF/jsp/common/topInclude.jsp"%>
	<style>
	
	#portfolio button{
		width: 100px;
		height: 50px;
		margin-right: 15px;
	}
	
	</style>
	
</head>

<body id="page-top" class="index">

<%-- <div class="container" style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100%'> --%>
<div class="container">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

   <!-- 네비게이션 -->
	<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>
    

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        
        <div class="container">
        	<br><br>
			<div class="row">
			
			    <h2>횟 감 같은 뉴스를 보세요!</h2>
			    <br>
		    	<button onclick="makeNews('rss')"       class="btn" style="background:white !important;"> 속보 </button>
				<button onclick="makeNews('today')"        class="btn" > 오늘의뉴스 </button>
				<button id="IT" onclick="makeNews('it')"   class="btn" style="background:yellow !important;"> IT </button>
                <button onclick="makeNews('culture')"   class="btn btn-primary">culture</button>
                <button onclick="makeNews('politics')"  class="btn btn-info">politics</button>
                <button onclick="makeNews('life')"	    class="btn btn-success">life</button>
                <button onclick="makeNews('engilshNews')" class="btn btn-warning">engilshNews</button>
			    
			    <hr>
				    <section id="pinBoot">
					  
				    </section>
			    <hr>
		</div>
		
        </div>
    </section>
    

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

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
	<script src="${pageContext.request.contextPath}/web/js/main/news.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/memo/memo.js"></script>
	
</div>


<script>
// 이미지 받아오기 
// 	$.ajax({
//		url: "http://localhost:9090/b90ft4/main/newsImg.do",
//		data:{
//			url : items[i].link[0]
//		},
//		async : false
//	}).done(function(result) {
//		console.log(result);
//	});
</script>
</body>

</html>

