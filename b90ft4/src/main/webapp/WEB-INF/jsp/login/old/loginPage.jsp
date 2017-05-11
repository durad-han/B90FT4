<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>
<script>
function statusChangeCallback(response) { 
	console.log('statusChangeCallback'); 
	console.log(response);
	
	if (response.status === 'connected') { 
		testAPI(); 
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
 
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      console.dir(response);
      
//       location.href="${pageContext.request.contextPath}/login/login.do";
      
      document.getElementById('status').innerHTML =
        '환영합니다~, ' + response.name + '님';
      $.ajax({
	    	url : "/b90ft4/login/login.do",
	  		type: "POST",
	  		data: {userId : response.name},
	  		dataType: "json",
	  		success: function(){
	  			console.log("hello login")
	  		}
      })
    });
  }
</script>

	<div id="loginMenu">
		
		 <div id="naver_id_login"></div>
		 
		 <br><br>
		 
		 <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false"></div>
		 <div id="status"></div>
		 
		 <br><br>
	</div>
	
<script type="text/javascript">
	var naver_id_login = new naver_id_login("q_ZhPmwu3AMenQdKmDGj", "http://14.32.66.123:9092/b90ft4/login/login.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,40);
	naver_id_login.setDomain("http://14.32.66.123:9092/b90ft4/login/login.do");
	naver_id_login.setState(state);
	naver_id_login.init_naver_id_login();
</script>
</body>
</html>