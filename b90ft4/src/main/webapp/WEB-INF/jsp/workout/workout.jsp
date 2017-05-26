<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Cog + I </title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
<!-- ==================================================== workout original ==================================================== -->
	<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
	<link type='text/css' rel='stylesheet' href="/b90ft4/web/css/workout/workoutTypeA.css" />
	<script src="${pageContext.request.contextPath}/web/js/common/handlebars.min.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/workout/handlebarsHelper.js"></script>
<!-- ==================================================== workout original ==================================================== -->
  <!-- Bootstrap Core CSS -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css">
<%-- 	<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/> --%>
    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<%@include file ="/WEB-INF/jsp/common/topInclude.jsp"%>
</head>

<body id="page-top" class="index">

<%-- <div class="container" style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100%'> --%>
<div class="container">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>
<%@include file ="/WEB-INF/jsp/common/menuInclude.jsp"%>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
				<!--BEGIN CONTENT-->
				<div class="page-content">
				</div>
				<!--END CONTENT-->
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
<%-- 
    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/freelancer.min.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>
	
    <!-- 차트 js -->
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
	 --%>
</div>   
<a id = "userIdTag" hidden>${user.userId}</a>
<script id="workoutList" type="text/x-handlebars-template">

	<div id="sum_box" class="row mbl">
	<!-- 운동 리스트 호출 -->
<br>
<br>
<br>
		{{#list}} 
			<div class="col-sm-6 col-md-3">
				<div class="panel task db mbm" style = "border : solid 4px gray;">
					<div class="panel-body" onclick="workoutMove({{workoutNo}})">
						
						<h4 class="value" ">
							<span>{{workoutId}}</span>
						</h4>
						<p class="description">운동타입 - {{workoutType}}</p>
						<div class="progress progress-sm mbn" style="background-color:orange;ackground-color:orange;">
							
							</div>
						</div>
					</div>
				</div>
		{{/list}} 
	</div>
	<div id="workoutMainButtons">
			
	</div>
   
</script>

<script id="workoutForm" type="text/x-handlebars-template">

<!--BEGIN MODAL CONFIG PORTLET-->

            <div id="modal-config" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="close">
                                &times;</button>
                            <h4 class="modal-title">
                               	 세트 추가,수정,삭제</h4>
                        </div>
                        <div class="modal-body">
                            <p>
                            	김추가 이수정 박삭제                            
                                </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-default">
                                취소</button>
                            <button type="button" class="btn btn-primary">
                                저장</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--END MODAL CONFIG PORTLET-->
         <!-- 운동 세트 호출 --> 
            <div id="setContainer"  style="text-align:center">
				<div id="pointer" style="width:100px">현재 세트<br><i class="fa fa-angle-double-down fa-2x" aria-hidden="true" id="pauseRes" disabled></i></div>
				<ul class="pagination pagination-lg" id="setUl">
					<!-- 굳이 여기다 횟수 표시해줄 필요 없다. 자바에서 갯수 반환해서 새로운 div에 띄워주면 그만임. 깊게 고민하지 마라-->
					{{#setList}}						
						{{#isZero}}
							<li class = "{{@last}}Set" id="setNo{{counter @index}}" onclick="workoutTypeLoad({{workoutSetNo}},{{workoutNo}},{{typeACount}},{{typeBTime}},{{spentCal}},{{intervalTime}},{{@last}},{{counter @index}})"><a style="font-color:black;" id = "set{{counter @index}}"> {{counter @index}} 세트<br>{{typeACount}}회</a></li>
						{{else}}
							<li class = "{{@last}}Set" id="setNo{{counter @index}}" onclick="workoutTypeLoad({{workoutSetNo}},{{workoutNo}},{{typeACount}},{{typeBTime}},{{spentCal}},{{intervalTime}},{{@last}},{{counter @index}})"><a style="font-color:black;" id = "set{{counter @index}}"> {{counter @index}} 세트<br>{{typeBTime}}초</a></li>
						{{/isZero}}
					{{/setList}}
				</ul>
            </div>
		<!-- 운동 내용 호출 -->
			<div id="typeContainer">

			</div>
			<div>
				<div class="buttons">
					<button id="setEndBtn" class='btn btn-primary' onclick="javascript:clearInterval(timerId);listLoad();">운동 끝내기</button>
					<!-- <button id="viewChartBtn" class='btn btn-primary' >차트보기</button> --> 
				</div>
					<br>
					<br>
					<br>
			</div>

</script>

    <script src="${pageContext.request.contextPath}/web/js/workout/workout.js"></script>
    <%@include file ="/WEB-INF/jsp/common/bottomInclude.jsp"%>
</body>
</html>