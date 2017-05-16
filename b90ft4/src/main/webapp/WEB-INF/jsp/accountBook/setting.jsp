<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 	<script src ="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script> 이것 때문에 모달이 안된다. -->

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"> -->
<!--     <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css"> -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/sub.css" rel="stylesheet" type="text/css" />
	
	<!-- 로긴 css -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/main/login.css">
	
	<script src="http://192.168.0.60:10001/socket.io/socket.io.js"></script>
	
</head>

<body id="page-top" class="index">

<%-- <div class="container" style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100%'> --%>
<div class="container">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
 	<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>  

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
               <br><br>
               <div class="page-title-breadcrumb option-demo">
                   <div class="page-header">
                       <div class="page-title mrm">
                            <button id="budgetManagement" type="button" style='width:500px;text-align:center;margin-left: 50%;'> 지출 관리 </button>
                       </div>
                   </div>
               </div>
                             
				<!-- 자산 등록 모달 -->
				<div class="modal-dialog" style='width:25%;display: none;'>
						<div class="modal-content">
									
							<div class="modal-header">
								<h4 class="modal-title">지출 한도 설정
									<button id="set">설정</button>
									<button id="noSet">미설정</button>
									
								</h4>
							</div>
									
	                        <div id="managementDiv">
								    <div class="modal-body">
										<form name="budgetManageF">
				                                        
		                                       	 <h4><b>이번 달</b></h4>
	                                             <input type="text" id="expensePlanDate" readonly />
	                                             <br>
		                                       	 <h4><b>목표 지출 한도</b></h4>
		                                         <input type="text" id="expenseGoal"/>
						                                                      
			                              </form>
			                              
		                      	    </div>
		                                
									<div class="modal-footer">
										<button type="button" id="registerPlan">등록</button>
									</div>
	                          </div>
						</div>
				</div>
                             
                           	
               	<div class="page-title-breadcrumb option-demo">
                         <div class="page-header">
                             <div class="page-title mrm">
                                  <button type="button" id="getBook" style='width:500px;text-align:center;margin-left: 50%;'>엑셀로 가계부 받기</button>
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
	<script src="${pageContext.request.contextPath}/web/js/accountbook/setting.js"></script>
	
    <!-- 차트 js -->
	<script src="${pageContext.request.contextPath}/web/js/memo/memo.js"></script>
	
	<!-- 채팅 js -->
	<script>
		var myId = "김현영";
		if('${user.userId}'){
			myId = '${user.userId}';
		}
		console.log(myId);
    </script>
	<script src="${pageContext.request.contextPath}/web/js/chat/chat.js"></script>

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
