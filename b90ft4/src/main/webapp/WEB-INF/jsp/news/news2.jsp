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

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
</head>

<body id="page-top" class="index">

<%-- <div class="container" style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100%'> --%>
<div class="container">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
   
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="main.do">자기 관리</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                        
                    <!-- 서브메뉴 드랍다운 -->
                    <li class = "dropdown">
                    
					      <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">
					          가계부 <span class = "caret"></span>
					      </a>
					      
					      <ul class = "dropdown-menu">
					         <li><a href = "#">지출/수입</a></li>
					         <li><a href = "#">대입금/차입금</a></li>
					         <li><a href = "#">설정</a></li>
					      </ul>
					      
				   </li>
                        
                    <li class="page-scroll">
                        <a href="#about">다이어리</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">스케쥴러</a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/main/news.do">뉴스</a>
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

			<div class="row">
                    <div class="col-lg-12">
                        <div class="panel">
                            <div class="panel-body">
                                <div id="grid-layout-table-1" class="box jplist">
                                    <div class="jplist-ios-button"><i class="fa fa-sort"></i>jPList Actions</div>
                                    <div class="jplist-panel box panel-top">
                                        				<button onclick="makeNews('rss')"       class="btn"> 속보 </button>
														<button onclick="makeNews('today')"        class="btn"> 오늘의뉴스 </button>
														<button id="IT" onclick="makeNews('it')"        class="btn-warning"> IT </button>
							                            <button onclick="makeNews('culture')"   class="btn btn-primary">culture</button>
							                            <button onclick="makeNews('politics')"  class="btn btn-info">politics</button>
							                            <button onclick="makeNews('life')"	    class="btn btn-success">life</button>
							                            <button onclick="makeNews('engilshNews')" class="btn btn-warning">engilshNews</button>
															
                                    </div>
                                    
                                    <div class="box text-shadow">
                                        <table class="demo-tbl" id="newsTable"><!--<item>1</item>-->
                                            <tr class="tbl-item"><!--<img/>-->
                                                <td class="img">이미지</td>
                                                <!--<data></data>-->
                                                <td class="td-block"><p class="date">03/15/2012</p>

                                                    <p class="title">Arch</p>

                                                    <p class="desc">An arch is a structure that spans a space and supports a load. Arches appeared as early as the 2nd millennium BC in Mesopotamian brick architecture and their systematic use started with the Ancient Romans who were the first to apply the technique to a wide range of structures.</p>

                                                    <p class="like">5 Likes</p>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                    
                                    <script>
                                    
			                                    function makeNews(category) {
			                                    	
			                    		     		var html="";
			                    		     		
			                    		     		$.ajax({
			                    		     			url:"http://192.168.0.60:10001/news?category="+category,
			                    		     			dataType:"json",
			                    		     			async:false
			                    		     		}).done(function(result) {
			                    		
			                    		     			   var items = result.rss.channel[0].item;
			                    		     			   
			                    						   console.log(items[0]);		     			   
			                    		     			
			                    						   for(var i=0; i < items.length; i ++ ) {
			                    							   
			                    								if(items[i].description[0].indexOf("</table>") != -1 ) {
			                    					     			var arr = (items[i].description[0]).split("</table>");
			                    					     			arr[0] = arr[0].substring( arr[0].indexOf("<img") , arr[0].indexOf(">",arr[0].indexOf("<img"))+1);                
			                    					         		
			                    					         		
			                    					     			html+='<tr class="tbl-item">';
			                    					     			
			                    					     			// 이미지 받아오기 
// 			                    					     			$.ajax({
// 			                    					     				url: "http://localhost:9090/b90ft4/main/newsImg.do",
// 			                    					     				data:{
// 			                    					     					url : items[i].link[0]
// 			                    					     				},
// 			                    					     				async : false
// 			                    					     			}).done(function(result) {
// 			                    					     				console.log(result);
// 			                    					     			});
			                    					                html+=  '<td class="img">'+arr[0]+'</td>';
			                    					     			
			                    					     			// 이미지 받아오기 끝
			                    					     			
			                    					                html+=  '<td class="td-block">'
			                    					                
			                    					                if(items[i].pubDate){
			                    				                		html+=      '<p>'+items[i].pubDate[0]+'</p>';
			                    					                }
			                    					                
			                    					                html+=      '<p class="title" style="font-size:30px;">'+items[i].title[0]+'</p>';
			                    					                
			                    					                
			                     									var desArr = (arr[1]).split('.');
			                    					                
			                    					                html+=      '<p class="newsContent">'
			                    					               
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
			                    								
			                    										 console.log(items[i]);
			                    										 
			                    									
			                    									html+='<tr class="tbl-item">';
			                    					                html+=  '<td class="img"></td>';
			                    					                html+=  '<td class="td-block">'
			                    			                	    if(items[i].pubDate){
			                    				                		html+=      '<p>'+items[i].pubDate[0]+'</p>';
			                    					                }
			                    					                
			                    					                var clz="title";
			                    					                if(category=='life' || category=='engilshNews') clz="newsContent";
			                    					                
			                    					                html+=      '<h2><p class="'+clz+'" style="font-size:30px; >'+items[i].title[0]+'</p></h2>';
			                    					                
			                    					                var desArr = (items[i].description[0]).split('.');
			                    					                
			                    					                html+=      '<p class="newsContent">'
			                    					               
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
			                                    
			                                console.log("뉴스");
			                                $("#IT").trigger("click");
                                    
                                    </script>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                	
                
		        	
        </div>
    </section>
    

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
	
    <!-- 차트 js -->
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script>
	
</div>
</body>

</html>
