+<%@ page contentType="text/html; charset=UTF-8"
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
	<%@include file ="/WEB-INF/jsp/common/topInclude.jsp"%>
</head>

<body id="page-top" class="index">

<%-- <div class="container" style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100%'> --%>
<div class="container">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
   
   <%@include file ="/WEB-INF/jsp/common/menuInclude.jsp"%>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">      
			<br>
			
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-yellow">
						<div class="panel-heading">칼로리 계산</div>
						     
						<!-- 차트 -->
						<div style = "height:30px;"></div>
						<div style= "width: 60%; margin:0 auto;">
							<div id="calChart" style="width: 100%; height:300px;"></div>
						</div>
					</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">오늘 섭취 칼로리 입력</div>
						
<!-- 						<input id='setConsumeCal' type='text'>kcal<br> -->
<!-- 						내 칼로리 <button id='callIntakeCalBtn' onclick='callIntakeCal()' class="btn btn-info">받아오기</button><br> -->
<!-- 						<hr style ="color : blue;"> -->
<!-- 						칼로리 검색 : <input id='setFood' type='text'  placeholder='음식명을 입력하세요.'><br> -->
<!-- 						<div id ='foodListContainer' style ="float:left; overflow-y:auto;overflow-x:hidden;background-color:white;width:49%;height:140px;"> -->
<!-- 						검색 결과:<br> -->
<!-- 						<table id ='foodTable'> -->
<!-- 						</table> -->
<!-- 						</div> -->
						
<!-- 						<div id ='foodSelectedListContainer' style = "float:right; overflow-y:auto;overflow-x:hidden;background-color:white;width:49%;height:140px;"> -->
<!-- 						선택한 음식:<br> -->
						
<!-- 						<table id ='foodSelectedTable'> -->
<!-- 						</table> -->
						<input id='setConsumeCal' type='text'>kcal<br>
						내 칼로리 <button id='callIntakeCalBtn' onclick='callIntakeCal()' class="btn btn-info">받아오기</button><br>
						<hr style ="color : blue;">
						칼로리 검색 : <input id='setFood' type='text'  placeholder='음식명을 입력하세요.'><br>
						<div id ='foodListContainer' style ="float:left; overflow-y:auto;overflow-x:hidden;background-color:white;width:49%;height:140px;">
						검색 결과:<br>
						<table id ='foodTable'>
						</table>
						</div>
						
						<div id ='foodSelectedListContainer' style = "float:right; overflow-y:auto;overflow-x:hidden;background-color:white;width:49%;height:140px;">
						선택한 음식:<br>
						
						<table id ='foodSelectedTable'>
						</table>
						
						</div>
			     	</div>
			     	<br><br>
				</div>
				
				<div class="col-md-6">
					<div class="row">
					<div class="col-md-12">
						<div class="panel panel-yellow" style="width: 100%; align : right">
							<div class="panel-heading">오늘 소비 칼로리 입력</div>
							<input id='setSpendCal'type='text'>kcal<br>
							오늘 한 운동 <button id='callSpentCalBtn' onclick='callSpentCal()' class="btn btn-info">받아오기</button>
							<button id='saveCalBtn' onclick='saveCal()'class="btn btn-success">칼로리 저장</button><br>
							<hr color : "000000">
							내 기초대사량 <button onclick = 'showBM()'class="btn btn-info">불러오기</button>
							<button onclick = 'showBMContainer()'class="btn btn-warning">계산하기</button><br>
				     	</div>
				     </div>
				     </div>

						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-yellow" id='BMContainer'>
							<div class="panel-heading">내 정보</div>
				     	<br>
							키:    <input class='BMSet' id='setUserHeight' type='text'>cm<br>
							몸무게: <input class='BMSet' id='setUserWeight' type='text'>kg<br>
							나이:   <input class='BMSet' id='setUserAge' type='text'>세<br>
							성별:<input type="radio" name="gender" id="genderMale" value="male" checked> 남 
								<input type="radio" name="gender" id="genderFemale" value="female"> 여<br>
						<br>
							내 정보<button id='callBMBtn' onclick = 'callBM()'class="btn btn-info">불러오기</button>
							<button id='saveBMBtn' onclick = 'saveBM()'class="btn btn-success">저장</button>
							<button id='deleteBMBtn' onclick = 'deleteBM()'class="btn btn-danger">삭제</button><br>	
						<br>
							기초대사량:<input id ='BMView' type='text'>kcal<br><br>
							<button id='setBMBtn' onclick = 'setBM()'class="btn btn-success">오늘 소비 칼로리에 적용</button>
							<button id='hideBMContainerBtn' onclick = 'hideBMContainer()'class="btn btn-warning">닫기</button><br>
						</div>
				
					
					</div>
					</div>
					
				     
				</div>
			</div>
			
<!--      	<div class="row"> -->
<!-- 		   <div class="col-md-3 col-md-offset-6"> -->
		     	
<!-- 			</div> -->
<!-- 		</div> -->

	</div>

<!-- <div id='BMContainer' hidden="true"> -->


<a id = "userIdTag" hidden>${user.userId}</a>
		
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
