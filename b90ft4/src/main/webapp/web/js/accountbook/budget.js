


/*  ---------------------------------------  달력 만들기 자바스크립트 -------------------------------------------------------------- */

	var selectCurrentWeek = function() {
	    setTimeout(function () {
	        $('#datepicker').find('.ui-datepicker-current-day a').addClass('ui-state-active')
	    }, 1);
	}
	
	var style = '<style id="hidden"> table.ui-datepicker-calendar { visibility: hidden; } </style>'
	var datepicker_default;
	var startDate;
	var endDate;
	var selectedDateOption=1;
	var i=0;
	var tempDate;

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
	     		
	     			if(selectedDateOption==1) {
	     				
	     				var temp =  $.datepicker.parseDate("yy-mm-dd",dateText);
	     				var today = new Date();
	     					
//	     				console.log(temp);
//	     				console.log(today);
//	     				console.log($.datepicker.formatDate("yy-mm-dd",today) == $.datepicker.formatDate("yy-mm-dd",temp));
	     				
	     				if($.datepicker.formatDate("yy-mm-dd",today) == $.datepicker.formatDate("yy-mm-dd",temp)) {
	     					i = 0;
	     					console.log("1",i);
	     				}else if(today < temp){
	     					i = (Math.ceil((temp.getTime() - today.getTime()) / 1000 / 60 / 60 / 24));
	     					console.log("2",i);
	     				}else if(today > temp){
	     					i = -(Math.ceil((today.getTime() - temp.getTime()) / 1000 / 60 / 60 / 24)) + 1;
	     					console.log("3",i);
	     				}
	     				
	     				var date = $("#datepicker").datepicker('getDate');
	     				var dateFormat = 'yy-mm-dd';
		    			var result = $.datepicker.formatDate( dateFormat, date );
		    			$("[id=actualDate]").val(result);
		    			budgetList("",result);
	     			
	     			}
	     			
	     			if(selectedDateOption==2) {
		    			
	     				var date = $(this).datepicker('getDate');
		                startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
		               	endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
		               	var dateFormat = 'yy-mm-dd';
		    			var result = $.datepicker.formatDate( dateFormat, startDate ) + "~" + $.datepicker.formatDate( dateFormat, endDate);
		    			$("[id=actualDate]").val(result);
		                selectCurrentWeek();
	     			}
	     			
	     			
	            },
				onChangeMonthYear: function(year, month) {
					
					if(selectedDateOption==3){
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
			selectedDateOption = 1;
			console.log("day",
			$(".ui-datepicker-current-day").text()
			);
	});
	
	$("#week").click(function() {
		$("head > style#hidden").remove();
			selectedDateOption = 2;
		var date = $("#datepicker").datepicker("getDate");
//		console.log(date);
		$(".ui-datepicker-current-day").trigger("click");
		
	});
	
	$("#month").click(function() {
		$("head").append(style);
			selectedDateOption = 3;
			
			var date = $("#datepicker").datepicker("getDate");
			$("#actualDate").val((date.getYear()+1900)+"-"+ (((date.getMonth()+1)<10) ? "0"+(date.getMonth()+1) : (date.getMonth()+1)));
	});
	
	
	
	
	
	$("#prev").click(function() {
		switch(selectedDateOption) {
			case 1:
				$("#datepicker").datepicker("setDate",--i);
				$(".ui-datepicker-current-day").trigger("click");
				break;
			case 2:
				break;
			case 3:
				break;
		
		}
	});
	
	
	
	$("#next").click(function() {
		
		switch(selectedDateOption) {
		case 1:
			$("#datepicker").datepicker("setDate",++i);
			$(".ui-datepicker-current-day").trigger("click");
			break;
		case 2:
			break;
		case 3:
			break;
			
		}
	});
	
	
	
/* ------------------------------------------- 현재 날짜 인풋 박스 입력 ---------------------------------------------*/
	
	var date = $("#datepicker").datepicker("getDate");
	var today = $.datepicker.formatDate( "yy-mm-dd", date);
	
	console.log("today",today);
	$("#actualDate").val(today);
	
/* ------------------------------------------------------------------------------------------------------------- */
	
	
/*  --------------------------------------------------------------------------------------------------------- */
	
	var expenseObj = {};
	var incomeObj = {};
	var budgetCodeFordel = 0;
	
