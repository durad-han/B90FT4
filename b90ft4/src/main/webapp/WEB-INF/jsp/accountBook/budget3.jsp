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

	  <!-- Bootstrap Core CSS -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css">
    
    <!-- chat -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/chat/chat.css">
    
    <!-- 프리랜서 Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/memo.css" rel="stylesheet">
    
    
	<!-- 제이쿼리 , Bootstrap css-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<!-- 	<link href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel = "stylesheet"> -->
	
	<!-- 제이쿼리, 부트스트랩 js -->
	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src ="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/sub.css" rel="stylesheet" type="text/css" />
	
	
	
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
                     <li id="topbar-chat" class="hidden-xs"><a href="javascript:void(0)" data-step="4" data-intro="&lt;b&gt;Form chat&lt;/b&gt; keep you connecting with other coworker" data-position="left" class="btn-chat"><i class="fa fa-comments"></i><span class="badge badge-info">3</span></a></li>
                    
                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">

			<!--BEGIN CHAT FORM-->
			     <div id="chat-form" class="fixed">
			         <div class="chat-inner">
			             <h2 class="chat-header">
			                 <a href="javascript:;" class="chat-form-close pull-right"><i class="glyphicon glyphicon-remove">
			                 </i></a><i class="fa fa-user"></i>&nbsp; Chat &nbsp;<span class="badge badge-info">3</span></h2>
			             <div id="group-1" class="chat-group">
			                 <strong>Favorites</strong><a href="#"><span class="user-status is-online"></span> <small>
			                     Verna Morton</small> <span class="badge badge-info">2</span></a><a href="#"><span
			                         class="user-status is-online"></span> <small>Delores Blake</small> <span class="badge badge-info is-hidden">
			                             0</span></a><a href="#"><span class="user-status is-busy"></span> <small>Nathaniel Morris</small>
			                                 <span class="badge badge-info is-hidden">0</span></a><a href="#"><span class="user-status is-idle"></span>
			                                     <small>Boyd Bridges</small> <span class="badge badge-info is-hidden">0</span></a><a
			                                         href="#"><span class="user-status is-offline"></span> <small>Meredith Houston</small>
			                                         <span class="badge badge-info is-hidden">0</span></a></div>
			             <div id="group-2" class="chat-group">
			                 <strong>Office</strong><a href="#"><span class="user-status is-busy"></span> <small>
			                     Ann Scott</small> <span class="badge badge-info is-hidden">0</span></a><a href="#"><span
			                         class="user-status is-offline"></span> <small>Sherman Stokes</small> <span class="badge badge-info is-hidden">
			                             0</span></a><a href="#"><span class="user-status is-offline"></span> <small>Florence
			                                 Pierce</small> <span class="badge badge-info">1</span></a></div>
			             <div id="group-3" class="chat-group">
			                 <strong>Friends</strong><a href="#"><span class="user-status is-online"></span> <small>
			                     Willard Mckenzie</small> <span class="badge badge-info is-hidden">0</span></a><a
			                         href="#"><span class="user-status is-busy"></span> <small>Jenny Frazier</small>
			                         <span class="badge badge-info is-hidden">0</span></a><a href="#"><span class="user-status is-offline"></span>
			                             <small>Chris Stewart</small> <span class="badge badge-info is-hidden">0</span></a><a
			                                 href="#"><span class="user-status is-offline"></span> <small>Olivia Green</small>
			                                 <span class="badge badge-info is-hidden">0</span></a></div>
			         </div>
			         <div id="chat-box" style="top: 400px">
			             <div class="chat-box-header">
			                 <a href="#" class="chat-box-close pull-right"><i class="glyphicon glyphicon-remove">
			                 </i></a><span class="user-status is-online"></span><span class="display-name">Willard
			                     Mckenzie</span> <small>Online</small>
			             </div>
			             <div class="chat-content">
			                 <ul class="chat-box-body">
			                     <li>
			                         <p>
			                             <img src="images/avatar/128.jpg" class="avt" /><span class="user">John Doe</span><span
			                                 class="time">09:33</span></p>
			                         <p>
			                             Hi Swlabs, we have some comments for you.</p>
			                     </li>
			                     <li class="odd">
			                         <p>
			                             <img src="images/avatar/48.jpg" class="avt" /><span class="user">Swlabs</span><span
			                                 class="time">09:33</span></p>
			                         <p>
			                             Hi, we're listening you...</p>
			                     </li>
			                 </ul>
			             </div>
			             <div class="chat-textarea">
			                 <input placeholder="Type your message" class="form-control" /></div>
			         </div>
			     </div>
			     <!--END CHAT FORM-->   
   
   
   
                	<!-- 
                		자신의 기능 보여줄 화면
                	 -->	
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
	
    <!-- 채팅 네비게이션에 꼭 필요. -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/jquery.metisMenu.js"></script> 
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/main.js"></script>
    <!-- 꼭 필요. -->
	
	
</div>
</body>

</html>
