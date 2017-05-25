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
<%--     <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/chat/chat.css"> --%>
    
    <!-- 프리랜서 Theme CSS -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet"> --%>
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/main.css" rel="stylesheet"> --%>
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/memo.css" rel="stylesheet"> --%>
    
	<!-- 제이쿼리 , Bootstrap css-->
<!-- 	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"> -->
<!-- 	<link href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel = "stylesheet"> -->
	
	<!-- 제이쿼리, 부트스트랩 js -->
<!-- 	<script src="http://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- 	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- 	<script src ="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script> 이것 때문에 모달이 안된다. -->

    <!-- Custom Fonts -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> --%>
<!--     <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"> -->
<!--     <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css"> -->
<%--     <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/sub.css" rel="stylesheet" type="text/css" /> --%>
	
	<%@include file="/WEB-INF/jsp/common/topInclude.jsp"%>	
	<!-- 로긴 css -->
<%-- 	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/main/login.css"> --%>
	
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

<div class="container" style="background-color: rgba(137, 183, 136, 0.03);">



<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
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
	                            <li id="expenseTab" class="active"><a href="#expense-tab" data-toggle="tab">대입금/차입금</a></li>
	                        </ul>
	                        
	                    </div>   
					</div>			        
					
					<div class="row">
                		<div class="col-md-12">
                		<h3> 
	                		<!-- 날짜 표시 -->
					        <input type="text" id="actualDate" class = "form-control" readonly>
				            
				            <a class="prev" id="prev" href="#" style="text-decoration: none;">
<!-- 				            	<i class="icon-angle-left"></i> -->
									&lt;
				            </a>
				            
				        	<a class="next" id="next" href="#" style="text-decoration: none;">
<!-- 				        		<i class="icon-angle-right"></i> -->
				        			&gt;
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
    
</div> <!-- container div 끝 -->

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/contact_me.js"></script>
	
	<!-- 메모 js -->	
	<script src="${pageContext.request.contextPath}/web/js/memo/memo.js"></script>
	

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/freelancer.min.js"></script>
	<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>
    
    <!-- loanDept js -->
    <script src="${pageContext.request.contextPath}/web/js/accountbook/loanDept.js"></script>
	

</body>

</html>
