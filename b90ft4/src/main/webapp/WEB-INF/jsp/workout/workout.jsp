<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Cog + I</title>
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
	<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/main/main.do">Cog + I</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                 <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    
                    <!-- 
                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/main/leaderBoard.do">리더보드</a>
                    </li>
                     -->
                        
                    <!-- 드롭 다운 테스트 -->
                    <li class = "dropdown">
                    
					      <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">
					          가계부 <span class = "caret"></span>
					      </a>
					      <ul class = "dropdown-menu">
					         <li><a href = "budget.do">지출/수입</a></li>
					         <li><a href = "loanDept.do">대입금/차입금</a></li>
					         <li><a href = "setting.do">설정</a></li>
					      </ul>
					      
				   </li>
                    <!-- 드롭 다운 테스트  -->
                        
                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/diary/list.do">다이어리</a>
                    </li>
                    
                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/schedule/scheduleList.do">스케쥴러</a>
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
                    
                     <li>
		                <span>
<!-- 							<button id="addMemo" style="text-align: center !important;background-color: #cebc21;"> -->
							<a id="addMemo">
							<img src="${pageContext.request.contextPath}/web/image/memo/Notes-icon.png" height="30px"/>
							</a>
						</span><br>
	             	   <input type="checkbox" id="showAndHideMemo" name='memoOpt' value='1' checked style="width:15px;height:15px;"/>
					   <label for='showAndHideMemo' style="color:white;">메모 보기</label>

	                </li>
                    
                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

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
	
</div>   

<script id="workoutList" type="text/x-handlebars-template">

	<div id="sum_box" class="row mbl">
	<!-- 운동 리스트 호출 -->

		{{#list}} 
			<div class="col-sm-6 col-md-3">
				<div class="panel task db mbm">
					<div class="panel-body" onclick="workoutMove({{workoutNo}})">
						<%-- <div class="panel-body" onclick="workoutMove(${l.workoutNo},'${l.workoutType}')"> --%>
						<p class="icon">
							<i class="icon fa fa-signal"></i>
						</p>
						<h4 class="value">
							<span>215</span>
						</h4>
						<p class="description">{{workoutId}} 운동타입 - {{workoutType}}</p>
						<div class="progress progress-sm mbn">
							<div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;" class="progress-bar progress-bar-danger">
								<span class="sr-only">70% Complete (success)</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		{{/list}} 
	</div>
	<div id="workoutMainButtons">
		<button class='btn btn-primary' id="workoutUpdateBtn" hidden>운동 편집</button>
 		
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
            <div id="setContainer">
				<ul class="pagination pagination-lg mtm mbm" id="setUl">
					<!-- 굳이 여기다 횟수 표시해줄 필요 없다. 자바에서 갯수 반환해서 새로운 div에 띄워주면 그만임. 깊게 고민하지 마라-->
					{{#setList}}						
						{{#isZero}}
						<!--	<li id="setNo{{counter @index}}" onclick="workoutTypeLoad({{workoutSetNo}},{{workoutNo}},{{typeACount}},{{typeBTime}},{{spentCal}},{{intervalTime}},{{@last}},{{counter @index}})"><a> {{counter @index}} 세트<br> {{@last}}/0/{{typeACount}}회</a></li> -->
							<li id="setNo{{counter @index}}" onclick="workoutTypeLoad({{workoutSetNo}},{{workoutNo}},{{typeACount}},{{typeBTime}},{{spentCal}},{{intervalTime}},{{@last}},{{counter @index}})"><a> {{counter @index}} 세트<br>{{typeACount}}회</a></li>
						{{else}}
						<!--	<li id="setNo{{counter @index}}" onclick="workoutTypeLoad({{workoutSetNo}},{{workoutNo}},{{typeACount}},{{typeBTime}},{{spentCal}},{{intervalTime}},{{@last}},{{counter @index}})"><a> {{counter @index}} 세트<br> {{@last}}/0/{{typeBTime}}초</a></li> -->
							<li id="setNo{{counter @index}}" onclick="workoutTypeLoad({{workoutSetNo}},{{workoutNo}},{{typeACount}},{{typeBTime}},{{spentCal}},{{intervalTime}},{{@last}},{{counter @index}})"><a> {{counter @index}} 세트<br>{{typeBTime}}초</a></li>
						{{/isZero}}
					{{/setList}}
					<li><a id="currentSet">현재 세트 :</a></li>
				</ul>
            </div>
		<!-- 운동 내용 호출 -->
			<div id="typeContainer">

			</div>
			<div>
				<div class="buttons">
					<button id="setEndBtn" class='btn btn-primary' onclick="endWorkout()">운동 끝내기</button>
					<!-- <button id="viewChartBtn" class='btn btn-primary' >차트보기</button> --> 
				</div>
					<br>
					<br>
					<br>
			</div>

</script>

    <script src="${pageContext.request.contextPath}/web/js/workout/workout.js"></script>
</body>
</html>