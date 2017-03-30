<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/web/view/common/basicInclude.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header {
	width:100%;
	border:1px solid black;
}

section {
	width:100%;
	position: relative;
}

body > section > nav{
	border:1px solid black;
	width:15%;
	height:800px;
	float: left;
}

body > section > nav > ul{
	list-style: none;
	margin:0 auto;
}
body > section > nav > ul > li{
	width:100%;
	height:100px;
	border: 1px solid black;
}

body > section > article{
	border:1px solid black;
	width:84%;
	height:800px;
	float:left;
	margin-left: 0.6%;
	overflow: auto;
	position: relative;
}
body > section > > article > article{
	position: relative;
}
#budgetBtn {
	position: absolute;
	right:8%;
}

#budgetRegiForm{
	width:200px;
	height:250px;
	border:1px solid black;
	display: none;
}

</style>
</head>
<body>
	<header>
		<h1>헤더</h1>	
	</header>
	<br>
	<br>
	
	<section>
	
		<nav>
			<ul>
				<li>
					전체
				</li>
				<li>
					<a href="budget.do">
						비용/지출
					</a>
				</li>
				<li>
					대입금/차입금
				</li>
				<li>
					가계 메모
				</li>
			</ul>
		</nav>
		
		<article>
				<c:choose>
					<c:when test="${not empty budget}">
						<!-- 경로 참조가 조금 다른 것 같다. -->
						<c:import url="myBudget.jsp"/>
					</c:when>
				</c:choose>
		</article>
		
	</section>
	
</body>
</html>