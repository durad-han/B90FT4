<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
<style>

/* .ui-datepicker-header{ */
/* 	background: green; */
/* } */
/* .ui-datepicker-month{ */
/* 	background: transparent; */
/* } */
/* .ui-datepicker-year{ */
/* 	background: transparent; */
/* } */
/* .ui-datepicker-prev{ */
/* 	background: transparent; */
/* 	height: 100%; */
/* } */
/* .ui-datepicker-next{ */
/* 	background: transparent; */
/* 	height: 100%; */
/* } */
/* .ui-datepicker{ */
/* 	width: 100%; */
/* } */

.ui-datepicker-today{ 
/* 	background-color: black; */
} 

tbody#expense tr.expenseInfo:hover{
	background:skyblue;
}
tbody#income tr.incomeInfo:hover{
	background:pink;
}

</style>
<meta charset="UTF-8">

    <title>B90FT4 | 가계부</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<!--     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"> -->
<!--  	<script src="//code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
</head>

<body>

   
        <!--BEGIN BACK TO TOP-->
        <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <!--END BACK TO TOP-->
        
        <!--BEGIN TOPBAR-->
        <div id="header-topbar-option-demo" class="page-header-topbar">
            <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a id="logo" href="index.html" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">B90FT4</span><span style="display: none" class="logo-text-icon">µ</span></a>
                </div>
                <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                                 <ul class="nav navbar-nav">
                                 <li><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a></li>
                                     <li><a href="#">메인</a></li>
                                     <li class="active"><a href="#">스케쥴</a></li>
                                     <li><a href="#">다이어리</a></li>
                                     <li><a href="#">가계부</a></li>
                                     <li><a href="#">운동</a></li>
                                     <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">드롭다운<b class="caret"></b></a>
                                         <ul class="dropdown-menu">
                                             <li><a href="#">Action</a></li>
                                             <li><a href="#">Another action</a></li>
                                             <li><a href="#">Something else here</a></li>
                                             <li class="divider"></li>
                                             <li><a href="#">Separated link</a></li>
                                             <li class="divider"></li>
                                             <li><a href="#">One more separated link</a></li>
                                         </ul>
                                     </li>
                                 </ul>
                                 <ul class="nav navbar-nav navbar-right">
                                     <li><a href="#">Link</a></li>
                                     <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Dropdown<b class="caret"></b></a>
                                         <ul class="dropdown-menu">
                                             <li><a href="#">Action</a></li>
                                             <li><a href="#">Another action</a></li>
                                             <li><a href="#">Something else here</a></li>
                                             <li class="divider"></li>
                                             <li><a href="#">Separated link</a></li>
                                         </ul>
                                     </li>
                                 </ul>
                             </div>     
        </nav>
                          
        </div>
        
        <!--END TOPBAR-->
        
        <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
            <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                data-position="right" class="navbar-default navbar-static-side">
            <div class="sidebar-collapse menu-scroll">
                <ul id="side-menu" class="nav">
                    
                     <div class="clearfix"></div>
                    <li class="active"><a href="${pageContext.request.contextPath}/accountBook/main.do"><i class="fa fa-fw">
                        <div class="icon-bg bg-orange"></div>
                    </i><span class="menu-title">전체</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/accountBook/budget.do"><i class="fa fa-fw">
                        <div class="icon-bg bg-pink"></div>
                    </i><span class="menu-title">지출/수입</span></a>
                       
                    </li>
                        <li><a href="${pageContext.request.contextPath}/accountBook/loanDept.do"><i class="fa fa-fw">
                        <div class="icon-bg bg-green"></div>
                    </i><span class="menu-title">대입금/차입금</span></a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/accountBook/setting.do"><i class="fa fa-fw">
                        <div class="icon-bg bg-violet"></div>
                    </i><span class="menu-title">설정</span></a>
                      
                    </li>
                </ul>
            </div>
        </nav>
            <!--END SIDEBAR MENU-->

            <!--BEGIN CHAT FORM-->

            <!--END CHAT FORM-->
            <!--BEGIN PAGE WRAPPER-->
            <div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            	${subMenu}</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">카테고리 종류</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">카테고리 종류</li>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                <!--BEGIN CONTENT-->
