

var selectedOption=1;
	

	
/* 지출-수입 입력 */
	var budgetCode=0;
	
	$("#budgetRegi").click(function() {
		
		if(selectedOption!=1){
			alert("일 을 선택하세요");
			return;
		}
		
		var f = document.budgetF;
		console.log("등록");
		$("[name=budgetF] input:eq(4)").val($("#actualDate").val());
		
		if(isEmpty(eval("f."+$("[name=budgetF] input:eq(4)").attr("name")),"날짜를 선택하세요")) return;
	
		if(isEmpty(eval("f."+$("[name=budgetF] input:eq(2)").attr("name")),"금액을 입력하세요")) return;
		
		var params = $("[name=budgetF]").serialize();
		var path="";
		
		if(budgetCode==0){
			path="expenseRegi.do";
		}else{
			path="incomeRegi.do";
		}
		
		console.log("params",params);
		console.log("path",path);
		
		$.ajax({
			url: path,
			type:"POST",
			contentType: "application/x-www-form-urlencoded",
			data:params,
			async:false
		}).done(function(msg){
			console.log(msg);
		});
		console.log("ㅋ");
		$("#closeF").trigger("click");
		
		
		$("[name=budgetF] input:eq(2)").val("");
		$("[name=budgetF] input:eq(3)").val("");
		budgetList("",$("#actualDate").val());
		
	});




/*  달력 만들기 자바스크립트  */

	var selectCurrentWeek = function() {
	    setTimeout(function () {
	        $('#datepicker').find('.ui-datepicker-current-day a').addClass('ui-state-active')
	    }, 1);
	}
	
	var style = '<style id="hidden"> table.ui-datepicker-calendar { display:none; } </style>'
	var datepicker_default;
	var startDate;
	var endDate;
	var flag=1;

	function makeCalendar(type){
		datepicker_default = {
				showOn: 'button',
				buttonText: "달력",
				currentText: "이번달",
				closeText : "선택" ,
				dateFormat: 'yy-mm-dd',
				firstDay: 0,
				isRTL: false,
				showMonthAfterYear: true,
				changeMonth: true,
				changeYear: true,
				showOtherMonths: true,
				selectOtherMonths: true,
				gotoCurrent:true,
				monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
				     		'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	     		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	     					'7월','8월','9월','10월','11월','12월'],
	     		dayNames: ['일','월','화','수','목','금','토'],
	     		dayNamesShort: ['일','월','화','수','목','금','토'],
	     		dayNamesMin: ['일','월','화','수','목','금','토'],
	     		onSelect : function(dateText, inst) { 
	     			console.log("flag",flag);
	     			if(flag==1) {
	     				var date = $("#datepicker").datepicker('getDate');
	     				console.log(date);
	     				var dateFormat = 'yy-mm-dd';
		    			var result = $.datepicker.formatDate( dateFormat, date );
		    			console.log("result",result);
		    			$("[id=actualDate]").val(result);
		    			budgetList("",result);
	     			}
	     			if(flag==2) {
		    			var date = $(this).datepicker('getDate');
		                startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
		               	endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
		               	var dateFormat = 'yy-mm-dd';
		    			var result = $.datepicker.formatDate( dateFormat, startDate ) + " - " + $.datepicker.formatDate( dateFormat, endDate);
		    			$("[id=actualDate]").val(result);
		                selectCurrentWeek();
		     		}
	            },
				onChangeMonthYear: function(year, month) {
					if(flag==3){
					$("[id=actualDate]").val(year+"-"+ ( month < 10 ? "0"+month : month));
					}
				},
	            beforeShowDay: function(date) {
	                var cssClass = '';
	                if(date >= startDate && date <= endDate)
	                    cssClass = 'ui-datepicker-current-day';
	                return [true, cssClass];
	            }
	     		
		}
		
	    $('#datepicker .ui-datepicker-calendar tr').on('mousemove', function() { $(this).find('td a').addClass('ui-state-hover'); });
	    $('#datepicker .ui-datepicker-calendar tr').on('mouseleave', function() { $(this).find('td a').removeClass('ui-state-hover'); });
	
	}
	
	makeCalendar();
	$("#datepicker").datepicker(datepicker_default);
	
	$("#day").trigger("click");
	
	$("#day").click(function() {
		$("head > style#hidden").remove();
		flag = 1;
	});
	
	$("#week").click(function() {
		$("head > style#hidden").remove();
		flag = 2
	});
	
	$("#month").click(function() {
		$("head").append(style);
		flag = 3;
	});
	
	/*  현재 날짜 인풋 박스 입력*/
	
	var date = $("#datepicker").datepicker("getDate");
	var today = $.datepicker.formatDate( "yy-mm-dd", date);
	console.log("today",today);
	$("#actualDate").val(today);
	

