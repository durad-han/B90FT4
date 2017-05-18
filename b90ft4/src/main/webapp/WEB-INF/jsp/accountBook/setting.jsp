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
<%--     <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css"> --%>
    
    <!-- chat -->
<%--     <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/chat/chat.css"> --%>
    
    <!-- 프리랜서 Theme CSS -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet"> --%>
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet"> --%>
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/memo.css" rel="stylesheet"> --%>
    
	<!-- 제이쿼리 , Bootstrap css-->
<!-- 	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"> -->
<!-- 	<link href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel = "stylesheet"> -->
	
	<!-- 제이쿼리, 부트스트랩 js -->
<!-- 	<script src="http://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- 	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- 	<script src ="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script> 이것 때문에 모달이 안된다. -->

    <!-- Custom Fonts -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> --%>
<!--     <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"> -->
<!--     <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css"> -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/sub.css" rel="stylesheet" type="text/css" /> --%>
	
	<!-- 로긴 css -->
<%-- 	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/main/login.css"> --%>
	<%@include file="/WEB-INF/jsp/common/topInclude.jsp"%>
	<style>
	
		.main{
		    margin-top: 50px;
		}
		
		.main-content {
		/*    background-color:#009edf;*/
		    border: 2px solid #009edf;
		    margin: 0 auto;
		    max-width: 500px;
		    padding: 20px 40px;
		    color: black;
		    text-shadow: none;
		    text-align: center;
		}
		
		.input-group{
			margin: 20px 0px;
		}
		.input-group-addon {
		    color: #009edf ;
		    font-size: 17px;
		}
		.login-button{
		    margin: 0px auto;
		    max-width: 200px;;
		}
		
		.form-header{
		    max-width: 500px;
		    margin: 0 auto;
		    background-color: #009edf;
		    color: #fff;
		    width: 100% ;
		    padding: 20px 0px;
		    border-top-right-radius:10px ;
		    border-top-left-radius:10px 
		}
		
		.form-header button {
			color:black;
		}
		
	
	</style>
		
</head>

<body id="page-top" class="index">

<%-- <div class="container" style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100%'> --%>
<div class="container" style="background-color: rgba(137, 183, 136, 0.03);">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
 	<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>  

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container" style="padding-right:40px;">
               <br><br>
               <div class="page-title-breadcrumb option-demo">
                   <div class="page-header">
                       <div class="page-title mrm">
                            <button id="budgetManagement" type="button" style='width:500px;text-align:center;margin-left: 54%;'> 지출 관리 </button>
                       </div>
                   </div>
               </div>

				   <div class="row main" style='width:30%;text-align: center;display:none;margin-left: 33%;'>
					       <div class="form-header">
					          <h1 class="text-center ">지출 한도 관리</h1>
					          	<button id="set" class="btn">설정</button>
								<button id="noSet" class="btn">미설정</button>
					        </div>
					        
						    <div class="main-content" id="managementDiv">
						             <h4><b>이번 달</b></h4>
						             <input type="text" style="font-weight: bold;text-align: center;" id="expensePlanDate" readonly />
						          	 <br>
						          	 <h4><b>목표 지출 한도</b></h4>
						         	 <input type="text" style="width: 193px;font-weight: bold;text-align: center;" id="expenseGoal"/> 
						         	 <br><br>
						        
						          <div class="form-group ">
						              <a href="#" type="button" id="registerPlan"  class="btn btn-danger btn-lg btn-block login-button">등록</a>
						          </div>
						    </div>
			          <br><br>   
				  </div>
                             
                           	
               	<div class="page-title-breadcrumb option-demo">
                         <div class="page-header">
                             <div class="page-title mrm">
                                  <button type="button" id="getBook" style='width:500px;text-align:center;margin-left: 54%;'>엑셀로 가계부 받기</button>
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
	
    <!-- 메모 js -->
	<script src="${pageContext.request.contextPath}/web/js/memo/memo.js"></script>

</div>	
</body>

</html>
