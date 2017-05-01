

var naver_id_login = new naver_id_login("q_ZhPmwu3AMenQdKmDGj", "http://14.32.66.123:9092/b90ft4/login/loginForm.do");
 
	// 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  
	// 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  
//	$.ajax({
//		url: "/b90ft4/login/nLogin.json",
//		type: "POST",
//		datatype: "json",
//		data: {
//		    id: naver_id_login.getProfileData('nickname'),
//		    email: naver_id_login.getProfileData('email')
//			}
//		})
  }