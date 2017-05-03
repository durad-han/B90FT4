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

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
	<script>
		console.log("하하");
	</script>

	<style>
	
		element.style{
			border: 1px solid white !important;
		}
		
		#generalTab li {
			font-weight: bold;
			font-size: 20px;
		}
		
		.dropdown-menu > li{
			color:white !important;
			background: black !important;
		}
		
		.tab-content {
		    background: #fff;
		    margin-bottom: 20px;
		    border-color: #e5e5e5 !important;
		    border-top: 0;
		}
		
		.prev, .next {
/* 		    position: absolute; */
/* 		    top: 50%; */
		    background-color: rgba(0, 0, 0, 0.3);
		    color: #fff;
		    display: inline-block;
		    font-size: 24px;
		    height: 50px;
		    width: 50px;
		    line-height: 50px;
		    text-align: center;
		    border-radius: 4px;
		    z-index: 5;
		}
		
		.prev:hover, .next:hover {
			background: grey;
		}
		
		#actualDate{
			width: 80%;
			font-size:25px;
			display: inline-block !important;
			text-align: center;
			background: white;
			height: 48px;
		}
		
		#actualDate:readonly{
			background: white;
		}
		
		/* 테이블 행 호버 CSS*/
		
		tbody#expense tr.expenseInfo:hover{
			background:skyblue;
		}
		tbody#income tr.incomeInfo:hover{
			background:pink;
		}
		
		#budgetPlanDiv input{
			text-align: center;
			font-weight: bold;
		}
		#budgetPlanDiv input:nth-child(6){
			color:blue;
		}
		
		
		/* 뱃지,레이블*/
		.label{
			color:white !important;
			font-weight: 500 !important;
		}
		
		.badge {
		  font-size: 11px !important;
		  font-weight: 300;
		  height: 18px;
		  padding: 3px 6px 3px 6px;
		  -webkit-border-radius: 12px !important;
		  -moz-border-radius: 12px !important;
		  border-radius: 12px !important;
		  text-shadow: none !important;
		  text-align: center;
		  vertical-align: middle;
		  background-color: #bcbcbc;
		}
		.label {
		  font-size: 11px;
		  font-weight: 300;
		  -webkit-border-radius: 0 !important;
		  -moz-border-radius: 0 !important;
		  border-radius: 0 !important;
		}
		.badge-default,
		.label-default {
		  background-color: #999 !important;
		}
		.badge-primary,
		.label-primary {
		  background-color: #dc6767 !important;
		}
		.badge-red,
		.label-red {
		  background-color: #bf4346 !important;
		}
		.badge-orange,
		.label-orange {
		  background-color: #e9662c !important;
		}
		.badge-green,
		.label-green {
		  background-color: #488c6c !important;
		}
		.badge-yellow,
		.label-yellow {
		  background-color: #f2994b !important;
		}
		.badge-blue,
		.label-blue {
		  background-color: #0a819c !important;
		}
		.badge-violet,
		.label-violet {
		  background-color: #9351ad !important;
		}
		.badge-pink,
		.label-pink {
		  background-color: #bf3773 !important;
		}
		.badge-grey,
		.label-grey {
		  background-color: #4b5d67 !important;
		}
		.badge-dark,
		.label-dark {
		  background-color: #594857 !important;
		}
		.label-success,
		.badge-success {
		  background-color: #5cb85c;
		  background-image: none !important;
		}
		.label-warning,
		.badge-warning {
		  background-color: #f0ad4e;
		  background-image: none !important;
		}
		.label-danger,
		.badge-danger {
		  background-color: #d9534f;
		  background-image: none !important;
		}
		.label-info,
		.badge-info {
		  background-color: #5bc0de;
		  background-image: none !important;
		}
		
		/* 패널 */
		
		.panel {
		  -webkit-box-shadow: none !important;
		  box-shadow: none !important;
		  -webkit-border-radius: 0 !important;
		  -moz-border-radius: 0 !important;
		  border-radius: 0 !important;
		   border: 1px solid #e5e5e5;
		    border-radius: 0 !important;
		    box-shadow: none !important;
		}
		.panel > .panel-heading {
		  font-size: 18px;
		  padding: 7px 15px;
		  border-top-right-radius: 0 !important;
		  border-top-left-radius: 0 !important;
		  border-color: #e5e5e5 !important;
		}
		.panel > .panel-footer {
		  font-size: 18px;
		  padding: 7px 15px;
		  border-bottom-right-radius: 0 !important;
		  border-bottom-left-radius: 0 !important;
		}
		.panel.panel-primary {
		  border-color: #dc6767;
		}
		.panel.panel-primary > .panel-heading {
		  color: #FFFFFF;
		  background: #dc6767;
		  border-color: #dc6767 !important;
		}
		.panel.panel-primary > .panel-footer {
		  color: #FFFFFF;
		  background: #dc6767;
		  border-color: #dc6767 !important;
		}
		.panel.panel-red {
		  border-color: #bf4346;
		}
		.panel.panel-red > .panel-heading {
		  color: #FFFFFF;
		  background: #bf4346;
		  border-color: #bf4346 !important;
		}
		.panel.panel-red > .panel-footer {
		  color: #FFFFFF;
		  background: #bf4346;
		  border-color: #bf4346 !important;
		}
		.panel.panel-orange {
		  border-color: #e9662c;
		}
		.panel.panel-orange > .panel-heading {
		  color: #FFFFFF;
		  background: #e9662c;
		  border-color: #e9662c !important;
		}
		.panel.panel-orange > .panel-footer {
		  color: #FFFFFF;
		  background: #e9662c;
		  border-color: #e9662c !important;
		}
		.panel.panel-green {
		  border-color: #488c6c;
		}
		.panel.panel-green > .panel-heading {
		  color: #FFFFFF;
		  background: #488c6c;
		  border-color: #488c6c !important;
		}
		.panel.panel-green > .panel-footer {
		  color: #FFFFFF;
		  background: #488c6c;
		  border-color: #488c6c !important;
		}
		.panel.panel-yellow {
		  border-color: #f2994b;
		}
		.panel.panel-yellow > .panel-heading {
		  color: #FFFFFF;
		  background: #f2994b;
		  border-color: #f2994b !important;
		}
		.panel.panel-yellow > .panel-footer {
		  color: #FFFFFF;
		  background: #f2994b;
		  border-color: #f2994b !important;
		}
		
		.panel.panel-blue {
		  background: #f2f5f6; /* Old browsers */
		background: -moz-linear-gradient(top, #f2f5f6 0%, #c8d7dc 100%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f2f5f6), color-stop(100%,#c8d7dc)); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top, #f2f5f6 0%,#c8d7dc 100%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top, #f2f5f6 0%,#c8d7dc 100%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top, #f2f5f6 0%,#c8d7dc 100%); /* IE10+ */
		background: linear-gradient(to bottom, #f2f5f6 0%,#c8d7dc 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f5f6', endColorstr='#c8d7dc',GradientType=0 ); /* IE6-9 */
		
		  border-color: #0a819c;
		}
		.panel.panel-blue > .panel-heading {
		  color: #FFFFFF;
		  background: #0a819c;
		  border-color: #0a819c !important;
		}
		.panel.panel-blue > .panel-footer {
		  color: #FFFFFF;
		  background: #0a819c;
		  border-color: #0a819c !important;
		}
		.panel.panel-pink {
		  border-color: #bf3773;
		}
		.panel.panel-pink > .panel-heading {
		  color: #FFFFFF;
		  background: #bf3773;
		  border-color: #bf3773 !important;
		}
		.panel.panel-pink > .panel-footer {
		  color: #FFFFFF;
		  background: #bf3773;
		  border-color: #bf3773 !important;
		}
		.panel.panel-violet {
		  border-color: #9351ad;
		}
		.panel.panel-violet > .panel-heading {
		  color: #FFFFFF;
		  background: #9351ad;
		  border-color: #9351ad !important;
		}
		.panel.panel-violet > .panel-footer {
		  color: #FFFFFF;
		  background: #9351ad;
		  border-color: #9351ad !important;
		}
		.panel.panel-grey {
		  border-color: #4b5d67;
		}
		.panel.panel-grey > .panel-heading {
		  color: #FFFFFF;
		  background: #4b5d67;
		  border-color: #4b5d67 !important;
		}
		.panel.panel-grey > .panel-footer {
		  color: #FFFFFF;
		  background: #4b5d67;
		  border-color: #4b5d67 !important;
		}
		.panel.panel-dark {
		  border-color: #594857;
		}
		.panel.panel-dark > .panel-heading {
		  color: #FFFFFF;
		  background: #594857;
		  border-color: #594857 !important;
		}
		.panel.panel-dark > .panel-footer {
		  color: #FFFFFF;
		  background: #594857;
		  border-color: #594857 !important;
		}
		
		.panel.panel-white {
		  border-color: #efefef;
		}
		
		.panel.panel-white > .panel-heading {
		  border-bottom: 1px solid #faf9fb;
		  color: #999999;
		  background: #FFFFFF;
		}
		
		.panel.panel-white > .panel-footer {
		  border-top: 1px solid #faf9fb;
		  color: #999999;
		  background: #FFFFFF;
		}		
		
		.content{
			white-space:nowrap;		
			overflow: hidden;  /* 엘리먼트의 넘치는 내용물을 숨겨라 . */
			text-overflow: ellipsis;	
			text-align: center;	
			width: 400px;
		}
		
		.amount {
			text-align: center;	
			width: 100px;
		}
		
		#expenseDate, #incomeDate {
			text-align: center;	
			width: 25% !important;		
		}
		#expenseCtgy, #incomeCtgy {
			text-align: center;	
			width: 100px !important;		
		}
		
		#budgetModal {
			width: 100%;
		}
		
		#budgetPlanDiv > span {
			font-size: 1.3em;
			margin-bottom: 30px;
		}
		
		#budgetPlanDiv > span:last-child {
			color: blue;
		}
		hr.star-primary2 {
		  padding: 0;
		  border: none;
		  border-top: solid 5px;
		  text-align: center;
		  margin: 25px auto 30px;
		}
		
		#portfolio {
/* 			background-color: rgba(137, 183, 136, 0.03); */
		}
</style>

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
                <a class="navbar-brand" href="main.do">자기 관리</a>
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
					         <li><a href = "#">지출/수입</a></li>
					         <li><a href = "#">대입금/차입금</a></li>
					         <li><a href = "#">설정</a></li>
					      </ul>
					      
				   </li>
                    <!-- 드롭 다운 테스트  -->
                        
                    <li class="page-scroll">
                        <a href="#about">다이어리</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">스케쥴러</a>
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
	                        
						                            <li id=expenseTotal><a href="#monthExpense-tab" data-toggle="tab">지출</a></li>
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
						        	<span></span>
						        	<h4><b>이번 달 현재 총 지출</b></h4>
						        	<span></span>
						        	<h4><b>잔여 지출 한도</b></h4>
						        	<span></span>
					          </div> 
				        	
						 </div>	
						 
			   		</div>
			   		
			   </div>
			   
		
			</div>
			
        </div>
        
    </section>

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
	
</div>
</body>

</html>
