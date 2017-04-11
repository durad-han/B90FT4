<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>오늘의 뉴스</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/images/icons/favicon.ico">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/images/icons/favicon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/images/icons/favicon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/images/icons/favicon-114x114.png">
<!--Loading bootstrap css-->
<link type="text/css" rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
<link type="text/css" rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/font-awesome.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/animate.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/all.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/main.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/style-responsive.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/zabuto_calendar.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/pace.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/jquery.news-ticker.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/styles/jplist-custom.css">
</head>

<body>
	<div>
		<!--BEGIN THEME SETTING-->
		<div id="theme-setting">
			<a href="#" data-toggle="dropdown" data-step="1"
				data-intro="&lt;b&gt;Many styles&lt;/b&gt; and &lt;b&gt;colors&lt;/b&gt; be created for you. Let choose one and enjoy it!"
				data-position="left" class="btn-theme-setting"><i
				class="fa fa-cog"></i></a>
			<div class="content-theme-setting">
				<select id="list-style" class="form-control">
					<option value="style1">Flat Squared style</option>
					<option value="style2">Flat Rounded style</option>
					<option value="style3" selected="selected">Flat Border
						style</option>
				</select>
			</div>
		</div>
		<!--END THEME SETTING-->
		<!--BEGIN BACK TO TOP-->
		<a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
		<!--END BACK TO TOP-->
		<!--BEGIN TOPBAR-->
		<div id="header-topbar-option-demo" class="page-header-topbar">
			<nav id="topbar" role="navigation" style="margin-bottom: 0;"
				data-step="3" class="navbar navbar-default navbar-static-top">
				<div class="navbar-header">
					<button type="button" data-toggle="collapse"
						data-target=".sidebar-collapse" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a id="logo" href="index.html" class="navbar-brand"><span
						class="fa fa-rocket"></span><span class="logo-text">KAdmin</span><span
						style="display: none" class="logo-text-icon">µ</span></a>
				</div>
				<div class="topbar-main">
					<a id="menu-toggle" href="#" class="hidden-xs"><i
						class="fa fa-bars"></i></a>

					<form id="topbar-search" action="" method=""
						class="hidden-sm hidden-xs">
						<div class="input-icon right text-white">
							<a href="#"><i class="fa fa-search"></i></a><input type="text"
								placeholder="Search here..." class="form-control text-white" />
						</div>
					</form>
					<div class="news-update-box hidden-xs">
						<span class="text-uppercase mrm pull-left text-white">News:</span>
						<ul id="news-update" class="ticker list-unstyled">
							<li>Welcome to KAdmin - Responsive Multi-Style Admin
								Template</li>
							<li>At vero eos et accusamus et iusto odio dignissimos
								ducimus qui blanditiis praesentium voluptatum deleniti atque.</li>
						</ul>
					</div>
					<ul class="nav navbar navbar-top-links navbar-right mbn">
						<li class="dropdown"><a data-hover="dropdown" href="#"
							class="dropdown-toggle"><i class="fa fa-bell fa-fw"></i><span
								class="badge badge-green">3</span></a></li>
						<li class="dropdown"><a data-hover="dropdown" href="#"
							class="dropdown-toggle"><i class="fa fa-envelope fa-fw"></i><span
								class="badge badge-orange">7</span></a></li>
						<li class="dropdown"><a data-hover="dropdown" href="#"
							class="dropdown-toggle"><i class="fa fa-tasks fa-fw"></i><span
								class="badge badge-yellow">8</span></a></li>
						<li class="dropdown topbar-user"><a data-hover="dropdown"
							href="#" class="dropdown-toggle"><img
								src="images/avatar/48.jpg" alt=""
								class="img-responsive img-circle" />&nbsp;<span
								class="hidden-xs">Robert John</span>&nbsp;<span class="caret"></span></a>
							<ul class="dropdown-menu dropdown-user pull-right">
								<li><a href="#"><i class="fa fa-user"></i>My Profile</a></li>
								<li><a href="#"><i class="fa fa-calendar"></i>My
										Calendar</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>My Inbox<span
										class="badge badge-danger">3</span></a></li>
								<li><a href="#"><i class="fa fa-tasks"></i>My Tasks<span
										class="badge badge-success">7</span></a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="fa fa-lock"></i>Lock Screen</a></li>
								<li><a href="Login.html"><i class="fa fa-key"></i>Log
										Out</a></li>
							</ul></li>
						<li id="topbar-chat" class="hidden-xs"><a
							href="javascript:void(0)" data-step="4"
							data-intro="&lt;b&gt;Form chat&lt;/b&gt; keep you connecting with other coworker"
							data-position="left" class="btn-chat"><i
								class="fa fa-comments"></i><span class="badge badge-info">3</span></a></li>
					</ul>
				</div>
			</nav>
			<!--BEGIN MODAL CONFIG PORTLET-->
			<div id="modal-config" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" data-dismiss="modal" aria-hidden="true"
								class="close">&times;</button>
							<h4 class="modal-title">Modal title</h4>
						</div>
						<div class="modal-body">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Sed eleifend et nisl eget porta. Curabitur elementum sem
								molestie nisl varius, eget tempus odio molestie. Nunc vehicula
								sem arcu, eu pulvinar neque cursus ac. Aliquam ultricies
								lobortis magna et aliquam. Vestibulum egestas eu urna sed
								ultricies. Nullam pulvinar dolor vitae quam dictum condimentum.
								Integer a sodales elit, eu pulvinar leo. Nunc nec aliquam nisi,
								a mollis neque. Ut vel felis quis tellus hendrerit placerat.
								Vivamus vel nisl non magna feugiat dignissim sed ut nibh. Nulla
								elementum, est a pretium hendrerit, arcu risus luctus augue,
								mattis aliquet orci ligula eget massa. Sed ut ultricies felis.</p>
						</div>
						<div class="modal-footer">
							<button type="button" data-dismiss="modal"
								class="btn btn-default">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>
			<!--END MODAL CONFIG PORTLET-->
		</div>
		<!--END TOPBAR-->
		<div id="wrapper">
			<!--BEGIN SIDEBAR MENU-->
			<nav id="sidebar" role="navigation" data-step="2"
				data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
				data-position="right" class="navbar-default navbar-static-side">
				<div class="sidebar-collapse menu-scroll">
					<ul id="side-menu" class="nav">

						<div class="clearfix"></div>
						<li><a href="dashboard.html"><i
								class="fa fa-tachometer fa-fw">
									<div class="icon-bg bg-orange"></div>
							</i><span class="menu-title">Dashboard</span></a></li>
						<li><a href="Layout.html"><i class="fa fa-desktop fa-fw">
									<div class="icon-bg bg-pink"></div>
							</i><span class="menu-title">Layouts</span></a></li>
						<li><a href="UIElements.html"><i
								class="fa fa-send-o fa-fw">
									<div class="icon-bg bg-green"></div>
							</i><span class="menu-title">UI Elements</span></a></li>
						<li><a href="Forms.html"><i class="fa fa-edit fa-fw">
									<div class="icon-bg bg-violet"></div>
							</i><span class="menu-title">Forms</span></a></li>
						<li><a href="Tables.html"><i class="fa fa-th-list fa-fw">
									<div class="icon-bg bg-blue"></div>
							</i><span class="menu-title">Tables</span></a></li>
						<li class="active"><a href="DataGrid.html"><i
								class="fa fa-database fa-fw">
									<div class="icon-bg bg-red"></div>
							</i><span class="menu-title">Data Grids</span></a></li>
						<li><a href="Pages.html"><i class="fa fa-file-o fa-fw">
									<div class="icon-bg bg-yellow"></div>
							</i><span class="menu-title">Pages</span></a></li>
						<li><a href="Extras.html"><i class="fa fa-gift fa-fw">
									<div class="icon-bg bg-grey"></div>
							</i><span class="menu-title">Extras</span></a></li>
						<li><a href="Dropdown.html"><i
								class="fa fa-sitemap fa-fw">
									<div class="icon-bg bg-dark"></div>
							</i><span class="menu-title">Multi-Level Dropdown</span></a></li>
						<li><a href="Email.html"><i class="fa fa-envelope-o">
									<div class="icon-bg bg-primary"></div>
							</i><span class="menu-title">Email</span></a></li>
						<li><a href="Charts.html"><i
								class="fa fa-bar-chart-o fa-fw">
									<div class="icon-bg bg-orange"></div>
							</i><span class="menu-title">Charts</span></a></li>
						<li><a href="Animation.html"><i class="fa fa-slack fa-fw">
									<div class="icon-bg bg-green"></div>
							</i><span class="menu-title">Animations</span></a></li>
					</ul>
				</div>
			</nav>


			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<div class="page-header pull-left">
						<div class="page-title">오늘의 뉴스</div>
					</div>
					<ol class="breadcrumb page-breadcrumb pull-right">
						<li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="hidden"><a href="#">Data Grid</a>&nbsp;&nbsp;<i
							class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
						<li class="active">Data Grid</li>
					</ol>
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->
				<div class="page-content">
					<div id="tab-general">
						<div class="row mbl">
							<div class="col-lg-12">

								<div class="col-md-12">
									<div id="area-chart-spline"
										style="width: 100%; height: 300px; display: none;"></div>
								</div>

							</div>

							<div class="col-lg-12">

								<div class="page-content">
									<div class="row">
										<div class="col-lg-12">
											<div class="panel">
												<div class="panel-body">
													<div id="grid-layout-table-1" class="box jplist">
														<div class="jplist-ios-button">
															<i class="fa fa-sort"></i>jPList Actions
														</div>
														<div class="jplist-panel box panel-top">
														
														<button onclick="makeNews('rss')"class="btn"> 속보 </button>
														<button onclick="makeNews('today')"class="btn"> 오늘의 주요뉴스 </button>
														<button onclick="makeNews('it')"class="btn"> IT </button>
							                            <button onclick="makeNews('culture')" class="btn btn-primary">culture</button>
							                            <button onclick="makeNews('politics')" class="btn btn-info">politics</button>
							                            <button onclick="makeNews('life')"	   class="btn btn-success">life</button>
							                            <button onclick="makeNews('engilshNews')" class="btn btn-warning">engilshNews</button>
															
														</div>

														<div class="box text-shadow">
															<!--<item>1</item>-->
															<!-- 테이블 시작. -->
															<table class="demo-tbl" id="newsTable">
																
																<tr class="tbl-item">
																	<!--<img/>-->
																	<td class="img"></td>
																	<!--<data></data>-->
																	<td class="td-block"><p class="date">03/15/2012</p>

																		<p class="title">Arch</p>

																		<p class="desc">An arch is a structure that spans
																			a space and supports a load. Arches appeared as early
																			as the 2nd millennium BC in Mesopotamian brick
																			architecture and their systematic use started with
																			the Ancient Romans who were the first to apply the
																			technique to a wide range of structures.</p>

																		<p class="like">5 Likes</p></td>
																</tr>

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
				<!--END CONTENT-->
				<!--BEGIN FOOTER-->
				<div id="footer">
					<div class="copyright">
						<a href="http://themifycloud.com">2014 © KAdmin Responsive
							Multi-Purpose Template</a>
					</div>
				</div>
				<!--END FOOTER-->
			</div>
			<!--END PAGE WRAPPER-->
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-1.10.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-migrate-1.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-ui.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/bootstrap-hover-dropdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/html5shiv.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/respond.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.metisMenu.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.cookie.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/custom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.news-ticker.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.menu.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/pace.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/holder.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/responsive-tabs.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.categories.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.tooltip.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.fillbetween.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.spline.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/zabuto_calendar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/index.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/data.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/drilldown.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/exporting.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts-more.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-more.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/modernizr.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jplist.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jplist.js"></script>
	<script>
	
			function makeNews(category) {
	
		     		var html="";
		     		
		     		$.ajax({
		     			
		     			url:"http://localhost:10001/news?category="+category,
		     			dataType:"json"
		     			
		     		}).done(function(result) {
		
		     			   var items = result.rss.channel[0].item;
		     			   
						   console.log(items[0]);		     			   
		     			
						   for(var i=0; i < items.length; i ++ ) {
							   
								if(items[i].description[0].indexOf("</table>") != -1 ) {
					     			var arr = (items[i].description[0]).split("</table>");
					     			arr[0]+="</table>";
					     			arr[1];
					         		html+='<tr class="tbl-item">';
					                html+=  '<td class="img">'+arr[0]+'</td>';
					                html+=  '<td class="td-block">'
					                
					                if(items[i].pubDate){
				                		html+=      '<p>'+items[i].pubDate[0]+'</p>';
					                }
					                
					                html+=      '<p><h3>'+items[i].title[0]+'</h3></p>';
					                
					                
 									var desArr = (arr[1]).split('.');
					                
					                html+=      '<p>'
					               
					                for(var j=0;j<desArr.length;j++) {
					                	
					                	var tail='';
					                	
					                	if(desArr[j]==''){
						                	tail+=".....";
						                	html+= desArr[j]+tail;
					                		break;
					                	}else{
					                		tail+='.<br>';
						                	html+= desArr[j]+tail;
					                	}	
					                }
					                
					                html+= 	    '</p>';
					                
					                
					                html+=      '<p><a href='+items[i].link[0]+'><b>기사 보기</b></a></p>';
				                	html+=	'</td>';
					                html+='</tr>';
					                
					                
								} else{
								
									html+='<tr class="tbl-item">';
					                html+=  '<td class="img"></td>';
					                html+=  '<td class="td-block">'
			                	    if(items[i].pubDate){
				                		html+=      '<p>'+items[i].pubDate[0]+'</p>';
					                }
					                html+=      '<p><h3>'+items[i].title[0]+'</h3></p>';
					                
					                var desArr = (items[i].description[0]).split('.');
					                
					                html+=      '<p>'
					               
					                for(var j=0;j<desArr.length;j++) {
										var tail='';
					                	
					                	if(desArr[j]==''){
						                	tail+="......";
						                	html+= desArr[j]+tail;
											break;					                	
					                	}else{
					                		tail+='.<br>';
						                	html+= desArr[j]+tail;
					                	}	
					                }
					                
					                html+= 	    '</p>';
					                
					                html+=      '<p><a href='+items[i].link[0]+'><b>기사 보기</b></a></p>';
				                	html+=	'</td>';
					                html+='</tr>';
					                
								}
								
		         	  	   }
						   
		         			$("#newsTable").html(html);
		         			
		      		});
     		
			}
    </script>


	<!--CORE JAVASCRIPT-->
	<script
		src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/main.js"></script>
	<script>        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-145464-12', 'auto');
        ga('send', 'pageview');


</script>
</body>
</html>
