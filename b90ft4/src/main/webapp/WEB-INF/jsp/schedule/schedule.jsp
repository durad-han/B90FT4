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
    
<c:import url ="/WEB-INF/jsp/common/topInclude.jsp"/>
</head>

<body id="page-top" class="index">

<div class="container">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" >
        <div class="container">
        <br><br><br><br><br><br><br><br>
		<div class="row">
		
			<div class="col-lg-12">
        		<ul id="generalTab" class="nav nav-tabs responsive" style="width: 80%;">
                    <li id="listTab" class="active"><a href="#list-tab" data-toggle="tab"><i class="fa fa-list" style="font-size:24px"></i> 목록으로 보기</a></li>
                    <li id="calendarTab"><a href="#calendar-tab" data-toggle="tab"><i class="fa fa-calendar" style="font-size:24px"></i> 달력으로 보기</a></li>
                </ul>
			</div>
		<div class="row">
			<div class="col-lg-12">
			<div id="generalTabContent" class="tab-content responsive">
            	<div id="list-tab" class="tab-pane fade in active" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green">
             		<div class="panel-heading">${user.userId}님의 스케줄 목록입니다</div>
                	<div class="panel-body">
                	
			<!-- 		왼쪽 리스트  -->
						<div class="col-lg-4">
						
						<div class="side-scroll">
	
				<ul class="sList__list">
					<c:forEach var="schedules" items='${scheduleMap["scheduleList"]}'>
					<li class="sList__item sList__item--orange" id="month ${fn: substring(schedules.start,0,2)}">
					
						<div class="sList__info">
							<div class="sList__contents">
								<p class="start"><c:out value='${schedules.start}'/></p>
								<p class="end"><small><c:out value='${schedules.end}'/></small></p>
								<br>
								<p class="title"><c:out value='${schedules.title }'/></p>
							</div>
							<div class="sList__options">
								<p class="achieve"><c:out value='${schedules.scheduleNo }'/>번</p>
								<input type="hidden" id="sNo" value="${schedules.scheduleNo }">
							</div>
						</div>
					</li>
					</c:forEach>
					<c:if test='${empty scheduleMap["scheduleList"]}'>
					<li class="sList__item sList__item--orange">
					
						<div class="sList__info">
							<div class="info-sch">
								<p class="info-sch__date">0</p>

								<p class="info-sch__title"><small>아직 없어</small><br>텅 비었어</p>

							</div>
							<div class="info-place">0</div>
						</div>
					</li>
					</c:if>
				</ul>
							</div>
						</div>
						
			<!-- 		오른쪽 인풋/디테일  -->
						<div class="col-lg-8">
						
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
			    <div class="panel panel-yellow">
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
    
<c:import url ="/WEB-INF/jsp/common/bottomInclude.jsp"/>
<c:import url ="/WEB-INF/jsp/schedule/scheduleInclude.jsp"/>
</div>

</body>

</html>
