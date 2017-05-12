<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
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
							<a href = "javascript:logout();"><c:out value="${user.userId}"/>님 로그아웃</a>
					   </li>
	                   <li class = "loginCall">
							<a href = "${pageContext.request.contextPath}/login/user.do">내 정보</a>
					   </li>
                      
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
				</c:otherwise> 
			</c:choose>
                        
                    <li>
                        <a href="${pageContext.request.contextPath}/main/news.do">뉴스</a>
                    </li>

                </ul>
                
            </div>
        </div>
    </nav>
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
                                <a href="${pageContext.request.contextPath}/main/main.do" class="btn btn-success btn-lg">확인</a>
                                <a href="#close" class="btn btn-danger btn-lg">취소</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
    </section>
    
    
<script type="text/javascript">
	var naver_id_login = new naver_id_login("q_ZhPmwu3AMenQdKmDGj", "http://14.32.66.123:9092/b90ft4/login/nLogin.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,40);
	naver_id_login.setDomain("http://14.32.66.123:9092/b90ft4/main/main.do");
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