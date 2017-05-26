<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Cog + I : Schedule</title>
    
<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/jquery/jquery.min.js"></script>

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

<link href="${pageContext.request.contextPath}/web/css/main/login.css" rel="stylesheet" type="text/css">

<!-- 	네이버 로그인 임시 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<!-- 	//네이버 로그인 임시 -->

<!-- 스윗얼럿 ==================================================================================================== -->
<script src="${pageContext.request.contextPath}/web/js/common/sweetalert.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/sweetalert.css">
<!-- 스윗얼럿 ==================================================================================================== -->
<!-- 메모 -->
<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/memo.css" rel="stylesheet">
<!-- 메모 -->
<!-- 채팅 ==================================================================================================== -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/chat/chat.css">
<!-- 채팅 ==================================================================================================== -->

<style>
.dropdown-menu > li{
	color:green !important;
	background: #9a4545 !important;
}

	img.menu {
		width:60px;
		height: 50px;
	}
	
	.nav a:hover {
		background-color: #fff !important;
		transition:1s;
	}
	
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

#schDetail{
	background-repeat: repeat;
	background-image: url(../../../image/background/texture10.jpg);
}
</style>
</head>

<body id="page-top" class="index">

<div class="container">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

<script>
userId = "admin";
resetMsg = "test";

function statusChangeCallback(response) { 
	
	if (response.status === 'connected') { 
		if(!'${user}'){
			userId = '${user.userId}';
			setUser(); 
		}
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
    	console.log("anybody here?");
    	sectionVisiblity();
    });
  }
  
 	function sectionVisiblity(){
		console.log("section chhhhhhhhhhhk")
	   	$("#portfolio").css("display", "block");
    	$("#loginSuccess").trigger("click");
    	showMain();
   };
</script>
<script>

$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
});

