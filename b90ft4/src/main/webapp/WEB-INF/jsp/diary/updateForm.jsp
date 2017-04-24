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
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/web/css/diary/detail.css">
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>
<style>
#attachFileList {
	border:1px solid black;
	width: 300px;
	height:200px;
	margin:0 auto;
}
</style>
</head>
<body>
    <div>
        <!--BEGIN THEME SETTING-->
        <div id="theme-setting">
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
						<div class="content">
		<ol class="breadcrumb">
		  <li><a href="http://14.32.66.123:9092/b90ft4/main/main.do">Home</a></li>
		  <li class="active">자유게시판</li>
		</ol>	
		
		<form name='uForm' action='update.do' method='post'>
			<input type="hidden" name="diaryNo" value="<c:out value="${diaryVO.diaryNo}"/>" /> 
			<input type="hidden" name="userId" value="<c:out value="${diaryVO.userId}"/>" /> 
			<table class="table table-no-border">
			<tr>
				<td class="td-txt-right td-wp10">제목</td> 
			 	<td>
			 		<div class="form-group">
			 			<input type='text' name='title' class="form-control input-wp1" value="<c:out value="${diaryVO.title}"/>" />
			 		</div>
			 	</td>
			</tr>
			<tr>
				<td class="td-txt-right td-wp10">내용</td>
			 	<td><div class="form-group">
				 		<div id="summernote">
				   			${diaryVO.content}	 
				   		</div>
			 		
			 		
			 		<textarea style='display:none;' name='content'
			 		></textarea>
			 		</div>
			 	</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
			 		<div id="attachFileList">
							<ul>
							</ul>
					</div>
				</td>
			</tr>
			</table>
			
			<div class="row">
			    <div class="col-md-10"></div>
			    <div class="col-md-2">
					<button class="btn btn-primary btn-lg" type="button" id="updateBtn">수정</button>
					<a href='list.do' id="check" class="btn btn-info btn-lg">목록</a>
			    </div>
			</div>
		</form>
				<!-- 날씨정보 입력 -->
<!-- 				<td class="td-txt-right td-wp10">날씨</td> -->
<!-- 			 	<td> -->
<!-- 			 		<div class="form-group"> -->
<!-- 			 			<label for="sunny">  -->
<!-- 			 			<input type='radio' name='weather' value='sunny' /> -->
<%-- 			 			<img src="${pageContext.request.contextPath}/web/image/diary/weather1.jpg"/> --%>
<!-- 			 			</label> -->
			 			
<!-- 			 			<label for="cloud">  -->
<!-- 			 			<input type='radio' name='weather' value='cloud' /> -->
<%-- 			 			<img src="${pageContext.request.contextPath}/web/image/diary/cloud.jpg"/> --%>
<!-- 			 			</label> -->
			 			