<!-- 				****************************** -->
<!-- 				<br>여기에 내용입력 <br>            -->
                
                <div class="row">
                	
                	
                  <div class="col-lg-7" style="margin-left: 2%;margin-right: 5%;padding: 0">
                		
                		 <ul id="generalTab" class="nav nav-tabs responsive">
                            <li id="expenseTab" class="active"><a href="#alert-tab" data-toggle="tab">지출</a></li>
                            <li id="incomeTab"><a href="#note-tab" data-toggle="tab">수입</a></li>
                        </ul>
                        
                		<h3> 
                		<input type="text" id="actualDate" style="width: 70%;text-align: center;" readonly />  
                		<button id="prev"> ◀  </button> <button id="next"> ▶ </button> 
                		</h3>
                		<br><br>
                		
                			<div id="generalTabContent" class="tab-content responsive">
			                       <div id="alert-tab" class="tab-pane fade in active" style="height:500px;overflow: auto">
										   <div class="panel panel-green" id="expenseTable">
						                            <div class="panel-heading">지출d</div>
						                            <div class="panel-body">
						                                <table class="table table-hover-color">
						                                    <thead>
						                                    <tr id="expenseColumn">
						                                        <th id="expenseCtgy">
						                                        	분류
						                                        </th>
						                                        <th>내용</th>
						                                        <th>금액</th>
						                                    </tr>
						                                    </thead>
						                                    <tbody id="expense">
						                                    </tbody>
						                                </table>
						                            </div>
						                   </div>
										   <div id="expenseDiv" style='display: none;width: 100%;height: 200px;'>			                       
				                		   </div>
				                		   <br><br>
				                		   <div id="incomeDiv" style='display: none;width: 100%;height: 200px;'>			                       
				                		   </div>
							               
			                	   </div>
			                				
	                            	<div id="note-tab" class="tab-pane fade" style="height:500px;overflow: auto;">
										   <div class="panel panel-yellow" id="incomeTable">
						                            <div class="panel-heading">수입</div>
						                            <div class="panel-body">
						                                <table class="table table-hover-color">
						                                    <thead>
						                                    <tr id="incomeColumn">
						                                        <th id="incomeCtgy">분류</th>
						                                        <th>내용</th>
						                                        <th>금액</th>
						                                    </tr>
						                                    </thead>
						                                    <tbody id="income">
						                                    </tbody>
						                                </table>
						                            </div>
						                   </div>
	                			   </div>
	                			   
                			</div>
                		</div>
                
                
                    <div class="col-lg-3">
					    <ul id="generalTab" class="nav nav-tabs responsive">
	                           <li class="active" id="day"><a href="#1" data-toggle="tab">일</a></li>
	                           <li id="week"><a href="#1" data-toggle="tab" >주</a></li>
	                           <li id="month"><a href="#1" data-toggle="tab" >월</a></li>
	                    </ul>
	                    <br>
					 	<div id="datepicker" placeholder="ex) 2017-03-30" style="margin-left: 10%"></div><br>
                		
                		<button id="budgetModal" style="margin-left: 35%;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
			                 		 지출/수입 등록
			            </button>
			            
			         
			         
			    <div id="monthBudgteTable" style="display: none;">
			        <h4 class="box-heading">월별 지출/수입 현황</h4>
                           <div class="panel panel-red">
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
                        
                        <div class="panel panel-blue" style="background:#FFF;">
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
			    </div> <!-- cols -->
             
             </div> <!-- row -->
                
		  </div> <!-- page wrapper  -->
		                
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
										<button type="button" id="updateBudget" class="btn btn-danger btn-simple" style = "display:none;" data-dismiss="modal">수정</button>
										<button type="button" id="deleteBudget" class="btn btn-danger btn-simple" style = "display:none;" data-dismiss="modal">삭제</button>
										
										<button type="button" id="budgetRegi">등록</button>
										<button type="button" id="closeF" 	    class="btn btn-success btn-simple" data-dismiss="modal">닫기</button>
									</div>
									
								</div>
                                        
						</div>
				</div>
				
                <!--END CONTENT-->
                
                
                <!--BEGIN FOOTER-->
                <div id="footer">
                    <div class="copyright"><a>B90FT4 Footer</a></div>
                </div>
                <!--END FOOTER-->
                
	 </div>     <!--END WRAPPER-->
		                

<script src="${pageContext.request.contextPath}/web/js/accountbook/budget.js"></script>
<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>

</body>
</html>