/* ------------------------------- 폼 초기화  -------------------------------------------------------*/
	
	function addBudgetName(){
		
		$("[name=budgetCode]").each(function() {
			
			if(this.checked) {
			
				if(this.value==0){
				
					$("[name=budgetF] select")
					.attr("name","expenseCategoryNo")
					.html(esOpt);
					
					$("[name=budgetF] input:eq(2)")
					.attr("name","expenseAmount");
					
					$("[name=budgetF] input:eq(3)")
					.attr("name","expenseContent");
	
					$("[name=budgetF] input:eq(4)")
					.attr("name","expenseDate");
				
				} else{
					
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
				
				return;
				
			}
				
		});
		
		
	}
	
	function initForm(flag){
		
		if(!flag){
			budgetList("",today);
			modAndDelEvent();
		}
		
		addBudgetName();
		$("#updateBudget").hide();
		$("#deleteBudget").hide();
		$("#budgetRegi").show();
		$("[name=budgetF] input:eq(2)").val("");
		$("[name=budgetF] input:eq(3)").val("");
		
	}
	/* -------------------------------------------------------------------------------------------------------------- */
	
	/* -------------------  지출/수입 등록에서 셀렉박스 옵션 만들기.  -----------------------------*/
	
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
	
	/* -------------------------------------------------------------------------------------------------------------- */
	
	// 카테고리별 색상 입히기
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
	
	/* 오늘 지출-수입 테이블 로딩 함수*/
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
			
			// 지출 리스트
			if(expense.length!=0){
				for(var i=0;i<expense.length;i++){
				
					expenseHtml+="<tr class='expenseInfo'>";
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
			
			// 수입 리스트
			if(income.length!=0){
				for(var i=0;i<income.length;i++){
					incomeHtml+="<tr class='incomeInfo'>";
					incomeHtml+="<td class='incomeNo' style='display:none;'>"+income[i].incomeNo+"</td>";
					incomeHtml+="<td class='incomeCategoryNo' style='display:none;'>"+income[i].incomeCategoryNo+"</td>";
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
			
			// 지출/수입 리스트 출력
			$("tbody#expense").html(expenseHtml);
			$("tbody#income").html(incomeHtml);
			
			
			// 지출 수정/삭제를 위한 이벤트 등록
			$("tbody#expense > tr.expenseInfo").click(function(){
				
				$("#updateBudget").show();
				$("#deleteBudget").show();
				$("#budgetRegi").hide();
				
				budgetCodeFordel		  	 = 0;
				expenseObj.expenseNo 		 = $(this).children("td.expenseNo").text();
				expenseObj.expenseDate 	     = today;
				expenseObj.expenseCategoryNo = $(this).children("td.expenseCategoryNo").text();
				expenseObj.expenseContent    = $(this).children("td:eq(3)").text();
				expenseObj.expenseAmount     = $(this).children("td:eq(4)").text();
				
				// 체크하게 만들기
				$("[name=budgetF] [name=budgetCode]").each(function() {
					if(this.value==budgetCodeFordel){
						this.checked = true;
						return;
					}
				});
				
				addBudgetName();
				
				$("[name=budgetF] select").val(expenseObj.expenseCategoryNo);
				$("[name=budgetF] input:eq(2)").val(expenseObj.expenseAmount);
				$("[name=budgetF] input:eq(3)").val(expenseObj.expenseContent);
				$("#budgetModal").trigger("click");
				
			});
			
			
			// 수입 수정/삭제를 위한 이벤트 등록
			$("tbody#income > tr.incomeInfo").click(function(){

				$("#updateBudget").show();
				$("#deleteBudget").show();
				$("#budgetRegi").hide();
				
				budgetCodeFordel		 =	1;
				incomeObj.incomeNo 		 = 	$(this).children("td.incomeNo").text();
				incomeObj.incomeDate 		 =	today;
				incomeObj.incomeCategoryNo  = 	$(this).children("td.incomeCategoryNo").text();
				incomeObj.incomeContent     = 	$(this).children("td:eq(3)").text();
				incomeObj.incomeAmount      =  $(this).children("td:eq(4)").text();
				
				// 체크하게 만들기
				$("[name=budgetF] [name=budgetCode]").each(function() {
					if(this.value==budgetCodeFordel){
						this.checked = true;
						return;
					}
				});
				
				addBudgetName();
				
				$("[name=budgetF] select").val(incomeObj.incomeCategoryNo);
				$("[name=budgetF] input:eq(2)").val(incomeObj.incomeAmount);
				$("[name=budgetF] input:eq(3)").val(incomeObj.incomeContent);
				$("#budgetModal").trigger("click");
				
			});
			
		});	
	}
	
	function modAndDelEvent() {
		
		$("#deleteBudget").click(function (){
			var delNo;
			if(!budgetCodeFordel){
				delNo = expenseObj.expenseNo;
			}else{
				delNo = incomeObj.incomeNo;
			}
			
			$.ajax({
				url:"deleteBudget.do",
				data:{
					budgetCode:budgetCodeFordel,
					delNo : delNo
				}
			}).done(function(result){
				console.log(result);
				initForm();
			})
		});
	
		$("#updateBudget").click(function (){

			var modNo;
			if(!budgetCodeFordel){
				modNo = "&expenseNo="+expenseObj.expenseNo;
			}else{
				modNo = "&incomeNo="+incomeObj.incomeNo;
			}
			
			$("[name=budgetF] input:eq(4)").val(today);

			var f = document.budgetF;
			
			console.log("금액",$("[name=budgetF] input:eq(2)").val());
			console.log("금액",$("[name=budgetF] input:eq(2)").attr("name"));
				
			if(isEmpty(eval("f."+$("[name=budgetF] input:eq(2)").attr("name")),"금액을 입력하세요")) return;
			
			var params = $("[name=budgetF]").serialize();
			console.log("params",params+modNo);
			
			$.ajax({
				url: "updateBudget.do",
				type:"POST",
				contentType: "application/x-www-form-urlencoded",
				data:params+modNo,
				async:false
			}).done(function(msg){
				console.log(msg);
				initForm();
			});

		});
		
		
	}
	
	budgetList("",today);
	modAndDelEvent();
	
	/* -------------------------------------------------------------------------------------------------------------- */
	
	
	/* ---------------------------------------------- 지출-수입 입력----------------------------------------------- */
	
	$("#budgetRegi").click(function() {
		
		if(selectedOption!=1){
			alert("일 을 선택하세요");
			return;
		}
		
		var f = document.budgetF;
		$("[name=budgetF] input:eq(4)").val(today);
		if(isEmpty(eval("f."+$("[name=budgetF] input:eq(2)").attr("name")),"금액을 입력하세요")) return;
		
		var params = $("[name=budgetF]").serialize();
		var path="";
		
		
		$("[name=budgetCode]").each(function() {
			if(this.checked){
				if(this.value==0){
					path="expenseRegi.do";
				}else {
					path="incomeRegi.do";
				}
				console.log(path);
				return;
			}
		});
		
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
		
		initForm();
	});
	
	$("#closeF").click(function() {
//		console.log("expense.expenseNo",expenseObj.expenseNo);
		initForm(1);
	});

	

	
	
	
	
	
	