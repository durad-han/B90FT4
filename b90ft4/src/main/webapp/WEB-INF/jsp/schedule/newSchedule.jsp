<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>B90FT4 | Schedule</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div>
        <!--BEGIN THEME SETTING-->
        <div id="theme-setting">
            <a href="#" data-toggle="dropdown" data-step="1" data-intro="&lt;b&gt;Many styles&lt;/b&gt; and &lt;b&gt;colors&lt;/b&gt; be created for you. Let choose one and enjoy it!"
                data-position="left" class="btn-theme-setting"><i class="fa fa-cog"></i></a>
            <div class="content-theme-setting">
                <select id="list-style" class="form-control">
                    <option value="style1">Flat Squared style</option>
                    <option value="style2">Flat Rounded style</option>
                    <option value="style3" selected="selected">Flat Border style</option>
                </select>
            </div>
        </div>
        <!--END THEME SETTING-->
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
            <li><a href="#"><i class="fa fa-tachometer fa-fw">
                <div class="icon-bg bg-orange"></div>
            </i><span class="menu-title">기능</span></a></li>
            <li><a href="#"><i class="fa fa-desktop fa-fw">
                <div class="icon-bg bg-pink"></div>
            </i><span class="menu-title">Schedule : </span></a>
               
            </li>
            <li><a href="scheduleList.do"><i class="fa fa-send-o fa-fw">
                <div class="icon-bg bg-green"></div>
            </i><span class="menu-title">Schedule List</span></a>
               
            </li>
            <li><a href="scheduleCalendar.do"><i class="fa fa-edit fa-fw">
                <div class="icon-bg bg-violet"></div>
            </i><span class="menu-title">Schedule Calendar</span></a>
              
            </li>
            <li><a href="scheduleGraph.do"><i class="fa fa-th-list fa-fw">
                <div class="icon-bg bg-blue"></div>
            </i><span class="menu-title">Schedule Graph</span></a>
                  
            </li>
            
            <li><a href="#"><i class="fa fa-file-o fa-fw">
                <div class="icon-bg bg-yellow"></div>
            </i><span class="menu-title">Grids</span></a>
               
            </li>
            <li><a href="#"><i class="fa fa-gift fa-fw">
                <div class="icon-bg bg-grey"></div>
            </i><span class="menu-title">Grids</span></a>
              
            </li>
            <li><a href="#"><i class="fa fa-envelope-o">
                <div class="icon-bg bg-primary"></div>
            </i><span class="menu-title">Grids</span></a>
              
            </li>
            <li><a href="#"><i class="fa fa-bar-chart-o fa-fw">
                <div class="icon-bg bg-orange"></div>
            </i><span class="menu-title">Grids</span></a>
               
            </li>
        </ul>
    </div>
</nav>
          
          
<div id="page-wrapper">
    <!--BEGIN TITLE & BREADCRUMB PAGE-->
 <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
     <div class="page-header pull-left">
         <div class="page-title">
             Schedule List</div>
     </div>
     <ol class="breadcrumb page-breadcrumb pull-right">
         <li><i class="fa fa-home"></i>&nbsp;<a href="../main/main.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="hidden"><a href="#">Schedule List</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="active">Schedule List</li>
     </ol>
     <div class="clearfix">
     </div>
 </div>
 <!--END TITLE & BREADCRUMB PAGE-->
 <!--BEGIN CONTENT-->
 <div class="page-content">
     <div id="tab-general">
         <div class="row mbl">
             <div class="col-lg-12">
                 
               <div class="col-md-12">
                   <div id="area-chart-spline" style="width: 50%; height: 300px; display: none;">
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
                     <div class="jplist-panel box panel-top">
                         <button type="button" data-control-type="reset" data-control-name="reset" data-control-action="reset" class="jplist-reset-btn btn btn-default">Reset<i class="fa fa-share mls"></i></button>
                         <div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" class="jplist-drop-down form-control">
                             <ul class="dropdown-menu">
                                 <li><span data-number="3"> 3 per page</span></li>
                                 <li><span data-number="5"> 5 per page</span></li>
                                 <li><span data-number="10" data-default="true"> 10 per page</span></li>
                                 <li><span data-number="all"> view all</span></li>
                             </ul>
                         </div>
                         <div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-datetime-format="{month}/{day}/{hour}:{minutes}" class="jplist-drop-down form-control">
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
                         <div class="text-filter-box">
                             <div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".title" type="text" value="" placeholder="Filter by Title" data-control-type="textbox" data-control-name="title-filter" data-control-action="filter" class="form-control"/></div>
                         </div>
                         <div class="text-filter-box">
                             <div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".desc" type="text" value="" placeholder="Filter by Description" data-control-type="textbox" data-control-name="desc-filter" data-control-action="filter" class="form-control"/></div>
                         </div>
                         <div data-type="Page {current} of {pages}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
                         <div data-control-type="pagination" data-control-name="paging" data-control-action="paging" class="jplist-pagination"></div>
                     </div>
                     <div class="box text-shadow">
                         <table class="demo-tbl"><!--<item>1</item>-->
                            <c:forEach var="schedules" items='${scheduleMap["scheduleList"]}'>
                             <tr class="tbl-item">
                             <a href="javascript:goDetail(${schedules.scheduleNo});">
                                 <!--<data></data>-->
                                 <td class="td-block"><p class="date"><fmt:formatDate value='${schedules.start}' pattern="MM/dd hh:mm"/></p>

                                    <p class="title"><c:out value='${schedules.title }'/></p>

                                    <p class="desc"><c:out value='${schedules.content }'/></p>

                                    <p class="like">
                                    <c:choose>
										<c:when test='${schedules.achieve != 0}'>
											<input type="checkbox" name="achieved" checked="checked" disabled="disabled">
										</c:when>
										<c:otherwise>
											<input type="checkbox" name="achieved" >
										</c:otherwise>
									</c:choose>
									</p>
									</td>
                             </a>
                             </tr>
                             
                            </c:forEach> 
                             
                            </table>
                        </div>
                        <div class="box jplist-no-results text-shadow align-center"><p>No results found</p></div>
                        <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
                        <div class="jplist-panel box panel-bottom">
                            <div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-drop-down form-control">
                                <ul class="dropdown-menu">
                                    <li><span data-number="5"> 5 per page</span></li>
                                    <li><span data-number="10" data-default="true"> 10 per page</span></li>
                                    <li><span data-number="all"> view all</span></li>
                                </ul>
                            </div>
                            <div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-control-animate-to-top="true" data-datetime-format="{month}/{day}/{year}" class="jplist-drop-down form-control">
                                <ul class="dropdown-menu">
                                    <li><span data-path="default">Sort by</span></li>
                                    <li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
                                    <li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
                                    <li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Likes asc</span></li>
                                    <li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
                                    <li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li>
                                    <li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li>
                                </ul>
                            </div>
                            <div data-type="{start} - {end} of {all}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
                            <div data-control-type="pagination" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-pagination"></div>
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
<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
</body>
</html>
