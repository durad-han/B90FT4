<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
userId = "admin";

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
    });
  }
</script>
<script>

$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
});

</script>


<!-- <nav id="mainNav" style="background-color: rgb(214, 32, 140);" class="navbar navbar-default navbar-fixed-top navbar-custom"> -->
<!-- <nav id="mainNav"  style="height: 120px;" class="navbar navbar-default navbar-fixed-top navbar-custom"> -->
<nav id="mainNav"  class="navbar navbar-default navbar-fixed-top navbar-custom">
       
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/main/main.do">Cog + I</a>
                <a class="navbar-brand" href="#page-top"><i class="fa fa-caret-up" style="font-size:24px"></i></a>
            </div>

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
	                   		<br>
							<a href = "javascript:logout();">
								<c:out value="${user.userId}"/>님 로그아웃
<%-- 								<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/로그아웃.png" /> --%>
							</a>
							
					   </li>
	                   <li class = "loginCall">
							<br>
							<a href = "${pageContext.request.contextPath}/login/user.do?userId=${user.userId}">내 정보</a>
					   </li>
                      
                   <li class = "dropdown">
					     
					      <a id="acc" class = "dropdown-toggle" data-toggle = "dropdown" href = "#">
<!-- 					          가계부 <span class = "caret"></span> -->
								<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/가계부5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="<h3>가계부</h3>" />
					      </a>
					      <script>$("#acc").click(function(){console.log("ㅋㅋ");}) </script>
					      
					      <ul class = "dropdown-menu">
					         <li><a href = "${pageContext.request.contextPath}/accountBook/budget.do">지출/수입</a></li>
					         <li><a href = "${pageContext.request.contextPath}/accountBook/loanDept.do">대입금/차입금</a></li>
					         <li><a href = "${pageContext.request.contextPath}/accountBook/setting.do">설정</a></li>
					      </ul>
					      
				   </li>
				   
                    <li>
                        <a href="${pageContext.request.contextPath}/diary/list.do">
							<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/일기5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="<h3>Diary</h3>" />
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/schedule/scheduleList.do?userId=${user.userId}">	
                        		<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/스케쥴5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="<h3>스케쥴</h3>" />
                        </a>

                    </li>
                        
                    <li>
                          <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#" >
<!-- 					          운동 <span class = "caret"></span> -->
								<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/운동5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="<h3>운동</h3>"/>
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
<!-- 		                <span> -->
							<a id="addMemo">
								<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/메모5.png" style="height:25px;" data-html="true" data-toggle="tooltip" data-placement="bottom" title="<h3>메모</h3>"/>
							</a>
<!-- 						</span> -->
<!-- 	             	   <input type="checkbox" id="showAndHideMemo" name='memoOpt' value='1' checked style="width:15px;height:15px;"/> -->
<!-- 					   <label for='showAndHideMemo' style="color:white;">메모 보기</label> -->
							<span style="margin-left: 15px;">	    				
	              	    		<input type="checkbox" id="showAndHideMemo" value="1" name="memoOpt" checked data-toggle="switch" class="ct-info"/>
							</span>

		            </li>
		            <!-- 채팅 아이콘 -->
				   <li id="topbar-chat" class="hidden-xs">
						<a href="javascript:void(0)"  data-html="true" data-toggle="tooltip" data-placement="bottom" title="<h3>채팅</h3>" data-step="4" data-intro="&lt;b&gt;Form chat&lt;/b&gt; keep you connecting with other coworker" data-position="left" class="btn-chat">
<!-- 						       <i class="fa fa-comments fa-6" aria-hidden="true"></i> -->
							<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/채팅5.png" />
						</a>
				   </li>
				</c:otherwise> 
			</c:choose>
                        
                    <li>
                        <a href="${pageContext.request.contextPath}/main/news.do" data-html="true" data-toggle="tooltip" data-placement="bottom" title="<h3>뉴스</h3>">
							<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/뉴스5.png"  />
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
<!-- 	                        <div class="row control-group"> -->
	<!--                             <div class="form-group col-xs-12 floating-label-form-group controls"> -->
	<!--                                 <label for="userId">ID</label> -->
	<!--                                 <input type="text" class="form-control" placeholder="ID" id="userId" required data-validation-required-message="아이디를 입력해주세요."> -->
	<!--                                 <p class="help-block text-danger"></p> -->
	<!--                             </div> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="row control-group"> -->
	<!--                             <div class="form-group col-xs-12 floating-label-form-group controls"> -->
	<!--                                 <label for="password">Password</label> -->
	<!--                                 <input type="password" class="form-control" placeholder="Password" id="password" required data-validation-required-message="비밀번호를 입력해주세요."> -->
	<!--                                 <p class="help-block text-danger"></p> -->
	<!--                             </div> -->
<!-- 	                        </div> -->
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
	                                <a href="${pageContext.request.contextPath}/main/main.do" class="btn btn-success btn-lg">확인</a>
	                                <a href="#close" class="btn btn-danger btn-lg">취소</a>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	         </div>
        </div>
   </div>
   
      <!-- 스위치 -->
<%--  	<script src="${pageContext.request.contextPath}/web/bootstrap/jquery/jquery-1.10.2.js" type="text/javascript"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/bootstrap3/js/bootstrap.js" type="text/javascript"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/gsdk-checkbox.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/gsdk-radio.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/gsdk-bootstrapswitch.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/get-shit-done.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/assets/js/custom.js"></script>     --%>
   
    
     <!-- 채팅 -->
     <!--BEGIN CHAT FORM-->
     <div id="chat-form" class="fixed">
         <div class="chat-inner">
            
             <h2 class="chat-header">
                 <a href="javascript:;" class="chat-form-close pull-right" style="text-decoration: none;">
<!-- 	                 <i class="glyphicon glyphicon-remove"> -->
<!-- 	                 </i> -->
<!-- 	                 <span class="glyphicons glyphicons-log-in"></span> -->
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
<!-- 	                 <i class="glyphicon glyphicon-remove"> -->
<!-- 	                 </i> -->
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
	    <script src="http://14.32.66.123:10000/socket.io/socket.io.js"></script>
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