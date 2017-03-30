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
	 	
	 	<div id="budgetRegiForm">
	 		<form name="budgetF" action="">
	 			<input type="radio" name="budgetCode" id="expense" value="1" />
	 			<label for = "expense">
	 				지출
	 			</label>
	 			<input type="radio" name="budgetCode" id="income" value="2" />
	 			<label for = "income">
	 				수입
	 			</label>
	 			<br>
	 			분류 
	 			<select id="category" style="width:100px">
	 			</select>
	 			<br>
	 			금액
	 			<input type="text" name="amount"/>
	 			<br>
	 			내용
	 			<input type="text" name="content"/>
	 			<br>
		 			<button>전송</button>
		 			
		 			<button type="button" id="close">닫기</button>
	 		</form>
	 	</div>
	 	
	 	
</article>	 

	<script>
	
		var isSelected = false;
		var dragging = false;
		var diff={};
		
		$("#close").click(function(){
			$("#budgetRegiForm").hide();
		})
		
		$("#category").mousedown(function(e){
			console.log("셀렉박스");
			e.stopPropagation();
		})
		
		$("#budgetBtn").click(function() {
			
			$("#budgetRegiForm").show();
			$("#budgetRegiForm").siblings().css(
					{
						"background-color" : "grey"
					})
			
			$("#budgetRegiForm").mousedown(function(e){
				
				m = $("section > article").offset().left;
				n = $("section > article").offset().top;
				
				diff.x=e.offsetX;
				diff.y=e.offsetY;
				
				isSelected = true;
				
				$("#budgetRegiForm").mousemove(function(e){
					if(!isSelected) return;
					
					if(!dragging){
						dragging=true;
					}	
				
					
		 			$("#budgetRegiForm").css({
		 				"position" : "absolute",
		 				left : (e.clientX-m) - diff.x,
		 				top : (e.clientY-n) - diff.x,
		 			})
		 		
				});
				
				$("#budgetRegiForm").mouseup( function(e){
					
					if(!isSelected) return;
					
					isSelected = false;
					
					if(dragging) 
						dragging = false;
					
					console.log("오프");
					
					$(this).off("mousemove");
					$(this).off("mouseup");
				});
			});
			
			
		});
		
		
		
		
		
	</script>	 
	
	
	
	 
	 