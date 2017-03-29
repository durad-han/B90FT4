<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<article>
	<br><br><br><br>
	<div id="budget" style="width:60%;margin:0 auto;">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>분류</th>
						<th>내용</th>
						<th>금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Table cell</td>
						<td>Table cell</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Table cell</td>
						<td>Table cell</td>
					</tr>
				</tbody>	
				</table>
		</div>
	 </div>
	 
	 	<button id="budgetBtn" type="button">
	 		<img src="${pageContext.request.contextPath}/web/image/accountBook/addBtn.jpg">
	 	</button>
	 	
	 	
	 	
	 	
	 	<div id="budgetPop" style="display: block;">
	 		<form name="budgetF" action="">
	 			<input type="radio" name="type" id="expense" />
	 			<label for = "expense">
	 				지출
	 			</label>
	 			<input type="radio" name="type" id="income"/>
	 			<label for = "income">
	 				수입
	 			</label>
	 			<br>
	 			분류 
	 			<select id="category">
	 				<option>	</option>
	 			</select>
	 			<br>
	 			금액
	 			<input type="text" name="amount"/>
	 			<br>
	 			내용
	 			<input type="text" name="content"/>
	 			<br>
	 		</form>
	 	</div>
	 	
	 	
<article>	 
	<script>
	
	
		$("#budgetBtn").click(function() {
		
			
			
		});
	</script>	 
	
	
	
	 
	 