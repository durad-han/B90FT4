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
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css">

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/news.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/memo.css" rel="stylesheet">

<!--  					<li> -->
<%--                         <a href="${pageContext.request.contextPath}/main/news.do">뉴스</a> --%>
<!--                     </li> -->
<!-- 					 <li> -->
<!-- 	             	   <input type="checkbox" id="showAndHideMemo" name='memoOpt' value='1' checked style="width:30px;height:30px;"/><br> -->
<!-- 					   <label for='showAndHideMemo' style="color:white;">메모 보기</label> -->
<!-- 	                </li> -->
	              
<!-- 	                <li> -->
<!-- 		                <div> -->
<!-- 							<button id="addMemo">메모 추가</button> -->
<!-- 						</div> -->
<!-- 	                </li> -->

	
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
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
					         <li><a href = "${pageContext.request.contextPath}/accountBook/budget.do">지출/수입</a></li>
					         <li><a href = "${pageContext.request.contextPath}/accountBook/loanDept.do">대입금/차입금</a></li>
					         <li><a href = "${pageContext.request.contextPath}/accountBook/setting.do">설정</a></li>
					      </ul>
					      
				   </li>
                        
                    <li class="page-scroll">
                        <a href="#about">다이어리</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">스케쥴러</a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/main/news.do">뉴스</a>
                    </li>
                    
                    <li>
	             	   <input type="checkbox" id="showAndHideMemo" name='memoOpt' value='1' checked style="width:30px;height:30px;"/><br>
					   <label for='showAndHideMemo' style="color:white;">메모 보기</label>
	                </li>
	              
	                <li>
		                <div>
							<button id="addMemo">메모 추가</button>
						</div>
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
</body>

</html>
<script>
// 이미지 받아오기 
//	$.ajax({
//		url: "http://localhost:9090/b90ft4/main/newsImg.do",
//		data:{
//			url : items[i].link[0]
//		},
//		async : false
//	}).done(function(result) {
//		console.log(result);
//	});
</script>

