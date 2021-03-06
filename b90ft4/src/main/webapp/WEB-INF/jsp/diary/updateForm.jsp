<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Freelancer - Start Bootstrap Theme</title>


	<%@include file="/WEB-INF/jsp/common/topInclude.jsp"%>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
	
	<!-- summber note -->
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
	<style>
		.modal-backdrop{
			z-index: 0 !important;
		}
		#attachFileList {
			border:1px solid black;
			width: 300px;
			height:200px;
			margin:0 auto;
		}
	</style>
</head>

<body id="page-top" class="index">

<%-- <div class="container" style='background:url("${pageContext.request.contextPath}/web/image/accountBook/가계부 배경2.jpg") no-repeat;background-size:100%'> --%>
<div class="container">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
    <%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>
   
    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
         <div class = "page-header">
				   <h1>
						Diary 수정
				   </h1>
		</div>
                	
        <form name="uForm" action='${pageContext.request.contextPath}/diary/update.do' method='post'>
       		<input type="hidden" name="diaryNo" value="<c:out value="${diaryVO.diaryNo}"/>" /> 
			<input type="hidden" name="userId" value="<c:out value="${diaryVO.userId}"/>" /> 
			<table class="table table-no-border">
			<tr>
				<td class="td-txt-right td-wp8">제목</td> 
			 	<td>
			 		<div class="form-group">
			 			<input type='text' name='title' class="form-control input-wp1" value="${diaryVO.title}" required/>
			 		</div>
			 	</td>
			</tr>
				<!-- 날씨정보 입력 -->
			<tr>
				<td class="td-txt-right td-wp8">날씨</td>
			 	<td>
			 		<div class="form-group">
			 			<input type='radio' id="sunny" name='weatherCode' value='1' checked />
			 			<label for="sunny"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/weather/weather1.jpg"/>
			 			</label>
			 			
			 			<input type='radio' id="cloud" name='weatherCode' value='2' />
			 			<label for="cloud"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/weather/cloud.jpg"/>
			 			</label>

			 			<input type='radio' id="rain" name='weatherCode' value='3' />
			 			<label for="rain"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/weather/rain.jpg"/>
						</label>

			 			<input type='radio' id="snow" name='weatherCode' value='4' />
			 			<label for="snow"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/weather/snow.jpg"/>
			 			</label>

			 			<input type='radio' id="hail" name='weatherCode' value='5' />
			 			<label for="hail"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/weather/hail.jpg"/>
			 			</label>
			 			
			 		</div>
			 	</td>
			</tr>
			<tr>
				<td class="td-txt-right td-wp8">상태</td>
			 	<td>
			 		<div class="form-group">
			 			<input type='radio' id="super" name='emotionCode' value='1' checked/>
			 			<label for="super"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/super.jpg"/>
			 			</label>
			 			
			 			<input type='radio' id="happy" name='emotionCode' value='2' />
			 			<label for="happy"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/happy.jpg"/>
			 			</label>
			 			
			 			<input type='radio' id="lol" name='emotionCode' value='3' />
			 			<label for="lol"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/lol.jpg"/>
						</label>
			 			<input type='radio' id="sad" name='emotionCode' value='4' />
			 			<label for="sad"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/sad.jpg"/>
			 			</label>
			 			<input type='radio' id="angry" name='emotionCode' value='5' />
			 			<label for="angry"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/angry.jpg"/>
			 			</label>
			 			<input type='radio' id="despair" name='emotionCode' value='6' />
			 			<label for="despair"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/despair.jpg"/>
			 			</label>
			 			<input type='radio' id="cry" name='emotionCode' value='7' />
			 			<label for="cry"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/cry.jpg"/>
			 			</label>
			 			<br>
			 			<input type='radio' id="boring" name='emotionCode' value='8' />
			 			<label for="boring"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/boring.jpg"/>
			 			</label>
			 			<input type='radio' id="love" name='emotionCode' value='9' />
			 			<label for="love"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/love.jpg"/>
			 			</label>
			 			<input type='radio' id="surprise" name='emotionCode' value='10' />
			 			<label for="surprise"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/surprise.jpg"/>
			 			</label>
			 			<input type='radio' id="sick" name='emotionCode' value='11' />
			 			<label for="sick"> 
			 			<img src="${pageContext.request.contextPath}/web/image/diary/emotion/sick.jpg"/>
			 			</label>
			 		</div>
			 	</td>
			</tr>
			<tr>
				<td class="td-txt-right td-wp10">내용</td>
			 	<td id="editor">
			   		 <div id="summernote">
			   		 	${diaryVO.content}
			   		 </div>

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
			
			<textarea style="display: none;" name="content" id="realContent">
				
			</textarea>
			
		</form>
		        	
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
	<script>
	
	   var imgArr=[];
	   var delImgArr=[];	
	   
	   console.log("로딩되면 자동으로..");
	   

	   $("#updateBtn").click(function() {
//	    	console.log($("div.note-editing-area div:last").html());
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
		    		data:{delPath:delImgArr[i]},
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
//		   console.dir(imgArr);
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
	    	
//	    	$.ajax({
//	    		url:"/b90ft4/diary/delImg.do",
//	    		data:{delPath:path}
//	    	}).done(function(result) {
////	     		console.log("result",result);
//	    	});
	    	
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
  
  <script src="${pageContext.request.contextPath}/web/js/memo/memo.js"> </script>
	
	
</div>
</body>

</html>
