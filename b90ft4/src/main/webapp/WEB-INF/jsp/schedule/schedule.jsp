<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Cog + I : Schedule</title>
    
<!-- 제이쿼리 -->
<script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/sub.css" rel="stylesheet" type="text/css" />

<!-- Theme CSS -->
<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath}/web/css/main/login.css" rel="stylesheet" type="text/css">

<!-- 	네이버 로그인 임시 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
<!-- 	//네이버 로그인 임시 -->

<!-- 스윗얼럿 ==================================================================================================== -->
<script src="${pageContext.request.contextPath}/web/js/common/sweetalert.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/sweetalert.css">
<!-- 스윗얼럿 ==================================================================================================== -->
<!-- 메모 -->
<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/memo.css" rel="stylesheet">
<!-- 메모 -->
<!-- 채팅 ==================================================================================================== -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/chat/chat.css">
<!-- 채팅 ==================================================================================================== -->

<!-- switch -->
<%-- <link href="${pageContext.request.contextPath}/web/bootstrap/bootstrap3/css/bootstrap.css" rel="stylesheet" /> --%>
<%-- <link href="${pageContext.request.contextPath}/web/bootstrap/assets/css/gsdk.css" rel="stylesheet" />   --%>
<%-- <link href="${pageContext.request.contextPath}/web/bootstrap/bootstrap3/css/font-awesome.css" rel="stylesheet"> --%>

<style>
.dropdown-menu > li{
	color:green !important;
	background: #9a4545 !important;
}

	img.menu {
		width:60px;
		height: 50px;
	}
	
	.nav a:hover {
		background-color: #fff !important;
		transition:1s;
	}
	
.custom-tooltip {
    display: inline-block;
    margin: 10px 20px;
    opacity: 1;
    position: relative;
}

.custom-tooltip .tooltip-inner {
	background: #0088cc;
}

.custom-tooltip.top .tooltip-arrow {
	border-top-color: #0088cc;
}
</style>
</head>

<body id="page-top" class="index">

<div class="container">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>
<script>
var getUserId = "admin";
if('${user.userId}'){
	getUserId = '${user.userId}';
}
</script>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" >
        <div class="container">
        <br><br>
		<div class="row">
		
<!-- 		상단 목록/달력 탭 -->
			<div class="col-lg-12">
        		<ul id="generalTab" class="nav nav-tabs responsive" style="width: 80%;">
                    <li id="listTab" class="active"><a href="#list-tab" data-toggle="tab"><i class="fa fa-list" style="font-size:24px"></i> 목록으로 보기</a></li>
                    <li id="calendarTab"><a href="#calendar-tab" data-toggle="tab"><i class="fa fa-calendar" style="font-size:24px"></i> 달력으로 보기</a></li>
                </ul>
			</div>
<!-- 		상단 목록/달력 탭 끝남 -->

<!-- 		메인 영역 -->
		<div class="row">
			<div class="col-lg-12">
			<div id="generalTabContent" class="tab-content responsive">

<!-- 			목록 탭 시작 -->
            	<div id="list-tab" class="tab-pane fade in active" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green">
             		<div class="panel-heading">${user.userId}님의 스케줄 목록입니다</div>
                	<div class="panel-body">
                	
			<!-- 		왼쪽 리스트  -->
					<div class="col-lg-4">
						<ul class="schedule-list__pagination schedule-list__pagination--inactive" id="schedule-list-pagination">
						</ul>
						
						<div class="side-scroll">
							<div id="sList__list"></div>
						</div>
					</div>
			<!-- 		왼쪽 리스트 끝  -->
					
			<!-- 		오른쪽 인풋/디테일  -->
						<div class="col-lg-8">
						
<!-- 						판넬 시작 -->
							<div class="panel">
							<div class="panel-body">
							
								<!-- 이전 스케줄 링크 -->
								<div class="alert alert-success" id="prev"><strong>이전 스케줄</strong> 스케줄 링크</div>
								
