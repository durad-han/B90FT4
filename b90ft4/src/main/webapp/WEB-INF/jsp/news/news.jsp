<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Cog + I</title>
    
<c:import url ="/WEB-INF/jsp/common/topInclude.jsp"/>

<style>
	#portfolio button{
		width: 100px;
		height: 50px;
		margin-right: 15px;
	}
</style>
	
</head>

<body id="page-top" class="index">

<div class="container">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
        	<br><br>
			<div class="row">
			
			    <h2>횟 감 같은 뉴스를 보세요!</h2>
			    <br>
		    	<button onclick="makeNews('rss')"       class="btn" style="background:white !important;"> 속보 </button>
				<button onclick="makeNews('today')"        class="btn" > 오늘의뉴스 </button>
				<button id="IT" onclick="makeNews('it')"   class="btn" style="background:yellow !important;"> IT </button>
                <button onclick="makeNews('culture')"   class="btn btn-primary">culture</button>
                <button onclick="makeNews('politics')"  class="btn btn-info">politics</button>
                <button onclick="makeNews('life')"	    class="btn btn-success">life</button>
                <button onclick="makeNews('engilshNews')" class="btn btn-warning">engilshNews</button>
			    
			    <hr>
				    <section id="pinBoot">
					  
				    </section>
			    <hr>
		</div>
			
		        	
        </div>
    </section>
    

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>


	
</div>

<script src="${pageContext.request.contextPath}/web/js/main/news.js"></script>
<c:import url ="/WEB-INF/jsp/common/bottomInclude.jsp"/>
</body>

</html>
