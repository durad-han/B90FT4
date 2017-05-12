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

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/sub.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/memo.css" rel="stylesheet">
	
	<style>
		tr.bondInfo:hover{
			background:skyblue;
		}
		tbody#income tr.incomeInfo:hover{
			background:pink;
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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/main/main.do">Cog + I</a>
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
				   
                    <!-- 드롭 다운 테스트  -->
                        
                    <li class="page-scroll">
                        <a href="#about">다이어리</a>
                    </li>
                    
                    <li class="page-scroll">
                        <a href="#contact">스케쥴러</a>
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
            <br><br>
			<div class="row">
			   
			   <div class="col-md-9">
					<div class="row">
                		<div class="col-md-12">
	                		
	                		<ul id="generalTab" class="nav nav-tabs responsive" style="width: 50%;">
	                            <li id="expenseTab" class="active"><a href="#expense-tab" data-toggle="tab">대입금/차입금</a></li>
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
										  
										 <div class="panel panel-green" id="">
					                            <div class="panel-heading">받을 돈</div>
					                            <div class="panel-body">
					                                <table class="table table-hover-color">
					                                    <thead>
					                                    <tr>
					                                    	<th class="bondDate" style="display: none;">
					                                    		날짜
					                                    	</th>
					                                        <th>
					                                        	빌려간 사람
					                                        </th>
					                                        <th>내용</th>
					                                        <th>금액</th>
					                                    </tr>
					                                    </thead>
					                                    <tbody id="loanTbody">
					                                    </tbody>
					                                </table>
					                            </div>
					                      </div>
				                   
									      <div class="panel panel-yellow" id="">
					                            <div class="panel-heading">갚을 돈</div>
					                            <div class="panel-body">
					                                <table class="table table-hover-color">
					                                    <thead>
					                                    <tr>
					                                    	<th class="bondDate" style="display: none;">
					                                    		날짜
					                                    	</th>
					                                        <th>빌려준 사람</th>
					                                        <th>내용</th>
					                                        <th>금액</th>
					                                    </tr>
					                                    </thead>
					                                    <tbody id="debtTbody">
					                                    </tbody>
					                                </table>
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
		                     </ul>
							  <div id="datepicker"></div><br>
		                	  <button id="bondModal" style="width:100%;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
			                 		 대입금/차입금 등록
			           		  </button>
				        	  
						 </div>	
						 
			   		</div>
			   		
			   </div>
			   
		
			</div>                	
			
        </div>
    </section>
    
    
    <!-- 등록 모달 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
		<div class="modal-dialog">
			<div class="modal-content">
					
						<div class="modal-header">
							<h4 class="modal-title">대입금/차입금 등록</h4>
						</div>
						
						<div class="modal-body">
							<form name="bondF">
                                       <div class="form-group"><label class="col-sm-3 control-label">종류</label>
                                              <div class="col-sm-9 controls">
                                                  <div class="row">
                                                      <div class="col-xs-9">
                                                          <div class="radio"><label class="radio-inline"><input type="radio" value="0" name="bondCode" checked="checked"/>&nbsp;
                                                             	 대입금</label><label class="radio-inline"><input type="radio" value="1" name="bondCode"/>&nbsp;
                                                                               차입금</label></div>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                           
							 		   <div class="form-group"><label class="col-sm-3 control-label" id="bondName"></label>
                                             	<div class="col-sm-9 controls">
                                                 	<div class="row">
                                                   	    <div class="col-xs-9"><input type="text" class="form-control"/></div>
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
						<button type="button" id="updateBond" class="btn btn-success btn-simple" style="display:none;">수정</button>
						<button type="button" id="deleteBond" class="btn btn-danger btn-simple" style="display:none;" data-dismiss="modal">삭제</button>
						
						<button type="button" id="regiLoanDept"  class="btn btn-success btn-simple">등록</button>
						<button type="button" id="closeF" 	    class="btn btn-danger btn-simple" data-dismiss="modal">닫기</button>
					</div>
					
				</div>
                                    
			</div>
	</div>
    
    
    

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
    <script src="${pageContext.request.contextPath}/web/js/accountbook/loanDept.js"></script>
	
    <!-- 차트 js -->
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
	
	<script src="${pageContext.request.contextPath}/web/js/memo/memo.js"></script>
	
</div>
</body>

</html>
