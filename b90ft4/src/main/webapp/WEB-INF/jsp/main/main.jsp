<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Cog + I</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/sub.css" rel="stylesheet" type="text/css" />

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="${pageContext.request.contextPath}/web/css/main/login.css" rel="stylesheet" type="text/css">

	<!-- 	네이버 로그인 임시 -->
	  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<!-- 	//네이버 로그인 임시 -->
	
	<style>
		.dropdown-menu > li{
			color:black !important;
			background: black !important;
		}
	</style>

</head>

<body id="page-top" class="index">

<script>
function statusChangeCallback(response) { 
	
	if (response.status === 'connected') { 
		if(!'${user}') setUser(); 
	} else if (response.status === 'not_authorized') { 
		document.getElementById('status').innerHTML = '해당 페이지에 등록이 필요합니다'; 
	} else { 
		document.getElementById('status').innerHTML = '페이스북 로그인이 필요합니다'; 
	} 
} 

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  	FB.init({ appId      : '226857754465479',
   			 cookie     : true,  
   			 xfbml      : true,  
			 version    : 'v2.8' 
  			});
  	
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  	});
  };
  	
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/ko_KR/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
 
  function setUser() {
    FB.api('/me', function(result) {
	location.href="${pageContext.request.contextPath}/login/login.do?userId="+result.name;      
    });
  }
</script>

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
                <a class="navbar-brand" href="#page-top">Cog + I</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                 <c:choose>
                   <c:when test="${empty user}">
	                   <li class = "loginCall">
							<a href = "#loginModal">로그인</a>
					   </li>
                   </c:when>
                   <c:otherwise>
	                   <li class = "logoutCall">
							<a href = "#logout"><c:out value="${user}"/>님 로그아웃</a>
					   </li>
	                   <li class = "loginCall">
							<a href = "${pageContext.request.contextPath}/login/user.do">내 정보</a>
					   </li>
                   </c:otherwise> 
                 </c:choose>
                      
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
                    <li>
                        <a href="${pageContext.request.contextPath}/diary/list.do">다이어리</a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/schedule/scheduleList.do">스케줄</a>
                    </li>
                        
                    <li>
<%--                         <a href="${pageContext.request.contextPath}/workout/workout.do">운동</a> --%>
                          <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">
					          운동 <span class = "caret"></span>
					      </a>
					      <ul class = "dropdown-menu">
					         <li><a href="${pageContext.request.contextPath}/workout/workout.do">운동 하기</a></li>
					         <li><a href="${pageContext.request.contextPath}/workout/workoutCal.do">칼로리 계산</a></li>
					         <li><a href="javascript:workoutMoveChart()">차트</a></li>
					      </ul>
                        
                        <script>
                        	function workoutMoveCal(){
                        		$("#portfolio > .container").load("/b90ft4/web/view/workout/workoutCal.html");
                        	}
                        	function workoutMoveChart(){
                        		$("#portfolio > .container").load("/b90ft4/web/view/workout/workoutChart.html");
                        	}
                        </script>
                        
                        
                    </li>
                        
                    <li>
                        <a href="${pageContext.request.contextPath}/main/news.do">뉴스</a>
                    </li>

                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    

    <!-- Header -->
    <header>
        <div class="container" id="maincontent" tabindex="-1">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/web/image/corgi/Corgi-web-icon-01-1.jpg" alt="">
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
    
    <!-- Login Section -->
    <section id="login">
        <div class="container" id="loginModal">
        <div id="loginMenu">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Login</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form name="loginItem" id="loginItem" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="userId">ID</label>
                                <input type="text" class="form-control" placeholder="ID" id="userId" required data-validation-required-message="아이디를 입력해주세요.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" placeholder="Password" id="password" required data-validation-required-message="비밀번호를 입력해주세요.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row">
                       		<div id="naver_id_login"></div>
                        	<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false"></div>
			 				<div id="status"></div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">확인</button>
                                <a href="#close" class="btn btn-danger btn-lg">취소</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
    </section>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
        
            <div class="row">
            
                <div class="col-lg-12 text-center">
                    <h2>관리 마법사</h2>
                    <hr class="star-primary">
                </div>
            </div>
            
            <div class="row">
            
                <div class="col-sm-6 portfolio-item" data-toggle = "tooltip" title = "가계부" >
                    <a href="${pageContext.request.contextPath}/accountBook/budget.do" class="portfolio-link">
                    
                    	<!-- 돋보기 배경 -->
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <!-- 돋보기 배경 끝 -->
                        
                        <img src="${pageContext.request.contextPath}/web/bootstrap/freelancer/img/portfolio/cabin.png" class="img-responsive" alt="Cabin">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item">
                    <a href="${pageContext.request.contextPath}/workout/workout.do" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/image/corgi/Corgi-workout-icon-01.jpg" class="img-responsive" alt="Slice of cake">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item">
                    <a href="${pageContext.request.contextPath}/schedule/scheduleList.do" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/image/corgi/Corgi-schedule-icon-01.gif" class="img-responsive" alt="Game controller">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item">
                    <a href="${pageContext.request.contextPath}/diary/list.do" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/bootstrap/freelancer/img/portfolio/safe.png" class="img-responsive" alt="Safe">
                    </a>
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
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/freelancer.min.js"></script>
</div>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("q_ZhPmwu3AMenQdKmDGj", "http://14.32.66.123:9092/b90ft4/login/nLogin.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,40);
	naver_id_login.setDomain("http://14.32.66.123:9092/b90ft4/main/main.do");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
</body>

</html>