<!-- 							내부 디테일 판넬 -->
					            <div class="panel panel-orange">
									<div class="panel-heading">
									Schedule Detail
									</div>
									    
						<!-- 	내부 디테일 판넬 바디 -->
									<div class="panel-body pan" id="schDetail">
									
									<!-- 스케줄 입력 폼 시작 -->
									<form name="insertSchedule" action="insertSchedule.do" onsubmit="return scheduleForm();" method="post">
									<div class="form-body pal">
								<div class="clz-insertSchedule">
									
									<div class="form-group">
									        <input id="inputTitle" name="title" type="text" placeholder="제목" class="form-control" />
									</div>
									
									<div class="row">
									    <div class="col-md-6">
									        <div class="form-group">
									            <input id="inputStart" name="start" type="text" placeholder="시작 시간" value="" />
									        </div>
									    </div>
									    <div class="col-md-6">
									        <div class="form-group">
									            <input id="inputEnd" name="end" type="text" placeholder="종료 시간" value="" />
									        </div>
									    </div>
									</div>
									
									<div class="form-group">
									        <input id="inputContent" name="content" type="text" placeholder="내용" class="form-control" ></input>
									</div>
								</div>
									
									<div class="form-group text-center">
						                <div class="col-sm-12 controls">
						                <div class="row">
							                <div class="radio">
								                <label class="radio-inline">
								                	<input type="radio" name="category" value="0" checked="checked"><span>기본 스케줄</span>
								                </label>
								                <label class="radio-inline">
								                	<input type="radio" name="category" value="1"><span>지출이 있는 스케줄</span>
								                </label>
								                <label class="radio-inline">
								                	<input type="radio" name="category" value="2"><span>운동 스케줄</span>
								                </label>
							                </div>
							                
						                <div class="col-lg-12 controls">
						                <div class="row">
							    			<div class="conditional" data-cond-option="category" data-cond-value="0">
							    				<br>
							    				<span>달력에 일정을 추가합니다</span>
							    				<br><br>
							    				<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/스케쥴5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="스케쥴" />
										    </div>
							    			<div class="conditional" data-cond-option="category" data-cond-value="1">
							    				<br>
							    				<span>지출할 금액 입력이 가능한 스케줄입니다</span>
							    				<br><br>
													<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/가계부5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="가계부"/>
							    				<br><br>
							    				<input id="inputBudget" name="expenseCategory" type="text" placeholder="0,000"/>
							    				<br>
											</div>
							    				<br>
							    				
										    </div>
							    			<div class="conditional" data-cond-option="category" data-cond-value="2">
							    				<span>운동 알람을 설정합니다</span>
							    				<br><br>
													<img class="menu" src="${pageContext.request.contextPath}/web/image/menu/운동5.png" data-html="true" data-toggle="tooltip" data-placement="bottom" title="운동"/>
							    				<br><br>
							    				
										    </div>
						                </div>
						                </div>
						                </div>
						                </div>
					                </div>
									
<!-- 								임시 입력영역 -->
									<div class="form-group">
									        <input id="inputUserId" name="userId" type="hidden" value="${user.userId}" class="form-control" />
									        <input id="inputAchieve" name="achieve" type="hidden" value="0" class="form-control" />
									</div>
<!-- 								임시 입력영역 종료 -->
									
<!-- 								중요도 설정 -->
									<div class="form-group text-center">
								    	<div class="stars"></div>
									    <div class="stars-msg"></div>
									</div>
<!-- 								중요도 설정 끝 -->

<!-- 								추가버튼     -->
									<div class="form-actions text-center pal">
										<button class="btn btn-success">추가</button>
									</div>
<!-- 								추가버튼 끝   -->
									
									</form>
<!-- 								스케줄 입력 폼 종료 -->
									
									</div>
							<!-- 	내부 디테일 판넬 바디 끝 -->
									</div>
							<!-- 	내부 디테일 판넬 끝 -->
							
								<!-- 다음 스케줄 링크 -->
								<div class="alert alert-success" id="next"><strong>다음 스케줄</strong> 다음 스케줄 링크</div>
								
								</div>
								</div>
<!--                 			판넬 끝	 -->
							</div>
			<!-- 		오른쪽 인풋/디테일 영역 종료 -->
					 
						</div>

                </div>
                </div>
<!-- 			목록 탭 종료 -->
               	
<!-- 			달력 탭 시작 -->
               	<div id="calendar-tab" class="tab-pane fade" style="min-height:200px;overflow: auto;">
			    <div class="panel panel-yellow">
	                <div class="panel-heading">스케줄 달력</div>
	                <div class="panel-body">
	                
<!-- 	                달력 입력영역 -->
					<div id='calendar'></div>
					
	                </div>
	                
				</div>
				</div>
<!-- 			달력 탭 종료 -->   
            	
            </div>
           	</div>
        </div>
<!-- 	메인 영역 종료	 -->

		</div>
		</div>
    </section>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
</div>
<c:import url ="/WEB-INF/jsp/common/bottomInclude.jsp"/>
<c:import url ="/WEB-INF/jsp/schedule/scheduleInclude.jsp"/>
<script>
$(function() {
	  $('.tooltip-show').each(function() {
		  $(this).tooltip("toggle");
	  });
});
</script>
</body>

</html>
