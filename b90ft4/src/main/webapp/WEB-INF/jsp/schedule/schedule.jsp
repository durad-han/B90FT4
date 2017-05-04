<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css">

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
                <a class="navbar-brand" href="../main/main.do">자기 관리</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                        
                    <!-- 서브메뉴 드랍다운 -->
                    <li class = "dropdown">
                    
					      <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">
					          가계부 <span class = "caret"></span>
					      </a>
					      
					      <ul class = "dropdown-menu">
					         <li><a href = "#">지출/수입</a></li>
					         <li><a href = "#">대입금/차입금</a></li>
					         <li><a href = "#">설정</a></li>
					      </ul>
					      
				   </li>
                        
                    <li class="page-scroll">
                        <a href="#about">다이어리</a>
                    </li>
                    
                   <li class = "dropdown">
					      <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#schedule">
					          스케줄 <span class = "caret"></span>
					      </a>
					      <ul class = "dropdown-menu">
					         <li><a href = "#">리스트</a></li>
					         <li><a href = "#">달력</a></li>
					      </ul>
				   </li>
                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" >
        <div class="container">
        <br><br><br><br><br><br><br><br>
		<div class="row">
		
			<div class="col-lg-12">
        		<ul id="generalTab" class="nav nav-tabs responsive" style="width: 50%;">
                    <li id="listTab" class="active"><a href="#list-tab" data-toggle="tab">목록으로 보기</a></li>
                    <li id="calendarTab"><a href="#calendar-tab" data-toggle="tab">달력으로 보기</a></li>
                </ul>
			</div>
		<div class="row">
			<div class="col-lg-12">
			<div id="generalTabContent" class="tab-content responsive">
            	<div id="list-tab" class="tab-pane fade in active" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green" id="expenseTable">
             		<div class="panel-heading">스케줄 목록</div>
                	<div class="panel-body">
                	
			<!-- 		왼쪽 리스트  -->
						<div class="col-lg-3">
						
							<div class="side-scroll">
								<section id="cd-timeline" class="timeline-container">
								
								<c:forEach var="schedules" items='${scheduleMap["scheduleList"]}'>
										<div class="cd-timeline-block">
											<div class="cd-timeline-img cd-picture">
												<i class="fa fa-edit fa-fw">
									            </i>
								<!-- 				<img src="/webapp/web/css/schedule/img/cd-icon-picture.svg" alt="Picture"> -->
											</div> <!-- cd-timeline-img -->
								
											<div class="cd-timeline-content">
												<h2><a href="javascript:goDetail(${schedules.scheduleNo});"><c:out value='${schedules.title }'/></a></h2>
												<p><a href="javascript:goDetail(${schedules.scheduleNo});"><c:out value='${schedules.content }'/></a></p>
												<a href="javascript:goDetail(${schedules.scheduleNo});" class="cd-read-more">상세</a>
												<span class="cd-date"><c:out value='${schedules.start}'/></span>
											</div> <!-- cd-timeline-content -->
										</div> <!-- cd-timeline-block -->
								</c:forEach>
								<c:if test='${empty scheduleMap["scheduleList"]}'>
								<div class="cd-timeline-block">
											<div class="cd-timeline-img cd-picture">
												<i class="fa fa-edit fa-fw">
									            </i>
								<!-- 				<img src="/webapp/web/css/schedule/img/cd-icon-picture.svg" alt="Picture"> -->
											</div> <!-- cd-timeline-img -->
											<div class="cd-timeline-content">
												<h2><a href="#;">스케줄이 존재하지 않습니다</a></h2>
												<p><a href="#;">스케줄을 등록하세요</a></p>
												<a href="#;" class="cd-read-more">상제</a>
												<span class="cd-date"></span>
											</div> <!-- cd-timeline-content -->
										</div> <!-- cd-timeline-block -->
								</c:if>
								
								<div class="list" id="9">content</div>  
								<div id="loading"></div>
								
								</section>
							</div>
						</div>
						
			<!-- 		오른쪽 인풋/디테일  -->
						<div class="col-lg-9">
						
							<div class="panel">
							<div class="panel-body">
							
								<!-- 이전 스케줄 링크 -->
								<div class="alert alert-success" id="prev"><strong>이전 스케줄</strong> 스케줄 링크</div>
								
					            <div class="panel panel-orange">
									<div class="panel-heading">
									    Schedule Detail</div>
									    
									<!-- 스케줄 상세 -->
									<div class="panel-body pan" id="schDetail">
									
									<!-- 스케줄 입력 폼 시작 -->
									<form name="insertSchedule" action="insertSchedule.do" onsubmit="return scheduleForm();" method="post">
									<div class="form-body pal">
								<div class="clz-insertSchedule">
									
									<div class="form-group">
									    <div class="input-icon right">
									        <i class="fa fa-user"></i>
									        <input id="inputTitle" name="title" type="text" placeholder="제목" class="form-control" />
									    </div>
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
									    <div class="input-icon right">
									        <i class="fa fa-user"></i>
									        <input id="inputContent" name="content" type="text" placeholder="내용!" class="form-control" />
									    </div>
									</div>
								</div>
									
									<div class="form-group text-center">
						                <div class="col-sm-12 controls">
						                <div class="row">
							                <div class="radio">
								                <label class="radio-inline">
								                	<input type="radio" name="schedule-type" value="default" checked="checked"><span>기본 스케줄</span>
								                </label>
								                <label class="radio-inline">
								                	<input type="radio" name="schedule-type" value="with-budget"><span>지출이 있는 스케줄</span>
								                </label>
								                <label class="radio-inline">
								                	<input type="radio" name="schedule-type" value="with-workout"><span>운동 스케줄</span>
								                </label>
							                </div>
							                
						                <div class="col-lg-12 controls">
						                <div class="row">
							    			<div class="conditional" data-cond-option="schedule-type" data-cond-value="default">
							    				<input id="inputCategory" name="category" type="hidden" value="1" class="form-control" />
							    				<span>기본 스케줄입니다</span>
										    </div>
							    			<div class="conditional" data-cond-option="schedule-type" data-cond-value="with-budget">
							    				<input id="inputCategory" name="category" type="hidden" value="2" class="form-control" />
							    				<br>
							    				<span>예산관리가 가능한 스케줄입니다</span>
							    				<br>
							    				<button data-dropdown="#dropdown-dark-with-icons">ops</button>
							    				<div class="dropdown-menu dropdown-anchor-top-left dropdown-has-anchor dark" id="dropdown-dark-with-icons">
													<ul>
														<li><a href="#"><svg>...</svg> exp </a></li>
														<li><a href="#"><svg>...</svg> inc </a></li>
														<li class="divider"></li>
														<li><a href="#"><svg>...</svg> others </a></li>
													</ul>
												</div>
							    				<br>
							    				<input id="inputBudget" name="expenseCategory" type="text" placeholder="0,000"/>
							    				<input id="inputBudget" name="expenseContent" type="text" />
							    				<input id="inputBudget" name="expenseAmount" type="text" />
							    				<br>
							    				<br>
							    				
										    </div>
							    			<div class="conditional" data-cond-option="schedule-type" data-cond-value="with-workout">
							    				<input id="inputCategory" name="category" type="hidden" value="3" class="form-control" />
							    				<span>운동 설정이 가능한 스케줄입니다</span>
							    				
										    </div>
						                </div>
						                </div>
						                </div>
						                </div>
					                </div>
									
					<!-- ============ 임시 하드코딩 ============	-->
									<div class="form-group">
									        <input id="inputUserId" name="userId" type="hidden" value="tester01" class="form-control" />
									        <input id="inputAchieve" name="achieve" type="hidden" value="1" class="form-control" />
									</div>
					<!-- ============ 임시 하드코딩============	-->
									<div class="form-group text-center">
								    	<div class="stars"></div>
									    <div class="stars-msg"></div>
									</div>
									    
									<div class="form-actions text-center pal">
										<button class="btn btn-success">추가</button>
									</div>
									</div>
									</form>
									</div>
								</div>
					
								<!-- 다음 스케줄 링크 -->
								<div class="alert alert-success" id="next"><strong>다음 스케줄</strong> 다음 스케줄 링크</div>
					 
							</div>
							</div>
						</div>
                	
                	</div>
                </div>
               	</div>
               	
               	<div id="calendar-tab" class="tab-pane fade" style="min-height:200px;overflow: auto;">
			    <div class="panel panel-yellow" id="incomeTable">
	                <div class="panel-heading">스케줄 달력</div>
	                <div class="panel-body">
	                
<!-- 	                달력 영역 -->
					<div id='calendar'></div>

	                </div>
				</div>
				</div>
               	
            </div>
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
	
    <!-- 차트 js -->
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
	<c:import url ="/WEB-INF/jsp/schedule/scheduleInclude2.jsp"/>
</div>

</body>

</html>