/* 입력 양식, 셀렉박스 옵션 만들기.*/
	
	var esOpt="";
	var icOpt="";
	
	$.ajax({
		url:"budgetCtgy.do",
		dataType:"json",
		data:{userId : "admin"},
		async:false
	}).done(function(result) {
		
		var es = result.expenseCtgy;
		var ic = result.incomeCtgy;
		
		for(var i=0;i<es.length;i++){
			var temp = es[i];
			esOpt+="<option value='"+ temp.expenseCategoryNo  + "'>"+ temp.expenseCategoryName +"</option>";
		}
		
		for(var i=0;i<ic.length;i++){
			var temp = ic[i];
			icOpt+="<option value='"+ temp.incomeCategoryNo  + "'>"+ temp.incomeCategoryName +"</option>";
		}
		
		$("[name=budgetF] select")
		.attr("name","expenseCategoryNo")
		.html(esOpt);
		
		$("[name=budgetF] input:eq(2)")
		.attr("name","expenseAmount");
		
		$("[name=budgetF] input:eq(3)")
		.attr("name","expenseContent");

		$("[name=budgetF] input:eq(4)")
		.attr("name","expenseDate");
		
	});
	
	$("[name=budgetCode]").click(function(e) {
		
		if($(this).val()==0) {
			
			budgetCode=0;
			
			$("[name=budgetF] select")
			.attr("name","expenseCategoryNo")
			.html(esOpt);
			
			$("[name=budgetF] input:eq(2)")
			.attr("name","expenseAmount");
			
			$("[name=budgetF] input:eq(3)")
			.attr("name","expenseContent");

			$("[name=budgetF] input:eq(4)")
			.attr("name","expenseDate");
			
		}else{
			
			budgetCode=1;
		
			$("[name=budgetF] select")
			.attr("name","incomeCategoryNo")
			.html(icOpt);
			
			$("[name=budgetF] input:eq(2)")
			.attr("name","incomeAmount");
			
			$("[name=budgetF] input:eq(3)")
			.attr("name","incomeContent");
			
			$("[name=budgetF] input:eq(4)")
			.attr("name","incomeDate");
			
		}
		
		
	});
	
/* 오늘 지출-수입 테이블 로딩*/

	 function colorChoice(ctgyNo){
	
		var labelColor="";
		
		switch(ctgyNo){
			case 1:
				labelColor = "label label-red";
				break;
			case 2:
				labelColor = "label label-violet";
				break;
			case 3:
				labelColor = "label label-orange";
				break;
			case 4:
				labelColor = "label label-green";
				break;
			case 5:
				labelColor = "label label-blue";
				break;
		}
		return labelColor;
	}
	
	
	function budgetList(userId, date){
		
		$.ajax({
			url:"budgetList.do",
			dataType:"json",
			data : {
				userId:"김현영",
				startDate: date
			},
			assync:false
		}).done(function (result) {
			
			var expense = result.expense;
			var income = result.income;
			
			var expenseHtml="";
			var incomeHtml="";

			var expenseSum =0;
			var incomeSum =0;
			
			
			if(expense.length!=0){
				for(var i=0;i<expense.length;i++){
				
					expenseHtml+="<tr>";
					expenseHtml+="<td class='expenseNo' style='display:none;'>"+expense[i].expenseNo+"</td>";
					expenseHtml+="<td class='expenseCategoryNo' style='display:none;'>"+expense[i].expenseCategoryNo+"</td>";
					expenseHtml+='<td><span class="'+colorChoice(expense[i].expenseCategoryNo)+'">'+expense[i].expenseCategoryName+'</span></td>';
					expenseHtml+="<td>"+expense[i].expenseContent+"</td>";
					expenseHtml+="<td>"+expense[i].expenseAmount+"</td>";
					expenseSum+=expense[i].expenseAmount;
					expenseHtml+="</tr>";
				
				}
				
				expenseHtml+="<tr>";
				expenseHtml+="<th>합계</th>";
				expenseHtml+="<td></td>";
				expenseHtml+="<td>"+expenseSum+"</td>";
				expenseHtml+="</tr>";
				
				
			}else{
				expenseHtml+="<tr>";
				expenseHtml+='<td colspan="3">지출 내역이 없습니다.</td>';
				expenseHtml+="</tr>";
			}
			
			if(income.length!=0){
				for(var i=0;i<income.length;i++){
					incomeHtml+="<tr>";
					incomeHtml+="<td class='incomeNo' style='display:none;'>"+income[i].incomeNo+"</td>";
					incomeHtml+="<td class='incomeCategoryNo' style='display:none;'>"+income[i].income[i].incomeCategoryNo+"</td>";
					incomeHtml+='<td><span class="'+colorChoice(income[i].incomeCategoryNo)+'">'+income[i].incomeCategoryName+'</span></td>';
					incomeHtml+="<td>"+income[i].incomeContent+"</td>";
					incomeHtml+="<td>"+income[i].incomeAmount+"</td>";
					incomeSum+=income[i].incomeAmount;
					incomeHtml+="</tr>";
				}
				incomeHtml+="<tr>";
				incomeHtml+="<th>합계</th>";
				incomeHtml+="<td></td>";
				incomeHtml+="<td>"+incomeSum+"</td>";
				incomeHtml+="</tr>";
				
			}else {
				incomeHtml+="<tr>";
				incomeHtml+='<td colspan="3">수입 내역이 없습니다.</td>';
				incomeHtml+="</tr>";
			}
			$("tbody#expense").html(expenseHtml);
			$("tbody#income").html(incomeHtml);
			
			$("tbody#expense > tr").click(function(){
				
				$("#updateBudget").show();
				$("#deleteBudget").show();
				$("#budgetRegi").hide();
				
				console.log($(this).children("td.expenseNo").text());
				console.log(today);
				var budgetCode=0;
				
				
				
				$("#budgetModal").trigger("click");
			});
			
			
			$("tbody#income > tr").click(function(){
				
				var budgetCode=1;
				
				console.log($(this).children("td.incomeNo").text());
				console.log(today);
				
				
				
				$("#updateBudget").show();
				$("#deleteBudget").show();
				$("#budgetRegi").hide();
				
				
				
				$("#budgetModal").trigger("click");
			});
			
			
		});	
	}
	
	
	budgetList("",$("#actualDate").val());
	
	

	
	
	
	
	
	
	
	