</script>

	<nav id="mainNav"  class="navbar navbar-default navbar-fixed-top navbar-custom" style="padding-bottom: 0px;">
        <div class="container" style="height: 90px;">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/main/main.do"> C <i class="fa fa-cog" aria-hidden="true"></i> G + I</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                <ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${empty user}">
					   
	                   <li class = "loginCall" style="display:none;">
							<a href = "javascript:loginCall();">
							로그인test <i class="fa fa-sign-in fa-3x"></i>
							</a>
					   </li>
				
	                   <li class = "loginCall">
							<a class="temp01" id="temp02" href = "#loginModal">
							로그인 <i class="fa fa-sign-in fa-3x"></i>
							</a>
					   </li>
				
	                   <li class = "loginCall" style="display:none;">
							<a class="temp01" id="temp02" href = "#loginMenu">
							로그인2 <i class="fa fa-sign-in fa-3x"></i>
							</a>
					   </li>
				
	                   <li class = "loginCall" style="display:none;">
							<a class="temp01" id="temp02" href = "#login">
							로그인3 <i class="fa fa-sign-in fa-3x"></i>
							</a>
					   </li>
				
	                   <li class = "loginCall" style="display:none;">
							<a class="temp01" id="temp02" href = "#loginMenu">
							로그인4 <i class="fa fa-sign-in fa-3x"></i>
							</a>
					   </li>
					   
				</c:when>
				<c:otherwise>
				
                   <li class = "dropdown">
					      <a id="acc" class = "dropdown-toggle" data-toggle = "dropdown" href = "#">
								<c:out value="${user.userId}"/>님  <i class="fa fa-user-circle-o fa-3x"></i>
					      </a>
					      
					      <ul class = "dropdown-menu">
					         <li><a href = "javascript:logout();">
								<i class="fa fa-user-times"></i> 로그아웃
							</a></li>
					         <li><a href = "${pageContext.request.contextPath}/login/user.do?userId=${user.userId}">
					         	<i class="fa fa-address-card-o"></i> 내 정보
					        </a></li>
					      </ul>
					      
				   </li>
                      
                   <li class = "dropdown"  data-html="true" data-toggle="tooltip" data-placement="bottom" title="가계부">
					      <a id="acc" class = "dropdown-toggle" data-toggle = "dropdown" href = "#">
								<i class="fa fa-krw fa-3x"></i>
					      </a>
					      
					      <ul class = "dropdown-menu">
					         <li><a href = "${pageContext.request.contextPath}/accountBook/budget.do">지출/수입</a></li>
					         <li><a href = "${pageContext.request.contextPath}/accountBook/loanDept.do">대입금/차입금</a></li>
					         <li><a href = "${pageContext.request.contextPath}/accountBook/setting.do">설정</a></li>
					      </ul>
					      
				   </li>
				   
                    <li>
                        <a href="${pageContext.request.contextPath}/diary/list.do"  data-html="true" data-toggle="tooltip" data-placement="bottom" title="다이어리">
                        		 <i class="fa fa-book fa-3x"></i>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/schedule/scheduleList.do?userId=${user.userId}" data-html="true" data-toggle="tooltip" data-placement="bottom" title="스케줄">	
                        		<i class="fa fa-calendar fa-3x"></i>
                        </a>

                    </li>
                        
                    <li data-html="true" data-toggle="tooltip" data-placement="bottom" title="운동">
                          <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#" >
								<i class="fa fa-child fa-3x"></i>
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
                    <li id="memoNav" >
							<a style="padding-bottom: 0px;" id="addMemo">
								<i class="fa fa-pencil-square-o fa-3x"></i>
							</a>

							<span id="onOff" style="margin-left: 3.8px; display: none;" data-html="true"  data-toggle="tooltip" data-placement="bottom" title="메모"> 	    				
	              	    		<input type="checkbox" id="showAndHideMemo" value="1" name="memoOpt" checked data-toggle="switch" class="ct-info"/>
							</span>

		            </li>
				   <li id="topbar-chat" class="hidden-xs" data-html="true" data-toggle="tooltip" data-placement="bottom" title="채팅">
						<a href="javascript:void(0)" data-step="4" data-intro="&lt;b&gt;Form chat&lt;/b&gt; keep you connecting with other coworker" data-position="left" class="btn-chat">
							<i class="fa fa-weixin fa-3x" ></i>
						</a>
				   </li>
				</c:otherwise> 
			</c:choose>
                        
                    <li data-html="true" data-toggle="tooltip" data-placement="bottom" title="뉴스">
                        <a href="${pageContext.request.contextPath}/main/news.do">
                        	<i class="fa fa-newspaper-o fa-3x"></i>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
    
    <div id="login">
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
	                        <div class="row" style="text-align: center; padding-left: 60px;">
	                       		
	                       			<div id="spinner" style=" background: #1EC800; border-radius: 5px;
									        color: white; height: 40px; text-align: center; width: 250px;">
		                       			<div id="naver_id_login"></div>
									</div>
									<br>
	                       			<div id="spinner" style=" background: #4267b2; border-radius: 5px;
									        color: white; height: 40px; text-align: center; width: 250px;">
		                        		<div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false"></div>
									</div>
	                        </div>
	                        <br>
	                        <div class="row" style="text-align: center;">
	                            <div class="form-group col-xs-12" style="margin: auto; ">
	                                <a id="loginSuccess" href="${pageContext.request.contextPath}/main/main.do" class="btn btn-success btn-lg">확인</a>
	                                <a href="#close" class="btn btn-danger btn-lg">취소</a>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	         </div>
        </div>
   </div>
   
   	     <script>
		    	$("#memoNav").hover(function() {
		    		
            		$("#onOff").show();
            		$('#onOff').tooltip('show');
            		
            	},function() {
            		$('#onOff').tooltip('destroy');
            		$("#onOff").hide();
            		
            	});
         </script>
   
   
   
      <!-- 스위치 -->
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/gsdk-checkbox.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/gsdk-radio.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/gsdk-bootstrapswitch.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/get-shit-done.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/custom.js"></script>     --%>
    
     <!-- 채팅 -->
     <div id="chat-form" class="fixed">
         <div class="chat-inner">
            
             <h2 class="chat-header">
                 <a href="javascript:;" class="chat-form-close pull-right" style="text-decoration: none;">
	                     닫기
                 </a>
                 <i class="fa fa-user"></i>&nbsp; 친구 목록 &nbsp;</h2>
            
            
             <div id="group-1" class="chat-group">
             </div>
             
             <div id="group-2" class="chat-group">
             </div>
             
             <div id="group-3" class="chat-group">
                 <strong style="color: yellow;font-size:20px;">친구 찾기</strong>
                 <input  style="margin-left: 30px;margin-bottom: 5px;" type="text" id="friend" /><br>
                 <button style="margin-left: 30px;" id="addFriend" type = "button" class = "btn btn-info">친구 추가</button>
             </div>
             
             
             <div id="group-4" class="chat-group" style="margin-left: 30px;">
             	<br><br>
				<ul class = "list-group" style="width: 200px;">
				   <li class = "list-group-item active" style="text-align: center;">자기 관리 순위</li>
				  
				   <li class = "list-group-item">	
				   		<span class="badge badge-danger pull-left">1</span>
	            		&nbsp;&nbsp; admin
	  			      <span class = "badge"><a href="javascript:addFriend('admin');">친구 추가</a></span>
				   </li>
				  
				   <li class = "list-group-item">
				   		<span class="badge badge-warning pull-left">2</span>
				   		&nbsp;&nbsp;durad han
				      <span class = "badge"><a href="javascript:addFriend('durad han');">친구 추가</a></span>
				   </li>
				   
				   <li class = "list-group-item">
					    <span class="badge badge-info pull-left">3</span>
					    &nbsp;&nbsp;손광석
				      <span class = "badge"><a href="javascript:addFriend('손광석');">친구 추가</a></span>
				   </li>
				   
				   <li class = "list-group-item">
				   	    <span class="badge badge-danger pull-left">4</span>
				   	    &nbsp;&nbsp;한선재
				        <span class = "badge"><a href="javascript:addFriend('한선재');">친구 추가</a></span>
				   </li>
				   
				   <li class = "list-group-item">
				      <span class="badge badge-info pull-left">5</span>
				      &nbsp;&nbsp;김현영
				      <span class = "badge"><a href="javascript:addFriend('김현영');">친구 추가</a></span>
				   </li>
				</ul>      
			</div>
             
         </div>
       
         <div id="chat-box" style="top: 400px">
            
             <div class="chat-box-header">
                 <a href="#" class="chat-box-close pull-right" style="text-decoration: none;">
                 	 	닫기
                 </a>
                 <span class="user-status is-online"></span>
                 <span class="display-name">
                 Willard Mckenzie
                 </span> 
                 <small>Online</small>
             </div>
            
             <div class="chat-content">
                 <ul class="chat-box-body">
                     <li>
                         <p>
                             <img src="${pageContext.request.contextPath}/web/image/accountBook/팬더.jpg" class="avt" /><span class="user">John Doe</span><span
                                 class="time">09:33</span></p>
                         <p>
                             Hi Swlabs, we have some comments for you.</p>
                     </li>
                     <li class="odd">
                         <p>
                             <img src="${pageContext.request.contextPath}/web/image/accountBook/팬더.jpg" class="avt" /><span class="user">Swlabs</span><span
                                 class="time">09:33</span></p>
                         <p>
                             Hi, we're listening you...</p>
                     </li>
                 </ul>
             </div>
            
            <div class="chat-textarea">
                 <input placeholder="Type your message" class="form-control" />
            </div>
            
         </div>
         
         
     </div>
     <!--END CHAT FORM-->
     
	<!-- 채팅 네비게이션에 꼭 필요. -->
    <!-- 채팅 js -->
	<script>
