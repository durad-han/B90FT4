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
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/common/bootstrap.min.css">

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/memo.css" rel="stylesheet">
    

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
	<script>
		console.log("하하");
	</script>

    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/sub.css" rel="stylesheet" type="text/css" />

	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/jquery.jqplot.min.css">

	<style>
	.jqplot-axis {
		font-size: 13px;
		font-weight: 900;
	}
	
	
	/* 채팅 적용 css */

div#list {
	width:200px;
 	height: 300px; 
	border: 1px solid black;
}

#showList {
	width:200px;
	height: 50px;
	border: 1px solid black;
	position: fixed;
	right:100px;
	bottom: 100px;
}

#chat {
	position: absolute;
	left: 600px;
	top:200px;
	border: 1px solid black;
}

div#test{
	position: absolute;
	border: 1px solid black;
	width: 200px;
	height: 300px;
}

/* ----------- chat css ----------- */

	.chat
	{
	    list-style: none;
	    margin: 0;
	    padding: 0;
	}
	
	.chat li
	{
	    margin-bottom: 10px;
	    padding-bottom: 5px;
	    border-bottom: 1px dotted #B3A9A9;
	}
	
	.chat li.left .chat-body
	{
	    margin-left: 60px;
	}
	
	.chat li.right .chat-body
	{
	    margin-right: 60px;
	}
	
	
	.chat li .chat-body p
	{
	    margin: 0;
	    color: #777777;
	}
	
	.panel .slidedown .glyphicon, .chat .glyphicon
	{
	    margin-right: 5px;
	}
	
	.panel-body.chat
	{
	    overflow-y: auto;
	    height: 250px;
	}
	
/* 	::-webkit-scrollbar-track */
/* 	{ */
/* 	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); */
/* 	    background-color: #F5F5F5; */
/* 	} */
	
/* 	::-webkit-scrollbar */
/* 	{ */
/* 	    width: 12px; */
/* 	    background-color: #F5F5F5; */
/* 	} */
	
/* 	::-webkit-scrollbar-thumb */
/* 	{ */
/* 	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3); */
/* 	    background-color: #555; */
/* 	} */
	
	</style>

	<script src="http://192.168.0.60:10001/socket.io/socket.io.js"></script>
	
</head>

<body id="page-top" class="index">

<%-- <div class="container" style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100%'> --%>
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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/main/main.do">자기 관리</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                        
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
                        <a href="${pageContext.request.contextPath}/main/news.do">뉴스</a>
                    </li>
                    
                     <li>
 
		                <span>
<!-- 							<button id="addMemo" style="text-align: center !important;background-color: #cebc21;"> -->
							<button id="addMemo">
							<img src="${pageContext.request.contextPath}/web/image/memo/Notes-icon.png" height="50px"/></button>
						</span>

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
<!-- 		                           <li id="month"><a href="#1" data-toggle="tab">달</a></li> -->
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
					          
					          <div id="occupancyRatio" style="width: 100px; height:300px;position: relative;top:-270px;left:163px;"></div>
				        	
						 </div>	
						 
			   		</div>
			   		
			   </div>
			   
		
			</div>
			
        </div>
        
    </section>
    
    <!-- 채팅 -->
	<div id="addDiv">
		<input type="text" id="friend" /><button type="button" id="addFriend">친구 추가</button>
	</div>
	
	<div id="list"> 
	</div>
	<button type="button" id="showList">친구 목록</button>
		


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
	var flag=true;
	$("#list").hide();
	$("#addDiv").hide();

	$("#showList").click(function() {
		
		if(!flag){
			$("#list").hide();
			$("#addDiv").hide();
			flag=true;
		}else{
			$("#list").show();
			$("#addDiv").show();
			flag=false;
		}
		
	});
</script>

<script>

	var socket;
	var myId="김현영";
	var html="";
	
	var madeRoom = [];
	
	socket = io.connect("http://192.168.0.60:10001");
	socket.emit("passId",myId);
	
