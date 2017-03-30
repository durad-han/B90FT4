<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<%@ include file="/jsp/include/basicInclude.jsp" %>
</head>
<body>
<div class="container">
	
	
	<div class="content">
		<ol class="breadcrumb">
		  <li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
		  <li class="active">다이어리</li>
		</ol>
		<table class="table table-no-border">
		<tr>
			<td class="td-txt-right td-wp10">번호</td>
		 	<td><c:out value="${diaryVO.no}"/></td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">제목</td>
		 	<td><c:out value="${diaryVO.title}"/></td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">내용</td>
		 	<td><c:out value="${diaryVO.content}"/></td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">첨부파일</td>
		 	<td><a href="${pageContext.request.contextPath}/upload${file.filePath}/${file.systemName}">${file.oriName}</a>(${file.fileSize} byte)</td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">날씨</td>
		 	<td><c:out value="${diaryVO.img}"/></td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">등록일</td>
		 	<td><fmt:formatDate value="${diaryVO.regDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
		</tr>
		</table>
		
		<div class="row">
		    <div class="col-md-9"></div>
		    <div class="col-md-3">
				<a href='updateForm.do?no=${param.no}' class="btn btn-success btn-lg">수정</a>
				<a href='delete.do?no=${param.no}' class="btn btn-danger btn-lg">삭제</a>
				<a href='list.do' class="btn btn-info btn-lg">목록</a>
		    </div>
		</div>
		<hr>	

		
		
	</div>
	
<script type="../../js/schedule/schedule.js"></script>		
</div>
</body>
</html>