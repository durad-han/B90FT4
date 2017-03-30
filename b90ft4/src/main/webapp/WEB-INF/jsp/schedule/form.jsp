<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="sForm" action='scheduleForm.do' method='post'>
		<table class="table table-no-border">
		<tr>
			<td class="td-txt-right td-wp10">제목</td> 
		 	<td>
		 		<div class="form-group">
		 			<input type='text' name='title' class="form-control input-wp1" />
		 		</div>
		 	</td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">시간</td>
		 	<td>
		 		<div class="form-group">
		 			<input type='text' name='timeRange' class="min-date"/>
		 			<input type='text' name='timeRange' class="max-date"/>
		 		</div>
		 	</td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">내용</td>
		 	<td><div class="form-group">
		 		<textarea name='content' rows='5' cols='70' class="form-control"></textarea>
		 		</div>
		 	</td>
		</tr>
		</table>
		
		<div class="row">
		    <div class="col-md-10"></div>
		    <div class="col-md-2">
				<button class="btn btn-primary btn-lg">등록</button>
		    </div>
		</div>
	</form>

<script>
document.sForm.onsubmit = function () {
	var f = document.sForm;
	if (isEmpty(f.title, "제목을 입력하세요")) return false;
	if (isEmpty(f.timeRange, "시간을 설정하세요")) return false;
	return true;
};
</script>
</body>
</html>