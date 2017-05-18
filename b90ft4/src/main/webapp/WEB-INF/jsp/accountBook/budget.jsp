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

    <title>COG + I - 가계부</title>
    
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
	
	<!-- 막대 그래프. -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/jquery.jqplot.min.css">
	
	<!-- 로긴 css -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/main/login.css">

	<style>
	.jqplot-axis {
		font-size: 13px;
		font-weight: 900;
	}
	</style>

<!-- 	<script src="http://192.168.0.60:10001/socket.io/socket.io.js"></script> -->
	
</head>
<body id="page-top" class="index">

<div class="container" style="background-color: rgba(137, 183, 136, 0.03);">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

	<!-- 네비게이션 -->
	<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container" style="padding-right:40px;">
			<br><br>
			
			<div class="row">
			   
			   <div class="col-md-9">
					<div class="row">
                		<div class="col-md-12">
	                		<ul id="generalTab" class="nav nav-tabs responsive" style="width: 50%;">
	                            <li id="expenseTab" class="active"><a href="#expense-tab" data-toggle="tab">지출</a></li>
	                            <li id="incomeTab"><a href="#income-tab" data-toggle="tab">수입</a></li>
	                        </ul>
	                    </div>   
					</div>			        
					
					<div class="row">
                		<div class="col-md-12">
                		<h3> 
	                		<!-- 날짜 표시 -->
					        <input type="text" id="actualDate" class = "form-control" readonly>
				            
				            <a class="prev" id="prev" href="#">
				            	<i class="icon-angle-left"></i>
				            </a>
				            
				        	<a class="next" id="next" href="#">
				        		<i class="icon-angle-right"></i>
				        	</a>
                		</h3>
                		<br><br>
                		</div>   
					</div>			        
                	<div class="row">
                		<div class="col-md-12">
                		
                			<div id="generalTabContent" class="tab-content responsive">
									
			                        <div id="expense-tab" class="tab-pane fade in active" style="min-height:200px;overflow: auto;">
										  <div class="panel panel-green" id="expenseTable">
						                   		   
						                   		   <div class="panel-heading">지출</div>
						                           <div class="panel-body">
						                                <table class="table table-hover-color">
						                                    <thead>
							                                    <tr id="expenseColumn">
							                                        <th id="expenseCtgy">
																		분류
							                                        </th>
							                                        <th class="content">내용</th>
							                                        <th class="amount">금액</th>
							                                    </tr>
						                                    </thead>
						                                    <tbody id="expense">
						                                    </tbody>
						                                </table>
						                            </div>
						                   </div>
			                 	     </div>
			                			
			                				
	                            	  <div id="income-tab" class="tab-pane fade" style="min-height:200px;overflow: auto;">
										   <div class="panel panel-yellow" id="incomeTable">
						                            <div class="panel-heading">수입</div>
						                            <div class="panel-body">
						                                <table class="table table-hover-color">
						                                    <thead>
						                                    <tr id="incomeColumn">
						                                        <th id="incomeCtgy">분류</th>
						                                        <th class='content'>내용</th>
						                                        <th class='amount'>금액</th>
						                                    </tr>
						                                    </thead>
						                                    <tbody id="income">
						                                    </tbody>
						                                </table>
						                            </div>
						                   </div>
	                			      </div>
	                			      
	                			      <div id="month-tab" class="tab-pane fade" style="background:white;min-height:200px;min-width:1130px;">
										   
											  <div class="row">
										   				
									   				  <div class="col-md-3" id="expensePie">
														   <div id="expenseDiv" style='width:100%;height:200px;'>			                       
									                       </div>
											   		  </div>
	
											   		  <div class="col-md-3" id="incomePie">
									                	   <div id="incomeDiv" style="width:100%;height:200px;">			                       
								                	       </div>
											   		  </div>
										   			
										        
											  		  <div id="monthBudgteTable" style="display: none;">
													            <h4 class="box-heading">월별 지출/수입 현황</h4>
										                        
										                        <div class="col-md-3">
											                         <div class="panel panel-red" style="width:100%;">
													                        	<div class="panel-heading">지출</div>
													                            <div class="panel-body">
													                                <table class="table table-hover table-bordered">
													                                    <thead>
													                                    <tr>
													                                        <th>분류</th>
													                                        <th>합계</th>
													                                    </tr>
													                                    </thead>
													                                    <tbody id="monthExpense">
													                                    </tbody>
													                                </table>
												                            </div>
									                        		 </div>
								                        		 </div>
								                        		 
								                        		 
								                         		<div class="col-md-3">
									                                 <div class="panel panel-blue" style="background:#FFF;width:100%;">
											                           		<div class="panel-heading">수입</div>
												                            <div class="panel-body">
												                                <table class="table table-hover table-bordered">
												                                    <thead>
												                                    <tr>
												                                        <th>분류</th>
												                                        <th>합계</th>
												                                    </tr>
												                                    </thead>
												                                    <tbody id="monthIncome">
												                                    </tbody>
												                                </table>
												                            </div>
												     		   		 </div>
											     		   		</div>
											 		 </div> 
					   					   </div>	
					   					   
					   					   <div id="row">
					   					   	  <div id="col-md-12">
						   						 <hr>
						   						   
											   	 <ul id="generalTab" class="nav nav-tabs responsive" style="width: 50%;">
	                        
						                            <li id=expenseTotal class='active'><a href="#monthExpense-tab" data-toggle="tab">지출</a></li>
						                            <li><a href="#monthIncome-tab" data-toggle="tab">수입</a></li>
						                        
						                        </ul>
						                        
						                        <div id="generalTabContent" class="tab-content responsive">
												   
												     <div id="monthExpense-tab" class="tab-pane fade" style="height:500px;overflow: auto;">   
														  <br><br>
														  <div class="panel panel-violet">
										                             <div class="panel-heading" id="monthExpenseTable">월 지출 내역</div>
										                             <div class="panel-body">
										                                <table class="table table-hover-color">
										                                
										                                    <thead>
											                                    <tr>
											                                    	<th style="text-align: center;width:20%">날짜</th>
											                                        <th style="text-align: center;width:10%" class="expenseCtgy">분류</th>
											                                        <th style="text-align: center;width:45%">내용</th>
											                                        <th style="text-align: center;width:25%">금액</th>
											                                    </tr>
										                                    </thead>
										                                    
										                                    <tbody>
										                                    
										                                    </tbody>
										                                    
										                                </table>
										                            </div>
								                          </div>			
							                          </div>
						                          
							                           <div id="monthIncome-tab" class="tab-pane fade" style="height:500px;overflow: auto;">   
														  <br><br>
															  <div class="panel panel-violet">
											                             <div class="panel-heading" id="monthIncomeTable">월 수입 내역</div>
											                             <div class="panel-body">
											                                <table class="table table-hover-color">
											                                
											                                    <thead>
												                                    <tr>
												                                    	<th style="text-align: center;width:20%">날짜</th>
												                                        <th style="text-align: center;width:10%" class="incomeCtgy">분류</th>
												                                        <th style="text-align: center;width:45%">내용</th>
												                                        <th style="text-align: center;width:25%">금액</th>
												                                    </tr>
											                                    </thead>
											                                    
											                                    <tbody>
											                                    
											                                    </tbody>
											                                    
											                                </table>
											                            </div>
									                          </div>			
							                            </div>
						                            
						                          </div> 
												   
					   					   	  </div>
					   					   	
					   					   </div>
				                	       
	                			      </div>
	                			      
                			</div>
                		
                		</div>   
                		
					</div>		
			   </div>
				
			   <div class="col-md-3">
			   
			   		<div class="row">
			   		  	 <div class="col-md-12">
			   		  	 
							<!-- 데이트 피커 -->
							 <ul id="generalTab" class="nav nav-tabs responsive">
		                           <li class="active" id="day"><a href="#1" data-toggle="tab">일</a></li>
		                           <li id="week"><a href="#1" data-toggle="tab" >주</a></li>
		                           <li id="month"><a href="#month-tab" data-toggle="tab">달</a></li>
		                     </ul>
							  <div id="datepicker"></div><br>
		                	 
		                	  <button id="budgetModal" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
					                 		 지출/수입 등록
					          </button>
				        	  
				        	  <br><br>
				        	  
				        	  <div id="budgetPlanDiv">
						        	<h4><b><span> </span> 지출 한도</b></h4>
						        	<span style="display: block;"></span>
						        	<h4><b>현재 총 지출</b></h4>
						        	<span style="display: block;"></span>
						        	<h4><b>잔여 지출 한도</b></h4>
						        	<span style="display: block;"></span>
					          </div>

					          <script>
					          		var month = new Date().getMonth()+1;
									$("#budgetPlanDiv > h4 > b").children("span").html(month+"월 달");
					          </script>

					          <div id="occupancyRatio" style="width: 100px; height:300px;position: relative;top:-270px;left:163px;">
					          </div>
				        	
						 </div>	
			   		</div>
			   		
			   </div>
			   
			</div>
			
			
        </div>
        
    </section>
	
   				<!-- 입력 모달 시작 -->
   				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">지출/수입 등록</h4>
										</div>
										<div class="modal-body">
											<form name="budgetF">
			                                        <div class="form-group"><label class="col-sm-3 control-label">종류</label>
		                                                <div class="col-sm-9 controls">
		                                                    <div class="row">
		                                                        <div class="col-xs-9">
		                                                            <div class="radio"><label class="radio-inline"><input type="radio" value="0" name="budgetCode" checked="checked"/>&nbsp;
		                                                               	 지출</label><label class="radio-inline"><input type="radio" value="1" name="budgetCode"/>&nbsp;
		                                                                                 수입</label></div>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
											 		<div class="form-group"><label class="col-sm-3 control-label">분류</label>
		                                              	<div class="col-sm-9 controls">
		                                                  	<div class="row">
		                                                    	  <div class="col-xs-4">
		                                                     	  	<select class="form-control">
		                                                     	  	</select>
		                                                    	 	</div>
		                                                  	 </div>
		                                              	 </div>
			                                    	 </div>
			                                         <div class="form-group"><label class="col-sm-3 control-label">금액</label>
		                                                 <div class="col-sm-9 controls">
		                                                     <div class="row">
		                                                      	    <div class="col-xs-9"><input type="text" class="form-control"/></div>
		                                                      </div>
		                                               </div>
			                                         </div>
			                                         <div class="form-group"><label class="col-sm-3 control-label">내용</label>
			                                               <div class="col-sm-9 controls">
			                                                   <div class="row">
			                                                       <div class="col-xs-9"><input type="text" class="form-control"/></div>
			                                                   </div>
			                                           	   </div>
			                                         </div>
			                                         <input type="hidden" />
			                                </form>
											<br><br><br><br><br><br><br>
			                      	   </div>
									<div class="modal-footer">
										<button type="button" id="updateBudget" class="btn btn-success btn-simple" style = "display:none;">수정</button>
										<button type="button" id="deleteBudget" class="btn btn-danger btn-simple" style = "display:none;" data-dismiss="modal">삭제</button>
										
										<button type="button" id="budgetRegi"   class="btn btn-success btn-simple">등록</button>
										<button type="button" id="closeF" 	    class="btn btn-danger btn-simple" data-dismiss="modal">닫기</button>
									</div>
								</div>
						</div>
				</div>
				<br><br><br><br><br><br><br><br><br> 
				<!-- 모달 끝 -->
				

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div id="last" class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
</div>  <!-- container div  끝 -->

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/contact_me.js"></script>

    <!-- 차트 js -->
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
	
	<script src="${pageContext.request.contextPath}/web/js/memo/memo.js"></script>
	
	<script src="${pageContext.request.contextPath}/web/js/accountbook/barChart.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/accountbook/jquery.jqplot.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/accountbook/jqplot.barRenderer.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/accountbook/jqplot.categoryAxisRenderer.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/accountbook/jqplot.pointLabels.js"></script>
	
    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/freelancer.min.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>
	
    <script src="${pageContext.request.contextPath}/web/js/accountbook/budget.js"></script>
    
	<!-- 채팅 js -->
	<script>
// 		var myId = "김현영";
// 		if('${user.userId}'){
// 			myId = '${user.userId}';
// 		}
// 		console.log(myId);
    </script>
<%-- 	<script src="${pageContext.request.contextPath}/web/js/chat/chat.js"></script> --%>

	<!-- 채팅 네비게이션에 꼭 필요. -->
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/jquery.metisMenu.js"></script>  --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/jquery.slimscroll.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/jquery.cookie.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/icheck.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Light/script/main.js"></script> --%>

</body>

</html>
