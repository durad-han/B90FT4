<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B90FT4 | 스케줄</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:import url ="/WEB-INF/jsp/common/basicInclude.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/schedule/schedule.css">

</head>
<body>
<div>
 

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
                    <li class="active"><a href="#">메인</a></li>
                    <li><a href="#">스케쥴</a></li>
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
	           		
	            <li class="active"><i class="fa fa-fw">
	            
	                <div class="icon-bg bg-orange"></div>
	                
	            </i><span class="menu-title">기능</span></li>
	            
	            <li><a href="/b90ft4/schedule/scheduleList.do"><i class="fa fa-th-list fa-fw">
	            
	                <div class="icon-bg bg-pink"></div>
	                
	            </i><span class="menu-title">Schedule List</span></a>
	               
	            </li>
	            <li><a href="/b90ft4/schedule/scheduleCalendar.do"><i class="fa fa-calendar-check-o fa-fw">
	            
	                <div class="icon-bg bg-green"></div>
	                
	            </i><span class="menu-title">Schedule Calendar </span></a>
	               
	            </li>
	            <li><a href="/b90ft4/schedule/scheduleGraph.do"><i class="fa fa-pie-chart fa-fw">
	            
	                <div class="icon-bg bg-violet"></div>
	                
	            </i><span class="menu-title">Schedule Graph</span></a>
	              
	            </li>
	           
	        </ul>
	    </div>
	</nav>
	    <!--END SIDEBAR MENU-->
<!-- 	<!--BEGIN TITLE & BREADCRUMB PAGE--> -->
<!--                 <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb"> -->
<!--                     <div class="page-header pull-left"> -->
<!--                         <div class="page-title"> -->
<!--                             Data Grid</div> -->
<!--                     </div> -->
<!--                     <ol class="breadcrumb page-breadcrumb pull-right"> -->
<!--                         <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li> -->
<!--                         <li class="hidden"><a href="#">Data Grid</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li> -->
<!--                         <li class="active">Data Grid</li> -->
<!--                     </ol> -->
<!--                     <div class="clearfix"> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 END TITLE & BREADCRUMB PAGE -->
<!-- 	<!--BEGIN CONTENT--> -->
<!--                 <div class="page-content"> -->
<!--                     <div id="tab-general"> -->
<!--                         <div class="row mbl"> -->
<!--                             <div class="col-lg-12"> -->
                                
<!--                                             <div class="col-md-12"> -->
<!--                                                 <div id="area-chart-spline" style="width: 40%; height: 200px; display: none;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
                                
<!--                             </div> -->

<!--                             <div class="col-lg-12"> -->
                            
<!--                             <div class="page-content"> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-lg-12"> -->
<!--                         <div class="panel"> -->
<!--                             <div class="panel-body"> -->
<!--                                 <div id="grid-layout-table-1" class="box jplist"> -->
<!--                                     <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div> -->
<!--                                     <div class="jplist-panel box panel-top"> -->
<!--                                         <button type="button" data-control-type="reset" data-control-name="reset" data-control-action="reset" class="jplist-reset-btn btn btn-default">Reset<i class="fa fa-share mls"></i></button> -->
<!--                                         <div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" class="jplist-drop-down form-control"> -->
<!--                                             <ul class="dropdown-menu"> -->
<!--                                                 <li><span data-number="3"> 3 per page</span></li> -->
<!--                                                 <li><span data-number="5"> 5 per page</span></li> -->
<!--                                                 <li><span data-number="10" data-default="true"> 10 per page</span></li> -->
<!--                                                 <li><span data-number="all"> view all</span></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-datetime-format="{month}/{day}/{year}" class="jplist-drop-down form-control"> -->
<!--                                             <ul class="dropdown-menu"> -->
<!--                                                 <li><span data-path="default">Sort by</span></li> -->
<!--                                                 <li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li> -->
<!--                                                 <li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li> -->
<!--                                                 <li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li> -->
<!--                                                 <li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li> -->
<!--                                                 <li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Likes asc</span></li> -->
<!--                                                 <li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li> -->
<!--                                                 <li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li> -->
<!--                                                 <li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="text-filter-box"> -->
<!--                                             <div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".title" type="text" value="" placeholder="Filter by Title" data-control-type="textbox" data-control-name="title-filter" data-control-action="filter" class="form-control"/></div> -->
<!--                                         </div> -->
<!--                                         <div class="text-filter-box"> -->
<!--                                             <div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".desc" type="text" value="" placeholder="Filter by Description" data-control-type="textbox" data-control-name="desc-filter" data-control-action="filter" class="form-control"/></div> -->
<!--                                         </div> -->
<!--                                         <div data-type="Page {current} of {pages}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div> -->
<!--                                         <div data-control-type="pagination" data-control-name="paging" data-control-action="paging" class="jplist-pagination"></div> -->
<!--                                     </div> -->
<!--                                     <div class="box text-shadow"> -->
<!--                                         <table class="demo-tbl"><item>1</item> -->
<!--                                             <tr class="tbl-item"><img/> -->
<!--                                                 <td class="img"><img src="images/thumbs/arch-1.jpg" alt="" title=""/></td> -->
<!--                                                 <data></data> -->
<!--                                                 <td class="td-block"><p class="date">03/15/2012</p> -->