// 	socket.on("chatWith",function(data) {
// 		makeRooms(data);
// 	});
	
	// 메시지 받기
	socket.on("msg",function (data) {
		
		 var msg = "";
		
	   	 msg+='             <li class="left clearfix">                                                                                ' ;
	     msg+='                 <span class="chat-img pull-left">                                                                     ' ;
	     msg+='				      <img src="http://placehold.it/50/55C1E7/fff&text=JS" alt="User Avatar" class="img-circle" />       ' ;
	     msg+=' 				</span>                                                                                                  ' ;
	     msg+='                 <div class="chat-body clearfix">                                                                      ' ;
	     msg+='                     <div class="header">                                                                              ' ;
	     msg+='                         <strong class="primary-font">'+data.sender+'</strong> <small class="pull-right text-muted">      ' ;
	     msg+='   						  <span class="glyphicon glyphicon-time"></span>12 mins ago</small>                          ' ;
	     msg+='                     </div>                                                                                            ' ;
	     msg+='                     <p style="font-weight:bold;color:black">                                                                                               ' ;
	  	 msg+= 							data.msg;
	     msg+='                     </p>                                                                                              ' ;
	     msg+='                 </div>                                                                                                ' ;
	     msg+='             </li> ';
		
		$("#"+data.sender).append(msg);
		
		resize(data.sender);
		
	});
	
	// 메시지 가져오기 두번째 단계 
	socket.on("bringMsg",function(data) {
		
		data.rows.forEach(function(row,i) {
			
			var msg = "";
			
			if(row.user==myId) {
				
				 msg+='             <li class="right clearfix"><span class="chat-img pull-right">                                             ' ;
			     msg+='                 <img src="http://placehold.it/50/FA6F57/fff&text=BP" alt="User Avatar" class="img-circle" />          ' ;
			     msg+='             </span>                                                                                                   ' ;
			     msg+='                 <div class="chat-body clearfix">                                                                      ' ;
			     msg+='                     <div class="header">                                                                              ' ;
			     msg+='                         <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>13 mins ago</small>  ' ;
			     msg+='                         <strong class="pull-right primary-font">'+row.user+'</strong>                                ' ;
			     msg+='                     </div>                                                                                            ' ;
			     msg+='						<p style="text-align:right;font-weight:bold;color:black"> ';                                                                          
			     msg+= 						row.msg;
			     msg+='                     </p>                                                                                              ' ;
			     msg+='                 </div>                                                                                                ' ;
			     msg+='             </li> ' ;    
				
			}else {
				
				 msg+='             <li class="left clearfix">                                                                                ' ;
			     msg+='                 <span class="chat-img pull-left">                                                                     ' ;
			     msg+='				      <img src="http://placehold.it/50/55C1E7/fff&text=JS" alt="User Avatar" class="img-circle" />       ' ;
			     msg+=' 				</span>                                                                                                  ' ;
			     msg+='                 <div class="chat-body clearfix">                                                                      ' ;
			     msg+='                     <div class="header">                                                                              ' ;
			     msg+='                         <strong class="primary-font">'+row.user+'</strong> <small class="pull-right text-muted">      ' ;
			     msg+='   						  <span class="glyphicon glyphicon-time"></span>12 mins ago</small>                          ' ;
			     msg+='                     </div>                                                                                            ' ;
			     msg+='                     <p style="font-weight:bold;color:black">                                                                                               ' ;
			  	 msg+= 							row.msg;
			     msg+='                     </p>                                                                                              ' ;
			     msg+='                 </div>                                                                                                ' ;
			     msg+='             </li> ';
				
			}
			
			$("#"+data.user).append(msg); // 대화창에 메시지 추가.
	
		});
		
		resize(data.user); // 상대방 유저.
		
	});
	
	// 메시지 전달.
	function msg(that) {
		
		var roomNo = that.getAttribute("data-roomNo");
		var recvId = that.getAttribute("data-recvId");
		var myMsg = $("[data-input=" +recvId + "]").val();
	 
	  	 var msg="";
	  	 
	     msg+='             <li class="right clearfix"><span class="chat-img pull-right">                                             ' ;
	     msg+='                 <img src="http://placehold.it/50/FA6F57/fff&text=BP" alt="User Avatar" class="img-circle" />          ' ;
	     msg+='             </span>                                                                                                   ' ;
	     msg+='                 <div class="chat-body clearfix">                                                                      ' ;
	     msg+='                     <div class="header">                                                                              ' ;
	     msg+='                         <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>13 mins ago</small>  ' ;
	     msg+='                         <strong class="pull-right primary-font">'+myId+'</strong>                                ' ;
	     msg+='                     </div>                                                                                            ' ;
	     msg+='						<p style="text-align:right;font-weight:bold;color:black"> ';                                                                          
	     msg+= 						myMsg;
	     msg+='                     </p>                                                                                              ' ;
	     msg+='                 </div>                                                                                                ' ;
	     msg+='             </li> ' ;    
		
		$("#"+recvId).append(msg); // 내 대화창
		
		 $("[data-input=" +recvId + "]").val("");
		socket.emit("msg",{roomNo:roomNo ,recvId:recvId,msg:myMsg} );
	
		resize(recvId);
		
	}
	
	// 대화창 크기 조절.
	function resize(user) {
		
		var chat = document.querySelector("[data-scroll="+user+"]");
		var th = chat.scrollHeight+20;
		var dh = $("[data-scroll="+user+"]").height();
		var size = th - dh;
		$("[data-scroll="+user+"]").scrollTop(size);
		
	} 
	
	// 방 만들기
	function makeRoom(that) {
		
		var data = {};
		
		data.room_no = that.getAttribute("data-roomNo");
		data.user = that.getAttribute("data-recvId");
		
		if(madeRoom[data.user]){
			console.log("이미 방이 있다..");
			return;
		}

		madeRoom[data.user] = "exist";
		
		console.log("roomNo :", data.room_no);
		console.log("customer :", data.user);
	
	   html+=' <div id="chat" data-close="'+data.user+'" class="panel panel-primary" style="width: 500px;height: 350px;border: 1px solid blue;z-index:99999999;">                                ' ;
	   html+='     <div class="panel-heading" style="background:#337ab7;border-color:#337ab7 !important;">                                                                                       ' ;
       html+='         <span class="glyphicon glyphicon-comment"></span> '+data.user+'님과의 대화창                                              ' ;
       html+='         <div class="btn-group pull-right">                                                                            ' ;
       html+='             <button type="button" data-id="'+data.user+'" class="btn btn-default btn-xs" onclick="closeRoom(this);"  >    ' ;
       html+='					   <span class="glyphicon glyphicon-chevron-down"></span>                                            ' ;
       html+='			   </button>                                                                                                 ' ;
//        html+='            <ul class="dropdown-menu slidedown">                                                                       ' ;
//        html+='             </ul>                                                                                                     ' ;
       html+='         </div>                                                                                                        ' ;
       html+='     </div>                                                                                                            ' ;
      
       html+='     <div class="panel-body chat" data-scroll='+data.user+'>                                                                                          ' ;
       html+='         <ul class="chat" id="'+data.user+'">                                                                                             ' ;
       
       html+='                                                                                                                       ' ;
       html+='         </ul>                                                                                                         ' ;
       html+='     </div>                                                                                                            ' ;
      
      
       html+='     <div class="panel-footer" style="background-color: #f5f5f5;border-top: 1px solid #ddd;">                                                                                        ' ;
       html+='         <div class="input-group">                                                                                     ' ;
       html+='             <input id="btn-input" type="text" class="form-control input-sm" data-input="'+data.user+'" placeholder="Type your message here..." />' ;
       html+='             <span class="input-group-btn">                                                                            ' ;
       html+='                 <button class="btn btn-warning btn-sm" id="btn-chat"  data-roomNo="'+data.room_no+'" data-recvId="'+data.user+'"  onclick="msg(this)">';
       html+='                     Send</button>                                                                                     ' ;
       html+='             </span>                                                                                                   ' ;
       html+='         </div>                                                                                                        ' ;
       html+='     </div>                                                                                                            ' ;
   
       html+=' </div> ';

		
		$("body").append(html);
		
		html="";
		
		// 메시지 가져오기 첫단계
		socket.emit("giveMsg",{roomNo: data.room_no , user:data.user});
		
	}

	// 마우스 다운 이벤트 무시..
	
	// 방 닫기.
	function closeRoom(that) {
		console.log("방 닫기");
		var user = that.getAttribute("data-id");
		delete madeRoom[user];
		$("[data-close="+user+"]").remove();
	}
	

	// 방 목록 만들기
	function makeRoomList(data) {
		
		var html="";
			html+='<ul class = "list-group"> ';
			for(var i=0;i<data.length;i++) {
				
				html+='<li class = "list-group-item" '; 
				html+='	data-recvId="'+data[i].user+'" data-roomNo="'+data[i].room_no+'" onclick="makeRoom(this);">'; 
				html+=  data[i].user+'님 과의 대화</li>';
			}
			html+='</ul>'
			
		$("#list").html(html);
			
	}
	
	// 방 가져오기 1 단계