// 		var myId = "김현영";
		if('${user.userId}'){
			myId = '${user.userId}';
		}
    </script>
    <c:if test="${not empty user.userId}">
	    <script src="http://14.32.66.123:10006/socket.io/socket.io.js"></script>
		<script src="${pageContext.request.contextPath}/web/js/chat/chat.js"></script>
	    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/jquery.metisMenu.js"></script> 
	    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/jquery.slimscroll.js"></script>
	    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/jquery.cookie.js"></script>
	    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/icheck.min.js"></script>
	    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/main.js"></script>
    </c:if>
    <!-- 꼭 필요. -->
     
    
<script type="text/javascript">
	var naver_id_login = new naver_id_login("q_ZhPmwu3AMenQdKmDGj", "http://14.32.66.123:9092/b90ft4/login/nLogin.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,40);
	naver_id_login.setDomain("http://14.32.66.123:10000/b90ft4/main/main.do");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	
	function logout (){
		swal({
			  title: "Logout",
			  text: "정말 로그아웃하시겠습니까?",
			  type: "warning",
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "그래요",
			  showCancelButton: true,
			  closeOnConfirm: true
			},function(){
				FB.logout(function(response) {
					location.href="${pageContext.request.contextPath}/login/logout.do";
					});
			})
	};
</script>
<script>
var getUserId = "admin";
if('${user.userId}'){
	getUserId = '${user.userId}';
}
</script>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" >
        <div class="container">
        <br><br>
		<div class="row">
		
<!-- 		상단 목록/달력 탭 -->
			<div class="col-lg-12">
        		<ul id="generalTab" class="nav nav-tabs responsive" style="width: 80%;">
                    <li id="listTab" class="active"><a href="#list-tab" data-toggle="tab"><i class="fa fa-list" style="font-size:24px"></i> 목록으로 보기</a></li>
                    <li id="calendarTab"><a href="#calendar-tab" data-toggle="tab"><i class="fa fa-calendar" style="font-size:24px"></i> 달력으로 보기</a></li>
                </ul>
			</div>
<!-- 		상단 목록/달력 탭 끝남 -->

<!-- 		메인 영역 -->
		<div class="row">
			<div class="col-lg-12">
			<div id="generalTabContent" class="tab-content responsive">

<!-- 			목록 탭 시작 -->
            	<div id="list-tab" class="tab-pane fade in active" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green">
             		<div class="panel-heading">${user.userId}님의 스케줄 목록입니다</div>
                	<div class="panel-body">
                	
			<!-- 		왼쪽 리스트  -->
					<div class="col-lg-4">
						<ul class="schedule-list__pagination schedule-list__pagination--inactive" id="schedule-list-pagination">
						</ul>
						
						<div class="side-scroll">
							<div id="sList__list"></div>
						</div>
					</div>
			<!-- 		왼쪽 리스트 끝  -->
					
			<!-- 		오른쪽 인풋/디테일  -->
						<div class="col-lg-8">
						
<!-- 						판넬 시작 -->
							<div class="panel">
							<div class="panel-body">
							
								<!-- 이전 스케줄 링크 -->
								<div class="alert alert-success" id="prev"><strong>이전 스케줄</strong> 스케줄 링크</div>
								
<!-- 							내부 디테일 판넬 -->
					            <div class="panel panel-orange">
									<div class="panel-heading">
									Schedule Detail
									</div>
									    
						<!-- 	내부 디테일 판넬 바디 -->
									<div class="panel-body pan" id="schDetail">
									
									<!-- 스케줄 입력 폼 시작 -->
									<form name="insertSchedule" action="insertSchedule.do" onsubmit="return scheduleForm();" method="post">
									<div class="form-body pal">
								<div class="clz-insertSchedule">
									
									<div class="form-group">
									        <input id="inputTitle" name="title" type="text" placeholder="제목" class="form-control" />
									</div>
									
									<div class="row">
									    <div class="col-md-6">
									        <div class="form-group">
									            <input id="inputStart" name="start" type="text" placeholder="시작 시간" value="" />
									        </div>
									    </div>
									    <div class="col-md-6">
									        <div class="form-group">
									            <input id="inputEnd" name="end" type="text" placeholder="종료 시간" value="" />
									        </div>
									    </div>
									</div>
									
									<div class="form-group">
									        <input id="inputContent" name="content" type="text" placeholder="내용" class="form-control" ></input>
									</div>
								</div>
									
									<div class="form-group text-center">
						                <div class="col-sm-12 controls">
						                <div class="row">
							                <div class="radio">
								                <label class="radio-inline">
								                	<input type="radio" name="category" value="0" checked="checked"><span>기본 스케줄</span>
								                </label>
								                <label class="radio-inline">
								                	<input type="radio" name="category" value="1"><span>지출이 있는 스케줄</span>
								                </label>
								                <label class="radio-inline">
								                	<input type="radio" name="category" value="2"><span>운동 스케줄</span>
								                </label>
							                </div>
							                
						                <div class="col-lg-12 controls">
						                <div class="row">
							    			<div class="conditional" data-cond-option="category" data-cond-value="0">
							    				<br>
							    				<span>달력에 일정을 추가합니다</span>
							    				<br><br>
							    				<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/스케쥴5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="스케쥴" />
										    </div>
							    			<div class="conditional" data-cond-option="category" data-cond-value="1">
							    				<br>
							    				<span>지출할 금액 입력이 가능한 스케줄입니다</span>
							    				<br><br>
													<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/가계부5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="가계부"/>
							    				<br><br>
							    				<input id="inputBudget" name="expenseCategory" type="text" placeholder="0,000"/>
							    				<br>
											</div>
							    				<br>
							    				
										    </div>
							    			<div class="conditional" data-cond-option="category" data-cond-value="2">
							    				<span>운동 알람을 설정합니다</span>
							    				<br><br>
													<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/운동5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="운동"/>
							    				<br><br>
							    				
										    </div>
						                </div>
						                </div>
						                </div>
						                </div>
					                </div>
									
<!-- 								임시 입력영역 -->
									<div class="form-group">
									        <input id="inputUserId" name="userId" type="hidden" value="${user.userId}" class="form-control" />
									        <input id="inputAchieve" name="achieve" type="hidden" value="0" class="form-control" />
									</div>
<!-- 								임시 입력영역 종료 -->
									
<!-- 								중요도 설정 -->
									<div class="form-group text-center">
								    	<div class="stars"></div>
									    <div class="stars-msg"></div>
									</div>
<!-- 								중요도 설정 끝 -->

<!-- 								추가버튼     -->
									<div class="form-actions text-center pal">
										<button class="btn btn-success">추가</button>
									</div>
<!-- 								추가버튼 끝   -->
									
									</form>
<!-- 								스케줄 입력 폼 종료 -->
									
									</div>
							<!-- 	내부 디테일 판넬 바디 끝 -->
									</div>
							<!-- 	내부 디테일 판넬 끝 -->
							
								<!-- 다음 스케줄 링크 -->
								<div class="alert alert-success" id="next"><strong>다음 스케줄</strong> 다음 스케줄 링크</div>
								
								</div>
								</div>
<!--                 			판넬 끝	 -->
							</div>
			<!-- 		오른쪽 인풋/디테일 영역 종료 -->
					 
						</div>

                </div>
                </div>
<!-- 			목록 탭 종료 -->
               	
<!-- 			달력 탭 시작 -->
               	<div id="calendar-tab" class="tab-pane fade" style="min-height:200px;overflow: auto;">
			    <div class="panel panel-yellow">
	                <div class="panel-heading">스케줄 달력</div>
	                <div class="panel-body">
	                
<!-- 	                달력 입력영역 -->
					<div id='calendar'></div>
					
	                </div>
	                
				</div>
				</div>
<!-- 			달력 탭 종료 -->   
            	
            </div>
           	</div>
        </div>
<!-- 	메인 영역 종료	 -->

		</div>
		</div>
    </section>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
</div>
<c:import url ="/WEB-INF/jsp/common/bottomInclude.jsp"/>
<c:import url ="/WEB-INF/jsp/schedule/scheduleInclude.jsp"/>
<script>
$(function() {
	  $('.tooltip-show').each(function() {
		  $(this).tooltip("toggle");
	  });
});
</script>
</body>

</html>
