<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>다이어리</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <link rel="apple-touch-icon" href="images/icons/favicon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/jquery-ui-1.10.4.custom.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/animate.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/all.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/main.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/style-responsive.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/zabuto_calendar.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/pace.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/jplist.css">
    <!-- datepicker -->
	<link rel="stylesheet" href="/resources/demos/style.css">
	
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
	    <a id="logo" href="http://14.32.66.123:9092/b90ft4/main/main.do" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">B90FT4</span><span style="display: none" class="logo-text-icon">µ</span></a>
	        </div>
	        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
              <ul class="nav navbar-nav">
              <li><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a></li>
<!-- 메뉴 옵션들 ==================================================================================================== -->
                  <li class="active"><a href="http://14.32.66.123:9092/b90ft4/main/main.do">메인</a></li>
                  <li class="dropdown"><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleList.do" data-toggle="dropdown" class="dropdown-toggle">스케줄<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                      	  <li><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleList.do">스케줄 리스트</a></li>
                          <li><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleCalendar.do">스케줄 캘린더</a></li>
                          <li><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleGraph.do">스케줄 그래프</a></li>
                          <li class="divider"></li>
                          <li><a href="#">임시메뉴</a></li>
                      </ul>
                  </li>
                  <li><a href="http://14.32.66.123:9092/b90ft4/diary/list.do">다이어리</a></li>
                  <li><a href="http://14.32.66.123:9092/b90ft4/accountBook/main.do">가계부</a></li>
                  <li><a href="http://14.32.66.123:9092/b90ft4/workout/workout.do">운동</a></li>
<!-- 미사용 드롭다운 샘플 ==================================================================================================== -->
                  <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">드롭다운 샘플<b class="caret"></b></a>
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

        
            <!--BEGIN MODAL CONFIG PORTLET-->
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
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-default">
                                Close</button>
                            <button type="button" class="btn btn-primary">
                                Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--END MODAL CONFIG PORTLET-->
        </div>
        <!--END TOPBAR-->
        <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
             <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
            <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                data-position="right" class="navbar-default navbar-static-side">
            <div class="sidebar-collapse menu-scroll">
                <ul id="side-menu" class="nav">
                    
                     <div class="clearfix"></div>
                    <li class="active"><a href="dashboard.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-orange"></div>
                    </i><span class="menu-title">전체</span></a></li>
                    <li><a href="Layout.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-pink"></div>
                    </i><span class="menu-title">기능</span></a>
                       
                    </li>
                    <li><a href="UIElements.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-green"></div>
                    </i><span class="menu-title">기능</span></a>
                       
                    </li>
                    <li><a href="Forms.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-violet"></div>
                    </i><span class="menu-title">기능</span></a>
                      
                    </li>
                    <li><a href="Tables.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-blue"></div>
                    </i><span class="menu-title">기능</span></a>
                          
                    </li>
                    <li><a href="DataGrid.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-red"></div>
                    </i><span class="menu-title">기능</span></a>
                      
                    </li>
                    <li><a href="Pages.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-yellow"></div>
                    </i><span class="menu-title">기능</span></a>
                       
                    </li>
                    <li><a href="Extras.html"><i class="fa fa-fw">
                        <div class="icon-bg bg-grey"></div>
                    </i><span class="menu-title">기능</span></a>
                      
                    </li>
                   
                </ul>
            </div>
        </nav>
            <div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            다이어리</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="http://14.32.66.123:9092/b90ft4/main/main.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">다이어리</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">다이어리</li>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                <!--BEGIN CONTENT-->
                <div class="page-content" style='background:url("${pageContext.request.contextPath}/web/image/diary/background1.jpg") no-repeat;background-size:100% 100%'>
                     <div id="tab-general">
                        <div class="row mbl">
                        <table style="width: 100%;">
                        <tr>
                        <td>
                        
                            <div class="col-lg-12">
                                
                                            <div class="col-md-7">
                                                <div id="area-chart-spline" style="width: 100%; text-align: center; height: 300px; display: none;">
                                                </div>
                                            </div>
                                
                            </div>

                            <div class="col-lg-12">
                            
                            <div class="page-content">
				                <div class="row">
				                    <div class="col-lg-12">
				                        <div class="panel">
				                            <div class="panel-body">
				                                <div id="grid-layout-table-1" class="box jplist">
				                                    <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
				                                    <div align="right">
				                                    	전체 <c:out value="${pageResult.count}"/>개
													</div>                                    
				                                    <div style="display: none;" class="jplist-panel box panel-top">
				                                        
				                                        
				                                        <div data-type="Page {current} of {pages}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
				                                        <div data-control-type="pagination" data-control-name="paging" data-control-action="paging" class="jplist-pagination"></div>
				                                    </div>
				                                    <div class="box text-shadow">
				                                        <table class="demo-tbl"><!--<item>1</item>-->
				                                        <c:forEach var="diary" items="${list}">
				                                            <tr class="tbl-item">
				                                            	<!--<img/>-->
				                                            	
				                                            	<td style="width:150px;">
				                                            		<img src="${pageContext.request.contextPath}/web/image/diary/sad.jpg"/>
				                                            	</td>
				                                                <!--<data></data>-->
				                                                <td class="td-block"><p class="date"><fmt:formatDate value="${diary.diaryDate}" pattern="yyyy-MM-dd hh:mm:ss" /></p>
				
				                                                    <p class="title"><a href='detail.do?diaryNo=<c:out value="${diary.diaryNo}"/>'><c:out value="${diary.title}" /></a></p>
				
				                                                    <p class="desc"><c:out value="${diary.content}"/></p>
				                                                    <p class="weather"><img src="${pageContext.request.contextPath}/web/image/diary/weather1.jpg"/></p>
																</td>
				                                            </tr>
				                                        </c:forEach>
				                                            
				                                        </table>
				                                    </div>
				                                    <div class="box jplist-no-results text-shadow align-center"><p>No results found</p></div>
				                                    <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
				                                    <div class="jplist-panel box panel-bottom">
				                                        <div class="text-filter-box">
				                                            <div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".title" type="text" value="" placeholder="Filter by Title" data-control-type="textbox" data-control-name="title-filter" data-control-action="filter" class="form-control"/></div>
				                                        </div>
				                                        <div class="text-filter-box">
				                                            <div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".desc" type="text" value="" placeholder="Filter by Description" data-control-type="textbox" data-control-name="desc-filter" data-control-action="filter" class="form-control"/></div>
				                                        </div>
				                                        <div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-drop-down form-control">
				                                            <ul class="dropdown-menu">
				                                                <li><span data-number="10" data-default="true"> 10 per page</span></li>
				                                                <li><span data-number="all"> view all</span></li>
				                                            </ul>
				                                        </div>
				                                        <div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-control-animate-to-top="true" data-datetime-format="{month}/{day}/{year}" class="jplist-drop-down form-control">
				                                            <ul class="dropdown-menu">
				                                                <li><span data-path="default">Sort by</span></li>
				                                                <li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
				                                                <li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
				                                                <li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
				                                                <li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
				                                                <li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Likes asc</span></li>
				                                                <li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
				                                                <li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li>
				                                                <li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li>
				                                            </ul>
				                                        </div>
				                                        <br><p></p><br>
				                                        <div id="paging" align="center">
				                                        	<div data-control-type="pagination" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-pagination"></div>
				                                    		<div data-type="{start} - {end} of {all}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
				                                        </div>
				                                        <div align="right">
				                                    	<a href='${pageContext.request.contextPath}/diary/writeForm.do' class="btn btn-info" role="button">글쓰기</a>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
                            </div>
                            </td>
                            <td>
                            <div id="datepicker"></div>
                        	</td>
                        </tr>
                        </table>
                        </div>
                    </div>
                </div>
                <!--END CONTENT-->
                <!--BEGIN FOOTER-->
                <div id="footer">
                    <div class="copyright">
                        <a href="http://themifycloud.com">2014 © KAdmin Responsive Multi-Purpose Template</a></div>
                </div>
                <!--END FOOTER-->
            </div>
            <!--END PAGE WRAPPER-->
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-migrate-1.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/bootstrap-hover-dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/respond.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.news-ticker.js"></script>
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
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/data.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/drilldown.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts-more.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-pie.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-more.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jplist.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jplist.js"></script>

    <!--CORE JAVASCRIPT-->
    <script src="script/main.js"></script>
    <script>     
    	console.log("갱신");