// 	$("#bringRoom").click(function() {
// 		socket.emit("giveRoom",myId);
// 	});
	
	// 방 가져오기 1 단계
	socket.emit("giveRoom",myId); 
	
	// 방 가져오기 2 단계
	socket.on("bringRoom",function(data) {
		makeRoomList(data);
	});
	
	
	// 친구 추가
	$("#addFriend").click(function() {
		socket.emit("retrieveUser",$("#friend").val());		
	});
	
	
	// 유저 체크.
	socket.on("userCheckResult",function(data) {
		if(data.status == 'true'){
			socket.emit("chatWith",$("#friend").val()); // 친구와 방 생성 작업.
			socket.emit("giveRoom",myId);  				// 매칭된 친구와의 대화방 모두 가져오는 작업.
			alert(data.msg);
		}
		if(data.status == 'false'){
			// case 1. : 비회원.
			// case 2. : 이미 친구인 경우.
			alert(data.msg);
		}
		
		$("#friend").val(""); // 친구 창 비우기.
	});
	
	
	// 이 아래는 중요도가 낮다.
	
	// addDiv,list 위치 조정
	var listWidth = $("#showList").width();
	var listheight = $("#showList").height();
	var listTop   = $("#showList").offset().top;
	var listLeft  = $("#showList").offset().left;
	
	$("#addDiv").css({
		position:"fixed",
		left:listLeft,
		top: listTop + listheight + 15
	});
	
	$("div#list").css({
		position:"fixed",
		left: listLeft,
		top: listTop - (listheight + $("#list").height()) + 45
	});
	
// 	$("#list").toggle(1000);
		
	
	// 대화창 움직이게 하기
	$("body").on("mousedown", "div#chat", function(e) {
		
			var offsetX = e.offsetX;
			var offsetY = e.offsetY;

			var that = $(this);

			$(document).mousemove(function(event) {
				that.css("left", event.clientX - offsetX);
				that.css("top", event.clientY - offsetY);
				that.css("opacity", "0.5");
			});
			
	}).on("mouseup", "div#chat", function() {

		$(document).off("mousemove");
		$(this).css("opacity", "1");

	// 이벤트 전파 중지.
	}).on("mousedown",".panel-body",function(e) {
		e.stopPropagation();
	}).on("mousedown",".panel-footer",function(e) {
		e.stopPropagation();
	});
	
</script>	
		
</div>
</body>

</html>
