<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
<style>

.ui-datepicker-today{ 
/* 	background-color: black; */
} 

tr.bondInfo:hover{
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
  	
 	
</head>

<body>
<div>
<!-- 위로가기 ==================================================================================================== -->
	<a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        
<!-- 상단 메뉴 시작 ==================================================================================================== -->
<div id="header-topbar-option-demo" class="page-header-topbar">
    <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
	<div class="navbar-header">
	    <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only"> toggle </span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
	    <a id="logo" href="../main/main.do" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">B90FT4</span><span style="display: none" class="logo-text-icon">µ</span></a>
	        </div>
	        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
<!-- 메뉴 옵션들 ==================================================================================================== -->
              <ul class="nav navbar-nav">
              <li><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a></li>
                  <li><a href="../main/main.do">메인</a></li>
                  <li><a href="../schedule/scheduleList.do">스케줄</a></li>
                  <li><a href="../diary/list.do">다이어리</a></li>
                  <li class="active"><a href="../accountBook/budget.do">가계부</a></li>
                  <li><a href="../workout/workout.do">운동</a></li>
                  <li><a href="../main/news.do">뉴스</a></li>
              </ul>
<!-- 로그인 & 메모 ==================================================================================================== -->
              <ul class="nav navbar-nav navbar-right">
              	<li><a href="#callModal">Login</a></li>
				<li style='margin-right: 20px;'>
                <input type="checkbox" id="showAndHideMemo" name='memoOpt' value='1' checked/>
					<label for='showAndHideMemo'>메모 보기</label>
                </li>
                <li>
	                <div id="addMemo">
						<button><img src="icon_add_stickynote.gif" />메모 추가</button>
					</div>
                </li>
              </ul>
    </div>     
	</nav>
</div>
<!-- 상단메뉴 종료 ==================================================================================================== -->

        <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
            <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                data-position="right" class="navbar-default navbar-static-side">
            <div class="sidebar-collapse menu-scroll">
                <ul id="side-menu" class="nav">
                    
                     <div class="clearfix"></div>
<%--                     <li class="active"><a href="${pageContext.request.contextPath}/accountBook/main.do"><i class="fa fa-fw"> --%>
<!--                         <div class="icon-bg bg-orange"></div> -->
<!--                     </i><span class="menu-title">전체</span></a></li> -->
                    <li><a href="${pageContext.request.contextPath}/accountBook/budget.do"><i class="fa fa-fw">
                        <div class="icon-bg bg-pink"></div>
                    </i><span class="menu-title">지출/수입</span></a>
                       
                    </li>
                    <li class="active" ><a href="${pageContext.request.contextPath}/accountBook/loanDept.do"><i class="fa fa-fw">
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
            <div id="page-wrapper"
            	style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100% 100%'
            >
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            	${subMenu}</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="http://14.32.66.123:9092/b90ft4/main/main.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
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
                            <li id="expenseTab" class="active"><a href="#alert-tab" data-toggle="tab">대입금 / 차입금</a></li>
                        </ul>
                        
                		<h3> 
                		<input type="text" id="actualDate" style="width: 70%;text-align: center;" readonly />  
                		<button id="prev"> ◀  </button> <button id="next"> ▶ </button> 
                		</h3>
                		<br><br>
                		
                			<div id="generalTabContent" class="tab-content responsive">
			                     
			                   <div id="alert-tab" class="tab-pane fade in active" style="height:500px;overflow: auto;">
								  
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
                
                
                 <div class="col-lg-3">
					    <ul id="generalTab" class="nav nav-tabs responsive">
	                           <li class="active" id="day"><a href="#1" data-toggle="tab">일</a></li>
	                           <li id="week"><a href="#1" data-toggle="tab" >주</a></li>
	                    </ul>
	                    <br>
					 	<div id="datepicker" placeholder="ex) 2017-03-30" style="margin-left: 10%"></div><br>
                		
                		<button id="bondModal" style="margin-left: 35%;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
			                 		 대입금/차입금 등록
			            </button>
			         
			         
			     </div> <!-- cols -->
             
             </div> <!-- row -->
			 <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br> <br><br>

	 		</div> <!-- page wrapper  -->
                    <br>
		            <br>    
		                
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
			 
		</div>
		</div>
		                
                
                
                

<script src="${pageContext.request.contextPath}/web/js/memo/memo.js"></script>
<script src="${pageContext.request.contextPath}/web/js/accountbook/loanDept.js"></script>
<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>



</body>
</html>