// 		datepicker
// 		  $( function() {
//             $( "#datepicker" ).datepicker(datepicker_default);
//           } );
			
		var datepicker_default;
// 		makeCalendar();
		$("#datepicker").datepicker({
			showOn: 'button',
			buttonText: "달력",
			currentText: "이번달",
			closeText : "선택" ,
			dateFormat: "yy-mm-dd",
			firstDay: 0,
			isRTL: false,
			showMonthAfterYear: true,
			changeMonth: true,
			changeYear: true,
			showOtherMonths: true,
			selectOtherMonths: true,
			gotoCurrent:true,
			monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
			     		'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
     		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
     					'7월','8월','9월','10월','11월','12월'],
     		dayNames: ['일','월','화','수','목','금','토'],
     		dayNamesShort: ['일','월','화','수','목','금','토'],
     		dayNamesMin: ['일','월','화','수','목','금','토'],
     		onSelect : function(dateText, inst) {
     			
//	     			var date = $("#datepicker").datepicker('getDate');
//	     			var temp =  $.datepicker.parseDate("yy-mm-dd",dateText);
//	     			var today = new Date();

				console.log(dateText);
//		    			var selectedDate = $.datepicker.formatDate( dateFormat, date );
//		    			$("[id=actualDate]").val(selectedDate); // 선택한 날짜를 인풋 박스에 출력.
//		    			$("[name=budgetF] input:eq(4)").val(selectedDate);
// 		    		ㄴ	console.log("선택한 날짜1",	$("[name=budgetF] input:eq(4)").val());
//		    			budgetList(selectedDate); // 선택한 날짜에 해당하는 지출/수입을 긁어온다.
	    			
     		}
		});
		
        
</script>

</body>
</html>
