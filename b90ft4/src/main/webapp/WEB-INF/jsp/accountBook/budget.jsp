<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

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
	
	<!-- 막대 그래프. -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/jquery.jqplot.min.css">


	<style>
	.jqplot-axis {
		font-size: 13px;
		font-weight: 900;
	}
	</style>

	<script src="http://192.168.0.60:10001/socket.io/socket.io.js"></script>
	
</head>

<body id="page-top" class="index">

<div class="container" style="background-color: rgba(137, 183, 136, 0.03);">

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
					          가계부  <span class = "caret"></span>
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
	               
	                <!-- 채팅 아이콘 -->
                    <li id="topbar-chat" class="hidden-xs">
	                    <a href="javascript:void(0)" data-step="4" data-intro="&lt;b&gt;Form chat&lt;/b&gt; keep you connecting with other coworker" data-position="left" class="btn-chat">
	                   		 <i class="fa fa-comments"></i>
	                    </a>
                    </li>
                    
                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

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
<!-- 	                            <li id="month"><a href="#other-tab" data-toggle="tab">달</a></li> -->
	                        
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
										   				
									   				  <div class="col-md-3">
														   <div id="expenseDiv" style='width:100%;height:200px;'>			                       
									                       </div>
											   		  </div>
	
											   		  <div class="col-md-3">
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
						        	<h4><b>이번 달 지출 한도</b></h4>
						        	<span style="display: block;"></span>
						        	<h4><b>이번 달 현재 총 지출</b></h4>
						        	<span style="display: block;"></span>
						        	<h4><b>잔여 지출 한도</b></h4>
						        	<span style="display: block;"></span>
					          </div>
					          
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
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
    
    
    
</div>  <!-- container div  끝 -->
	
	 <!--BEGIN CHAT FORM-->
     <div id="chat-form" class="fixed">
         <div class="chat-inner">
            
             <h2 class="chat-header">
                 <a href="javascript:;" class="chat-form-close pull-right" style="text-decoration: none;">
<!-- 	                 <i class="glyphicon glyphicon-remove"> -->
<!-- 	                 </i> -->
<!-- 	                 <span class="glyphicons glyphicons-log-in"></span> -->
	                     닫기
                 </a>
                 <i class="fa fa-user"></i>&nbsp; 친구 목록 &nbsp;</h2>
            
            
             <div id="group-1" class="chat-group">
             </div>
             
             <div id="group-2" class="chat-group">
             </div>
             
             <div id="group-3" class="chat-group">
                 <strong style="color: yellow;font-size:20px;">친구 찾기</strong>
                 <input  style="margin-left: 30px;margin-bottom: 5px;" type="text" id="friend" /><br>
                 <button style="margin-left: 30px;" id="addFriend" type = "button" class = "btn btn-info">친구 추가</button>
             </div>
             
             
             <div id="group-4" class="chat-group" style="margin-left: 30px;">
             	<br><br>
				<ul class = "list-group" style="width: 200px;">
				   <li class = "list-group-item active" style="text-align: center;">자기 관리 순위</li>
				  
				   <li class = "list-group-item">	
				   		<span class="badge badge-danger pull-left">1</span>
	            		&nbsp;&nbsp; admin
	  			      <span class = "badge"><a href="javascript:addFriend('admin');">친구 추가</a></span>
				   </li>
				  
				   <li class = "list-group-item">
				   		<span class="badge badge-warning pull-left">2</span>
				   		&nbsp;&nbsp;durad han
				      <span class = "badge"><a href="javascript:addFriend('durad han');">친구 추가</a></span>
				   </li>
				   
				   <li class = "list-group-item">
					    <span class="badge badge-info pull-left">3</span>
					    &nbsp;&nbsp;손광석
				      <span class = "badge"><a href="javascript:addFriend('손광석');">친구 추가</a></span>
				   </li>
				   
				   <li class = "list-group-item">
				   	    <span class="badge badge-danger pull-left">4</span>
				   	    &nbsp;&nbsp;한선재
				        <span class = "badge"><a href="javascript:addFriend('한선재');">친구 추가</a></span>
				   </li>
				   
				   <li class = "list-group-item">
				      <span class="badge badge-info pull-left">5</span>
				      &nbsp;&nbsp;김현영
				      <span class = "badge"><a href="javascript:addFriend('김현영');">친구 추가</a></span>
				   </li>
				</ul>      
			</div>
             
         </div>
       
         <div id="chat-box" style="top: 400px">
            
             <div class="chat-box-header">
                 <a href="#" class="chat-box-close pull-right" style="text-decoration: none;">
<!-- 	                 <i class="glyphicon glyphicon-remove"> -->
<!-- 	                 </i> -->
                 	 	닫기
                 </a>
                 <span class="user-status is-online"></span>
                 <span class="display-name">
                 Willard Mckenzie
                 </span> 
                 <small>Online</small>
             </div>
            
             <div class="chat-content">
                 <ul class="chat-box-body">
                     <li>
                         <p>
                             <img src="${pageContext.request.contextPath}/web/image/accountBook/팬더.jpg" class="avt" /><span class="user">John Doe</span><span
                                 class="time">09:33</span></p>
                         <p>
                             Hi Swlabs, we have some comments for you.</p>
                     </li>
                     <li class="odd">
                         <p>
                             <img src="${pageContext.request.contextPath}/web/image/accountBook/팬더.jpg" class="avt" /><span class="user">Swlabs</span><span
                                 class="time">09:33</span></p>
                         <p>
                             Hi, we're listening you...</p>
                     </li>
                 </ul>
             </div>
            
            <div class="chat-textarea">
                 <input placeholder="Type your message" class="form-control" />
            </div>
            
         </div>
         
         
     </div>
     <!--END CHAT FORM-->




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
	
    <script src="${pageContext.request.contextPath}/web/js/accountbook/budget.js"></script>
    
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
	
	<!-- 채팅 js -->
	<script>
		var myId = "김현영";
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

</body>

</html>
