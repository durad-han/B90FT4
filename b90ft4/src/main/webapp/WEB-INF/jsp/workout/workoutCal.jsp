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

    <title>Cog + I</title>
    <!-- Bootstrap Core CSS -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css">
	<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
    <!-- Theme CSS -->
    
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  	

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
                	
     <div>
<h2>오늘 섭취 칼로리 입력</h2>
칼로리 검색 : <input id='setFood' type='text'><br>
<select id ='foodList'></select>
<select id ='foodCal'></select>
<select id ='foodOtherInfo'></select>

<button id='callIntakeCalBtn' onclick='callIntakeCal()'>오늘 운동 전에 먹은 음식에서 받아오기</button><br>
<input id='setConsumeCal' type='text'>kcal<br>
<h2>오늘 소비 칼로리 입력(기초대사량은 제외)</h2>
<button onclick = 'showBMContainer()'>기초대사량 구하기</button><button id='callSpentCalBtn' onclick='callSpentCal()'>오늘 한 운동에서 받아오기</button><br>
<input id='setSpendCal'type='text'>kcal<br>

<button id='setCalBtn' onclick='setCal()'>차트 새로고침</button><button id='saveCalBtn' onclick='saveCal()'>저장</button>
</div>
<!-- <div id='BMContainer' hidden="true"> -->
<div id='BMContainer'>
키:<input class='BMSet' id='setUserHeight' type='text'>cm<br>
몸무게:<input class='BMSet' id='setUserWeight' type='text'>kg<br>
나이:<input class='BMSet' id='setUserAge' type='text'>세<br>
성별:<input type="radio" name="gender" id="genderMale" value="male" checked> 남 
	<input type="radio" name="gender" id="genderFemale" value="female"> 여<br>
기초대사량:<input id ='BMView' type='text'><br>
<!-- 
<button id='calculateBMBtn' onclick = 'calculateBM()'>기초대사량 계산</button>
 -->
<button id='setBMBtn' onclick = 'setBM()'>오늘 소비 칼로리에 적용</button>
<button id='hideBMContainerBtn' onclick = 'hideBMContainer()'>닫기</button>
<button id='callBMBtn' onclick = 'callBM()'>내 정보 불러오기</button>
<button id='saveBMBtn' onclick = 'saveBM()'>내 정보에 저장</button>
<button id='deleteBMBtn' onclick = 'deleteBM()'>내 정보 삭제</button>
</div>
<div class='caption'>칼로리 계산</div>
<div id="calChart" style="width: 50%; height:300px;"></div>
		
</div>
</section>
    

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
    
 <%--    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/jquery/jquery.min.js"></script>

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
	 --%>
<%-- 
    <!-- 차트 js -->
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
--%>
</div>

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
-->
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/b90ft4/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
<script src="/b90ft4/web/js/workout/jquery.jqplot.js"></script>
<script src="/b90ft4/web/js/workout/jqplot.barRenderer.js"></script>
<script src="/b90ft4/web/js/workout/jqplot.categoryAxisRenderer.js"></script>
<script src="/b90ft4/web/js/workout/jqplot.pointLabels.js"></script>
<script src="${pageContext.request.contextPath}/web/js/workout/workoutCal.js"></script>
</body>

</html>