<!--                                                     <p class="title">Arch</p> -->

<!--                                                     <p class="desc">An arch is a structure that spans a space and supports a load. Arches appeared as early as the 2nd millennium BC in Mesopotamian brick architecture and their systematic use started with the Ancient Romans who were the first to apply the technique to a wide range of structures.</p> -->

<!--                                                     <p class="like">5 Likes</p></td> -->
<!--                                             </tr> -->
<!--                                             <item>2</item> -->
<!--                                             <tr class="tbl-item"><img/> -->
<!--                                                 <td class="img"><img src="images/thumbs/arch-2.jpg" alt="" title=""/></td> -->
<!--                                                 <data></data> -->
<!--                                                 <td class="td-block"><p class="date">03/18/2012</p> -->

<!--                                                     <p class="title">Architecture</p> -->

<!--                                                     <p class="desc">Architecture is both the process and product of planning, designing and construction. Architectural works, in the material form of buildings, are often perceived as cultural symbols and as works of art. Historical civilizations are often identified with their surviving architectural achievements.</p> -->

<!--                                                     <p class="like">25 Likes</p></td> -->
<!--                                             </tr> -->
                                       
                                           
<!--                                             <item>33</item> -->
<!--                                             <tr class="tbl-item"><img/> -->
<!--                                                 <td class="img"><img src="images/thumbs/woodstump.jpg" alt="" title=""/></td> -->
<!--                                                 <data></data> -->
<!--                                                 <td class="td-block"><p class="date">11/12/2004</p> -->

<!--                                                     <p class="title">Wood</p> -->

<!--                                                     <p class="desc">Wood is a hard, fibrous tissue found in many trees. It has been used for hundreds of thousands of years for both fuel and as a construction material. It is an organic material, a natural composite of cellulose fibers (which are strong in tension) embedded in a matrix of lignin which resists compression. Wood is produced as -->
<!--                                                         secondary xylem in the stems of trees (and other woody plants). In a living tree it performs a support function, enabling woody plants to grow large or to stand up for themselves. It also mediates the transfer of water and nutrients to the leaves and other growing tissues. Wood may also refer to other plant materials with comparable -->
<!--                                                         properties, and to material engineered from wood, or wood chips or fiber.</p> -->

<!--                                                     <p class="like">25 Likes</p></td> -->
<!--                                             </tr> -->
<!--                                         </table> -->
<!--                                     </div> -->
<!--                                     <div class="box jplist-no-results text-shadow align-center"><p>No results found</p></div> -->
<!--                                     <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div> -->
<!--                                     <div class="jplist-panel box panel-bottom"> -->
<!--                                         <div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-drop-down form-control"> -->
<!--                                             <ul class="dropdown-menu"> -->
<!--                                                 <li><span data-number="3"> 3 per page</span></li> -->
<!--                                                 <li><span data-number="5"> 5 per page</span></li> -->
<!--                                                 <li><span data-number="10" data-default="true"> 10 per page</span></li> -->
<!--                                                 <li><span data-number="all"> view all</span></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-control-animate-to-top="true" data-datetime-format="{month}/{day}/{year}" class="jplist-drop-down form-control"> -->
<!--                                             <ul class="dropdown-menu"> -->
<!--                                                 <li><span data-path="default">Sort by</span></li> -->
<!--                                                 <li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li> -->
<!--                                                 <li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li> -->
<!--                                                 <li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li> -->
<!--                                                 <li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li> -->
<!--                                                 <li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Likes asc</span></li> -->
<!--                                                 <li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li> -->
<!--                                                 <li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li> -->
<!--                                                 <li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div data-type="{start} - {end} of {all}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div> -->
<!--                                         <div data-control-type="pagination" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-pagination"></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
                            
<!--                             </div> -->
                            
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 END CONTENT -->
	<!--BEGIN PAGE WRAPPER-->
	<div id="page-wrapper">
	    <!--BEGIN TITLE & BREADCRUMB PAGE-->
	   <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
	       <div class="page-header pull-left">
	           <div class="page-title">
	               	카테고리 종류</div>
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
	<c:import url ="/WEB-INF/jsp/schedule/scheduleList.jsp"/>           
	   
	   
	   <!--END CONTENT-->
	   
	   
	   
	   <!--BEGIN FOOTER-->
	   <div id="footer">
	       <div class="copyright"><a>B90FT4 Footer</a></div>
	   </div>
	   <!--END FOOTER-->
	</div>
	<!--END PAGE WRAPPER-->
	</div>
</div>
    
<script>
// 		(function (i, s, o, g, r, a, m) {
//             i['GoogleAnalyticsObject'] = r;
//             i[r] = i[r] || function () {
//                 (i[r].q = i[r].q || []).push(arguments)
//             }, i[r].l = 1 * new Date();
//             a = s.createElement(o),
//             m = s.getElementsByTagName(o)[0];
//             a.async = 1;
//             a.src = g;
//             m.parentNode.insertBefore(a, m)
//         })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
//         ga('create', 'UA-145464-12', 'auto');
//         ga('send', 'pageview');


</script>
<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
</body>
</html>