<!-- 			 			<label for="rain">  -->
<!-- 			 			<input type='radio' name='weather' value='rain' /> -->
<%-- 			 			<img src="${pageContext.request.contextPath}/web/image/diary/rain.jpg"/> --%>
<!-- 						</label> -->
<!-- 			 			<label for="rain">  -->
<!-- 			 			<input type='radio' name='weather' value='snow' /> -->
<%-- 			 			<img src="${pageContext.request.contextPath}/web/image/diary/snow.jpg"/> --%>
<!-- 			 			</label> -->
<!-- 			 			<label for="rain">  -->
<!-- 			 			<input type='radio' name='weather' value='hail' /> -->
<%-- 			 			<img src="${pageContext.request.contextPath}/web/image/diary/hail.jpg"/> --%>
<!-- 			 			</label> -->
<!-- 			 		</div> -->
<!-- 			 	</td> -->
	</div>
                <!--END CONTENT-->
                <!--BEGIN FOOTER-->
                <!--END FOOTER-->
            </div>
            <!--END PAGE WRAPPER-->
        </div>
    </div>
    <script>
 	   var imgArr=[];
	   var delImgArr=[];	
 	   
 	   console.log("로딩되면 자동으로..");
 	   

 	   $("#updateBtn").click(function() {
//  	    	console.log($("div.note-editing-area div:last").html());
 		  	var pathArr = [];
  		
	  		$("div.note-editing-area div:last img").each(function() {
	  			
	  			var src = this.src;
	  			var ix = src.indexOf("/b90ft4");
	  			src = src.substring(ix);
	//   			console.log("src :",src);
	
	  			pathArr.push(src);
	  			
	  			delete imgArr[src];
	  			
	  		});
	  		
	  		console.log("삭제후 확인");
	  		console.dir(imgArr);
  		
	  		for(var k in imgArr){
	  			var src = imgArr[k].src;
	  			var ix = src.indexOf("/b90ft4");
	  			src = src.substring(ix);
	  			
	  			$.ajax({
	  				url:"/b90ft4/diary/delImg.do",
	  				data:{delPath:src},
	  				async:false
	  			}).done(function(result) {
	  				console.log("result",result);
	  			});
	  		}
  		
	  		// 옮길 이미지 ajax
	  		for(var i=0;i<pathArr.length;i++) {
	  			
	  			$.ajax({
	  				url:"/b90ft4/diary/saveImg.do",
	  				data:{
	  					tempPath:pathArr[i]
	  				},
	  				async:false
	  			}).done(function(result) {
	  				console.log(result);				
	  			});	
	  		}
	  		
	  		
	  		for(var i=0;i<delImgArr.length;i++) {
		    	$.ajax({
		    		url:"/b90ft4/diary/delImg.do",
		    		data:{delPath:path},
		    		async:false
		    	}).done(function(result) {
	//	     		console.log("result",result);
		    	});
	  		}
	  		
	  		
			$("[name=content]").val($("div.note-editing-area div:last").html());
			
			var f = document.querySelector("[name=uForm]");
			console.log("전송");
			f.submit();
	

 	   });
 	   
 	   
 	   
 	   $("#check").click(function(e){
//  		   console.dir(imgArr);
 	   });
 	   

	    $('#summernote').summernote({
	    	  callbacks: {
	    	    onImageUpload: function(files) {
	//     		upload image to server and create imgNode...
	//     		     console.log(files);
	    		     
	    		     var fd = new FormData();
	    		     
	    		     for(var i=0,f; f = files[i];i++){
	    			     fd.append("attachFile"+i,files[i]);
	    		     }
	    		     
	    		     $.ajax({
	    		    	 url:"/b90ft4/diary/img2.do",
	    		    	 type:"POST",
	    		    	 data: fd,
	    		    	 processData: false,
	    		    	 contentType : false,
	    		    	 dataType:"json",
	    		    	 async:false
	    		     }).done(function(result) {
	    		    	 
	    		    	 console.log(result);
	    		    	 
	    		    	 for(var i=0; i < result.length;i++){
	    		    		 
	    		    		 var img = document.createElement("img");
	    		    		 img.src = result[i];
	    		    		 img.setAttribute("oriname",files[i].name);
	    				     $('#summernote').summernote('insertNode', img);
	    				     imgArr[result[i]]=img;
	    				     
	    					 $("#attachFileList > ul ")
	    					 .append(
	    					  $("<li>"+files[i].name+"</li>")
	    					  .append("<button id='del' imgPath="+result[i]+" onclick='delImg(this)'>삭제</button>")
	    					 );
	    					 
	    			     }
	    		     });
	    	     }
	    	  }
	    });
	    
	    function delImg(that) {
	    	
	    	console.log("삭제");
	    	
	    	var path = that.getAttribute("imgPath");
	    	delImgArr.push(path);
	    	var delImg = imgArr[path]; // 이미지 객체 반환.
	    	
// 	    	$.ajax({
// 	    		url:"/b90ft4/diary/delImg.do",
// 	    		data:{delPath:path}
// 	    	}).done(function(result) {
// //	     		console.log("result",result);
// 	    	});
	    	
	    	$(delImg).remove(); // 웹 에디터 이미지 삭제.
	    	that.parentNode.parentNode.removeChild(that.parentNode); // 버튼 삭제
	    		
	    }

	    
	    
 	   $(function() {
	 	   $("div.note-editing-area div:last").find("img").each(function(){
				var src = this.src;
				var ix = src.indexOf("/b90ft4");
				src = src.substring(ix);
	
				imgArr[src] = this;
				console.log("src",src);
	
				 $("#attachFileList > ul ")
				 .append(
				  $("<li>"+this.getAttribute("oriname")+"</li>")
				  .append("<button id='del' imgPath="+src+" onclick='delImg(this)'>삭제</button>")
				 );
			});   
 	   });
	    
	    
	    
	    
	    
    </script>
    
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-1.10.2.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-migrate-1.2.1.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery-ui.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/bootstrap.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/bootstrap-hover-dropdown.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/html5shiv.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/respond.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.metisMenu.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.slimscroll.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.cookie.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/icheck.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/custom.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.news-ticker.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.menu.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/pace.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/holder.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/responsive-tabs.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.categories.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.pie.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.tooltip.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.resize.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.fillbetween.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.stack.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jquery.flot.spline.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/zabuto_calendar.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/index.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/data.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/drilldown.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/exporting.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/highcharts-more.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-pie.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/charts-highchart-more.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/modernizr.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jplist.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/web/bootstrap/KAdmin-Dark/script/jplist.js"></script> --%>

    <!--CORE JAVASCRIPT-->
    <script src="script/main.js"></script>


</body>
</html>
