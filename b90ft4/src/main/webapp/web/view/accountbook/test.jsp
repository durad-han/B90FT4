<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
    
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	
  	
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/accountbook/jquery.jqplot.css" />
  	
  	
<!--   	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" /> -->
<!--     <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" /> -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" /> -->
	<!-- CSS Files -->
<%--     <link href="${pageContext.request.contextPath}/web/js/accountbook/assets/css/bootstrap.min.css" rel="stylesheet" /> --%>
<%--     <link href="${pageContext.request.contextPath}/web/js/accountbook/assets/css/material-kit.css" rel="stylesheet"/> --%>

	<!-- CSS Just for demo purpose, don't include it in your project -->
<%-- 	<link href="${pageContext.request.contextPath}/web/js/accountbook/assets/css/demo.css" rel="stylesheet" /> --%>
    
    
    
    
    
<%--     <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/jquery-ui-1.10.4.custom.min.css"/> --%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/font-awesome.min.css"/>
<%--     <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/bootstrap.min.css"/> --%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/animate.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/all.css"/>
     <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/main.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/style-responsive.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/pace.css"/>
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
 	<c:import url ="/WEB-INF/jsp/common/basicInclude.jsp"/>
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
                    <li><a href="Forms.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-violet"></div>
                    </i><span class="menu-title">가계메모</span></a>
                      
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
                	
                	
                  <div class="col-lg-6" style="margin-left: 2%;margin-right: 5%;padding: 0">
                		
                		 <ul id="generalTab" class="nav nav-tabs responsive">
                            <li id="expenseTab" class="active"><a href="#alert-tab" data-toggle="tab">지출</a></li>
                            <li id="incomeTab"><a href="#note-tab" data-toggle="tab">수입</a></li>
<!--                            <li><a href="#1" data-toggle="tab" ></a></li> -->
<!--                            <li><a href="#1" data-toggle="tab" ></a></li> -->
<!--                            <li><a href="#1" data-toggle="tab" ></a></li> -->
<!--                            <li><a href="#1" data-toggle="tab" ></a></li> -->
<!--                            <li><a href="#1" data-toggle="tab" ></a></li> -->
                           
<!--                            <li class="active" id="day"><a href="#1" data-toggle="tab">일</a></li> -->
<!--                            <li id="week"><a href="#1" data-toggle="tab" >주</a></li> -->
<!--                            <li id="month"><a href="#1" data-toggle="tab" >월</a></li> -->
                        </ul>
                        
                		<h3> 
                		<input type="text" id="actualDate" style="width: 70%;text-align: center;" readonly />  
                		<button id="prev"> ◀  </button> <button id="next"> ▶ </button> 
                		</h3>
                		<br><br>
                		
                			<div id="generalTabContent" class="tab-content responsive">
			                       <div id="alert-tab" class="tab-pane fade in active" style="height:630px;overflow: ">
										   <div class="panel panel-green" id="expenseTable">
						                            <div class="panel-heading">지출</div>
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
							                   
										   <div id="expenseDiv" style='display: none;height: 50%;'>			                       
				                		   </div>
				                		   <br>
				                		   <div id="incomeDiv" style='display: none;height: 50%;'>			                       
				                		   </div>
			                	   </div>
			                				
	                            	<div id="note-tab" class="tab-pane fade" style="height:400px;overflow: auto;">
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
<!--                 																													data-toggle="modal" data-target="#modal-config" -->
                		<button id="budgetModal" style="margin-left: 35%;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-config">
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
			             
			      </div>
			    </div> <!-- cols -->
             
             </div> <!-- row -->
                
		  </div> <!-- page wrapper  -->
		                
		                
		        <div id="modal-config" class="modal fade">
	                <div class="modal-dialog">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" data-dismiss="modal" aria-hidden="true" class="close">
	                                &times;</button>
	                            <h4 class="modal-title">
	                                Modal title</h4>
	                        </div>
	                        <div class="modal-body">
	                            <p>
	                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eleifend et nisl eget
	                                porta. Curabitur elementum sem molestie nisl varius, eget tempus odio molestie.
	                                Nunc vehicula sem arcu, eu pulvinar neque cursus ac. Aliquam ultricies lobortis
	                                magna et aliquam. Vestibulum egestas eu urna sed ultricies. Nullam pulvinar dolor
	                                vitae quam dictum condimentum. Integer a sodales elit, eu pulvinar leo. Nunc nec
	                                aliquam nisi, a mollis neque. Ut vel felis quis tellus hendrerit placerat. Vivamus
	                                vel nisl non magna feugiat dignissim sed ut nibh. Nulla elementum, est a pretium
	                                hendrerit, arcu risus luctus augue, mattis aliquet orci ligula eget massa. Sed ut
	                                ultricies felis.</p>
	                        </div>
	                        <div class="modal-footer">
	                            <button type="button" data-dismiss="modal" id="closeF"  class="btn btn-default">
	                                Close</button>
	                            <button type="button" id="save"  class="btn btn-primary">
	                                Save changes</button>
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
		                
                
                
   
    
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//bootstrap-hover-dropdown.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script//respond.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/custom.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.menu.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/pace.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/holder.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/responsive-tabs.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.categories.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.tooltip.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.fillbetween.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.stack.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.spline.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/zabuto_calendar.min.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/index.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/main.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/data.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/drilldown.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/exporting.js"></script>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts-more.js"></script>
<%-- <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-pie.js"></script> --%>
<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-more.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/accountbook/jquery.jqplot.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/accountbook/jqplot.pieRenderer.js"></script>


<%-- <script src="${pageContext.request.contextPath}/web/js/accountbook/budget.js"></script> --%>
<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>


<%-- <script src="${pageContext.request.contextPath}/web/js/accountbook/assets/js/material.min.js"></script> --%>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<%-- <script src="${pageContext.request.contextPath}/web/js/accountbook/assets/js/nouislider.min.js" type="text/javascript"></script> --%>
<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
<%-- <script src="${pageContext.request.contextPath}/web/js/accountbook/assets/js/material-kit.js" type="text/javascript"></script> --%>
<script>
	var i=0;
	$("#save").click(function() {
		
		
		
		if(!i) {
			console.log(i);
			i++;
			return; 
		}
		console.log("쥬노플로");
		
		$("#save").attr("data-dismiss","modal");
		
	})
</script>

</body>
</html>