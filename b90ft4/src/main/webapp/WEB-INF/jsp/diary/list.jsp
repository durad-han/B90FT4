<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Cog + I</title>
    
<c:import url ="/WEB-INF/jsp/common/topInclude.jsp"/>

  	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/templatemo-misc.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/templatemo-style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/list.css">
	
	<!-- chat -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/chat/chat.css">
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
	
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<style>
		table td {
			color: black !important;
			font-weight: bold;
			font-size: 20px;
			border: 1px solid black;
		}
	</style>
	<script src="http://192.168.0.119:10001/socket.io/socket.io.js"></script>
</head>

<body id="page-top" class="index" style="background-color:white">

<div class="container">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>

    <!-- Portfolio Grid Section -->
    <script>
    	var pageNo = 2;
    </script>
    
    <section id="portfolio" style="background-color:transparent !important;">
        <div class="container" style="padding-right:40px; background-color: rgba(102, 114, 191, 0.03) !important;"> <!-- 패딩 right 필수 -->
               
                <div class="row">
                    <div class="section-header col-md-12">
                        <h2 style="color: red">Diary</h2>
                    </div> 
                </div>	
                
                 <div id="row">
                	<div class="col-md-12">
                	<h1 style="font-size:50px !important;">
                		
                		DIARY
                		
                	</h1>
                	</div>
				</div>
				
				<div id="row">
                	<div class="col-md-12">
					   	<a href='${pageContext.request.contextPath}/diary/writeForm.do' style="margin-left: 94%;" class="btn btn-info" role="button">글쓰기</a>
						<br><br>
					</div>
				</div>
				
			    <div class="row">
                	<div class="col-md-12">
                	
	                    <div id="diaryBox" class="blog-masonry masonry-true">
	                    
			                <c:forEach var="diary" items="${list}" varStatus="loop"> 
				                      
				                        <div class="post-masonry col-md-4 col-sm-6">
				                            <div class="blog-thumb">
				                                
				                                <c:choose>
													<c:when test="${diary.content ne 'x'}">
						                                	${diary.content}
													</c:when>
													<c:when test="${diary.content eq 'x'}">
						                                <img src="${pageContext.request.contextPath}/web/image/diary/background2.jpg" width="350px" height="215px" id="img1" alt="">
													</c:when>
												</c:choose>
				                                
				                                <div class="overlay-b">
				                                    <div class="overlay-inner">
				                                        <a href="blog-single.html" class="fa fa-link"></a>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="blog-body">
				                                <div class="box-content" style="margin:0 !important;">
				                                    <h3 class="post-title"><a href='detail.do?diaryNo=<c:out value="${diary.diaryNo}"/>'><c:out value="${diary.title}" /></a></h3>
				                                    <span class="blog-meta"><fmt:formatDate value="${diary.diaryDate}" pattern="yyyy-MM-dd hh:mm:ss" /></span>
				                                </div>
				                            </div>
				                        </div> <!-- /.post-masonry -->
			                </c:forEach>
                
	                    </div> <!-- /.blog-masonry -->
	                    
	                </div>
                 </div> <!-- /.row -->
               
              <script>
              
		          	$(window).scroll(function(){				
		    			var sh = $(window).scrollTop() + $(window).height(); 	//scrollHeight
		    			var dh = $(document).height();							//documentHeight
// 		    			console.log(sh,dh);
		    			if (sh >= dh - 10 ){
		    				
		    				$.ajax({
		              			url:"listForScroll.do",
		              			dataType:"json",
		              			data:{
		              				pageNo:pageNo
		              			}
		              		}).done(function(result) {
		              			
		              			var list = result;
		              			var html="";
		              			
		              			if(list.length){
			              			for(var i=0;i<list.length;i++) {
			              				
					              			html+='<div class="post-masonry col-md-4 col-sm-6">';
					              			html+='<div class="blog-thumb">';
					              			 
					              			if(list[i].content != 'x') {
					              				html+=list[i].content;
					              			}
					              			if(list[i].content == 'x') {
					              				html+='<img src="${pageContext.request.contextPath}/web/image/diary/background2.jpg" width="350px" height="215px" id="img1" alt="">';
					              			}
					                                
						                     html+='           <div class="overlay-b">                                                                                         ';
						                     html+='               <div class="overlay-inner">                                                                                 ';
						                     html+='                   <a href="blog-single.html" class="fa fa-link"></a>                                                      ';
						                     html+='               </div>                                                                                                      ';
						                     html+='           </div>                                                                                                          ';
						                     html+='       </div>                                                                                                              ';
						                     html+='       <div class="blog-body">                                                                                             ';
						                     html+='           <div class="box-content" style="margin:0 !important;">                                                          ';
						                     html+='               <h3 class="post-title"><a href="detail.do?diaryNo='+list[i].diaryNo+'" >'+list[i].title+'</a></h3> ';     
						                     html+='               <span class="blog-meta">'+list[i].diaryDate+'</span>  ';
						                     html+='           </div>                                                                                                          ';
						                     html+='       </div>';                                                                                                              
						                     html+='   </div> ';
			              			}
		              			
			              			$("#diaryBox").append(html);
	// 		              			console.log("html : " ,html);
			              			html="";
			              			pageNo++;
		              			}
		              			
		              		}); // 아잭스 끝
		    				
		    			} // if 문 끝
		    			
		    		}); // 스크롤 이벤트 끝
              </script>
              
              
              <!-- 페이징 소스 -->
              <!-- 
              <div class="row">
                   
                    <div class="col-md-11">
                        	 <div class="text-center">
		                            <ul class="pagination pagination-lg mtm mbm">
	  									<c:choose>
	  										<c:when test="${pageResult.prev}">
	                                   		 	<li class=""><a href="#">&laquo;</a></li>
	  										</c:when>
	  										<c:otherwise>
	                                   		 	<li class="disabled"><a href="#">&laquo;</a></li>
	  										</c:otherwise>	
	  									</c:choose>
			   								<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}" >
			   									<c:choose>
			   										<c:when test="${i eq pageResult.pageNo}">
				                            	    	<li class="active"><a href="list.do?pageNo=${i}">${i}</a></li>
			   										</c:when>
			   										<c:otherwise>
					                            	    <li><a href="list.do?pageNo=${i}">${i}</a></li>
			   										</c:otherwise>
			   									</c:choose>
			   								</c:forEach>
	                                    <c:choose>
	  										<c:when test="${pageResult.next}">
			                                    <li class=""><a href="#">&raquo;</a></li>
	  										</c:when>
	  										<c:otherwise>
			                                    <li class="disabled"><a href="#">&raquo;</a></li>
	  										</c:otherwise>	
	  									</c:choose>
		                            </ul>
	                    	</div>
                   </disv>
                    
                    
                    <!--  
				    <div class="col-md-12">
				   			<br>
				    		
			    			<span class="glyphicons glyphicons-show-thumbnails"></span>
							<span class="glyphicons glyphicons-justify"></span>
	                       
			    	</div>
					                      
                </div> 
				-->

		      <br><br><br><br>
		      <br><br><br><br>
		        	
        </div>
    </section>
    
    
      <aside style="position: fixed;left:80px;top:200px;">
			<ul class = "list-group" style="width: 200px;">
			   <li class = "list-group-item active" style="text-align: center;">자기 관리 순위</li>
			  
			   <li class = "list-group-item">	
			   		<span class="badge badge-danger pull-left">1</span>
            		&nbsp;&nbsp; admin
  			      <span class = "badge"><a href="javascript:addFriend('admin');">친구 추가</a></span>
			   </li>
			  
			   <li class = "list-group-item">
			   		<span class="badge badge-warning pull-left">2</span>
			   		&nbsp;&nbsp;durad han
			      <span class = "badge"><a href="javascript:addFriend('durad han');">친구 추가</a></span>
			   </li>
			   
			   <li class = "list-group-item">
				    <span class="badge badge-info pull-left">3</span>
				    &nbsp;&nbsp;손광석
			      <span class = "badge"><a href="javascript:addFriend('손광석');">친구 추가</a></span>
			   </li>
			   
			   <li class = "list-group-item">
			   	    <span class="badge badge-danger pull-left">4</span>
			   	    &nbsp;&nbsp;한선재
			        <span class = "badge"><a href="javascript:addFriend('한선재');">친구 추가</a></span>
			   </li>
			   
			   <li class = "list-group-item">
			      <span class="badge badge-info pull-left">5</span>
			      &nbsp;&nbsp;김현영
			      <span class = "badge"><a href="javascript:addFriend('김현영');">친구 추가</a></span>
			   </li>
			</ul>      
		</aside>

	<button type="button" id="showList">친구 목록</button>
	<div id="addDiv">
		<input type="text" id="friend" /><button type="button" id="addFriend">친구 추가</button>
	</div>
	
	<div id="list"> 
	</div>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
    
	<!-- diary.js -->
	
	<script>
	    //<![CDATA[
	    $(window).load(function() { // makes sure the whole site is loaded
	        $('.loader-item').fadeOut(); // will first fade out the loading animation
	            $('#pageloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
	        $('body').delay(350).css({'overflow-y':'visible'});
	    })
	    //]]>
	</script>
	
    <script src="${pageContext.request.contextPath}/web/js/diary/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/web/js/diary/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
	
	
	<script>
	var myId = "admin";
	</script>
	<script src="${pageContext.request.contextPath}/web/js/chat/chat.js"></script>
		
	
</div>

<c:import url ="/WEB-INF/jsp/common/bottomInclude.jsp"/>
</body>

</html>

