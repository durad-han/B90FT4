<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>B90FT4 | 가계부</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/accountbook/jquery.jqplot.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/font-awesome.min.css"/>
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
                	
                	
        		 <div class="col-lg-3" style="border:1px solid black;">
                          
                          <div id="img">
                          
                          </div>
                          <h3 id="title">M</h3>
						  <small id="category"></small>
						  
						  <p id="description">
						  
						  
						  
						  </p>
						  
						  <small id="author"></small>
						  <small id="link"></small>
						  <small id="pubDate"></small>
						  
						  
                          <ul class="social-icons list-unstyled list-inline mbl mtl">
                              <li><a href="#" data-hover="tooltip" data-original-title="facebook" class="facebook"><i class="fa fa-facebook"></i></a></li>
                              <li><a href="#" data-hover="tooltip" data-original-title="google Plus" class="googleplus"><i class="fa fa-google-plus"></i></a></li>
                              <li><a href="#" data-hover="tooltip" data-original-title="skype" class="skype"><i class="fa fa-skype"></i></a></li>
                              <li><a href="#" data-hover="tooltip" data-original-title="twitter" class="twitter"><i class="fa fa-twitter"></i></a></li>
                          </ul>
                      </div>
                  </div>
                  <script>
                  
                		var html="";
                		$.ajax({
                			url:"http://localhost:10001/login/pass.do",
                			dataType:"json"
                		}).done(function(result) {
                			console.log(result.rss.channel[0].item[0]);

                			var items = result.rss.channel[0].item;
//                 			console.log(items);
//                 			console.log(items[0].title[0]);
                			
                			var arr = (items[5].description[0]).split("</table>");
                			
                			arr[0]+="</table>";
                			
                			
                			$("#title").html(items[5].title[0]);
                			$("#author").html(items[5].author[0]);
                			$("#category").html(items[5].category[0]);
                			$("#description").html(arr[1]);
                			$("#img").html(arr[0]);
                			$("#link").html("<a href="+items[5].link[0]+">링크</a>");
                			$("#pubDate").html(items[5].pubDate[0]);
                			
                			
//                 			for(var i=0; i < items.length; i ++ ) {
                				
//                 				html+="<tr>";
                				
//                 				html+="<td>"+items[i].author[0]+"</td>";
//                 				html+="<td>"+items[i].title[0]+"</td>";
//                 				html+="<td>"+items[i].category[0]+"</td>";
//                 				html+="<td>"+items[i].description[0]+"</td>";
//                 				html+="<td><a href='"+items[i].link[0]+"'>링크</a></td>";
//                 				html+="<td>"+items[i].pubDate[0]+"</td>";
                				
//                 				html+="</tr>";
//                 			}
                			
//                 			$("#newsTable").append(html);
                			
                		})
                		
                  </script>
                
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

<script src="${pageContext.request.contextPath}/web/js/common/validUtil.js"></script>






</body>
</html>