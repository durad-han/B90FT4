/*  ---------------------------------------  달력 만들기 자바스크립트 -------------------------------------------------------------- */

	var selectCurrentWeek = function() {
		setTimeout(function () {
	        $('#datepicker').find('.ui-datepicker-current-day a').addClass('ui-state-active');
	    }, 1);
	}
//	 visibility: hidden;
	var style = '<style id="hidden"> table.ui-datepicker-calendar {display:none;} </style>'
	var datepicker_default;
	var startDate;
	var endDate;
	var selectedDateOption=1;
	var i=0; // 화살표로 날짜 움직이기 제어 변수.
	var dateFormat = 'yy-mm-dd';
	var weekPN=0;
	
	var dayByDayFlag = 0;
	
	// 추가 부분
	var currentMonth = new Date().getMonth()+1;
	var thisMonth = new Date().getMonth()+1;
	var moveMonth=0;
	
	var j = new Date().getDate();
	
	function makeCalendar(type){
	
		datepicker_default = {
				showOn: 'button',
				buttonText: "달력",
				currentText: "이번달",
				closeText : "선택" ,
				dateFormat: dateFormat,
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
	     			
	     			var date = $("#datepicker").datepicker('getDate');
	     			var temp =  $.datepicker.parseDate("yy-mm-dd",dateText);
	     			var today = new Date();
	     			
	     			j = temp.getDate();
	     			
	     			
	     			if(selectedDateOption==1) {
	     				
	     				if($.datepicker.formatDate(dateFormat,today) == $.datepicker.formatDate(dateFormat,temp)) {
	     					i = 0;
//	     					console.log("1",i);
	     				}else if(today < temp){
	     					i = (Math.ceil((temp.getTime() - today.getTime()) / 1000 / 60 / 60 / 24));
//	     					console.log("2",i);
	     				}else if(today > temp){
	     					// 다시 살펴봐야 할 부분.
	     					i = -(Math.ceil((today.getTime() - temp.getTime()) / 1000 / 60 / 60 / 24)) + 1;
//	     					console.log("3",i);
	     				}
	     				
		    			var selectedDate = $.datepicker.formatDate( dateFormat, date );
//		    			console.log("selectedDate : " , selectedDate);
		    			$("[id=actualDate]").val(selectedDate); // 선택한 날짜를 인풋 박스에 출력.
		    			$("[name=budgetF] input:eq(4)").val(selectedDate);
//		    			console.log("선택한 날짜1",	$("[name=budgetF] input:eq(4)").val());
		    			budgetList(selectedDate); // 선택한 날짜에 해당하는 지출/수입을 긁어온다.
	     			
	     			}
	     			
	     			if(selectedDateOption==2) {
	     				
	     				if($.datepicker.formatDate(dateFormat,today) == $.datepicker.formatDate(dateFormat,temp)) {
	     					weekPN = 0;
//	     					console.log("1",weekPN);
	     				}else if(today < temp){
	     					weekPN = (Math.ceil((temp.getTime() - today.getTime()) / 1000 / 60 / 60 / 24));
//	     					console.log("2",weekPN);
	     				}else if(today > temp){
	     					// 다시 살펴봐야 할 부분.
	     					weekPN = -(Math.ceil((today.getTime() - temp.getTime()) / 1000 / 60 / 60 / 24)) + 1;
//	     					console.log("3",weekPN);
	     				}
	     				
	     				startDate = $.datepicker.formatDate( dateFormat, new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay()));
	     				endDate = $.datepicker.formatDate( dateFormat, new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6));
		               	
//	     				console.log(startDate,endDate);
	     				
		    			var selectedWeek = startDate + "~" + endDate;
		    			$("[id=actualDate]").val(selectedWeek);
		    			selectCurrentWeek();
		    			budgetList(startDate,endDate);
		                
	     			}
	     			
//	     			console.log("day , i : ", i);
	     			
	            },
				onChangeMonthYear: function(year, month) {
					
					// 추가 사항
				    var tempDate = ( j < 10 ) ? "0"+j : j ;
				    var tempMonth = ( month < 10 ) ? "0"+month : month ;
					
					var yMD1 = year+"-"+tempMonth+"-"+tempDate;
					var yMD2 = tempMonth+"/"+tempDate+"/"+year;
					
					$("#datepicker").datepicker("setDate",$.datepicker.parseDate("yy-mm-dd",yMD1));

					$("[id=actualDate]").val(yMD1);
					$(".ui-datepicker-current-day").trigger("click");
					
//					console.log($("#datepicker").datepicker("getDate"));
					makeAccRatio(year,tempMonth);
					
					if(selectedDateOption==3) {
						$("[id=actualDate]").val(year+"-"+ ( month < 10 ? "0"+month : month));
						var d1 = $.datepicker.formatDate(dateFormat,new Date(year,month-1,1));
						var d2 = $.datepicker.formatDate(dateFormat,new Date(year,month,0));
						budgetList(d1,d2,selectedDateOption);
						$("#budgetPlanDiv").hide();
					}
					
				},
	            beforeShowDay: function(date) {
	            	
            		var cssClass = '';

            		if(selectedDateOption==2) {
		                if(date >= $.datepicker.parseDate(dateFormat,startDate) && date <= $.datepicker.parseDate(dateFormat,endDate)) 
		                	cssClass = 'ui-datepicker-current-day';
            		}
            		
//            		console.log("cssClass",cssClass);
	                
            		return [true, cssClass];
	            
	            }
		}
	}

	var esOpt="";
	var icOpt="";
	var exOrInFlag = false;
	
	// 지출, 수입 탭을 클릭할 경우..
	$("#expenseTab").click(function() {
		exOrInFlag = false;
	});
	
	$("#incomeTab").click(function() {
		exOrInFlag = true;
	});
	
	makeCalendar();
	$("#datepicker").datepicker(datepicker_default);

	
	$("#day").click(function() {
		$("head > style#hidden").remove();
		
		// 월 지출
		$("#monthExpense-tab").removeClass("in active");
		
		$("#budgetModal").show();		 // 지출/수입 등록 버튼
		$("#expenseTable").show(); 	     // 지출 테이블
		$("#incomeTable").show(); 	     // 수입 테이블
		
		$("#expenseDiv").html("ㅋㅋㅋ"); 	     // 지출 원 그래프 
		$("#incomeDiv").html("ㅋㅋㅋ"); 	     // 수입 원 그래프 
		
		$("#expenseDate").remove(); 	 // 지출 테이블 날짜 컬럼
		$("#incomeDate").remove(); 		 // 수입 테이블 날짜 컬럼
//		$("#incomeTab").removeClass("active"); // 수입 탭 비활성화
		$("#monthBudgteTable").hide();
		
		// occupancyRatio
		$("#occupancyRatio").show();
		var date = $("#datepicker").datepicker("getDate");
		var month = date.getMonth() + 1;
		
		month = month < 10 ? "0"+month : month;
		
		makeAccRatio(date.getYear()+1900,month);
		
		
		if(exOrInFlag){
			$("#expenseTab").removeClass("active"); // 지출 탭 비활성화
			$("#incomeTab").addClass("active"); // 수입 탭 비활성화
			$("#income-tab").addClass("in active");
		}else {
			$("#expenseTab").addClass("active"); // 지출 탭 비활성화
			$("#incomeTab").removeClass("active"); // 수입 탭 비활성화
			$("#expense-tab").addClass("in active");
		}

		$("#month-tab").removeClass("in active");
		
		selectedDateOption = 1;

		$("#datepicker").datepicker("refresh");
			// onSelect 발생 시 , beforeShowDay 실행된다.
			// setDate 발생 시 , beforeShowDay 실행된다.
			
		$("#expenseCtgy").html("분류");	  // 지출 테이블 분류 컬럼
		$("#incomeCtgy").html("분류");     // 수입 테이블 분류 컬럼
		
		$(".ui-datepicker-current-day").trigger("click");
			
	});
	
	$("#week").click(function() {
		
		$("head > style#hidden").remove();
		if(selectedDateOption == 2) return; 
		
		// 월 지출
		$("#monthExpense-tab").removeClass("in active");
		

		$("#budgetModal").hide();   // 지출/수입 버튼
		$("#expenseTable").show();  // 지출 테이블
		$("#incomeTable").show();   // 수입 테이블
		$("#expenseDiv").empty();    // 지출 원 그래프 
		$("#incomeDiv").empty();     // 수입 원 그래프 
		$("#expenseDate").remove(); // 지출 테이블 날짜 컬럼
		$("#incomeDate").remove();  // 수입 테이블 날짜 컬럼
		
		// occupancyRatio
		$("#occupancyRatio").show();
		
		if(exOrInFlag){
			$("#expenseTab").removeClass("active"); // 지출 탭 비활성화
			$("#incomeTab").addClass("active"); // 수입 탭 비활성화
			$("#income-tab").addClass("in active");
		}else {
			$("#expenseTab").addClass("active"); // 지출 탭 비활성화
			$("#incomeTab").removeClass("active"); // 수입 탭 비활성화
			$("#expense-tab").addClass("in active");
		}
		
		$("#month-tab").removeClass("in active");
		
		$("#monthBudgteTable").hide();
		
		selectedDateOption = 2;
		
		// 여러 개 라면 가장 첫번째에 있는 a 태그가 클릭된다.
		// 주 를 클릭한 후,
		// 원래 current-day는 어떻게 다시 복구가 될 수 있는가?
		// refresh의 역할이 중요하다.
		
		// 지출 테이블 분류 컬럼
		$("#expenseCtgy").html("<select><option value='0'>분류</option>"+esOpt+"</select>");
		$("#expenseCtgy > select").change(function() {
//			console.log(this.value);
			budgetList(startDate,endDate,2,this.value,0);
		});
		
		// 수입 테이블 분류 컬럼
		$("#incomeCtgy").html("<select><option value='0'>분류</option>"+icOpt+"</select>");
		$("#incomeCtgy > select").change(function() {
//			console.log(this.value);
			console.log("분류일떄를 보자.",this.value);
			budgetList(startDate,endDate,2,this.value,1);
		});
		
		$(".ui-datepicker-current-day").trigger("click");
		
	});
	
	
	$("#month").click(function() {

		$("head").append(style);
		$("#budgetPlanDiv").hide();
		 // 지출 계획 숨기기.
		if(selectedDateOption == 3) {
			return; 
		}
		
		// 월 지출 테이블.
		$("#monthExpense-tab").addClass("in active");
		
		$("#expenseTable").hide();  // 지출 테이블
		$("#incomeTable").hide();   // 수입 테이블
//		$("#expenseDiv").show();	// 지출 원 그래프 
//		$("#incomeDiv").show();		// 수입 원 그래프 
		$("#budgetModal").hide();   // 지출/수입 등록 버튼
		
		$("#incomeTab").addClass("active"); // 수입 탭 비활성화
		$("#expenseTab").addClass("active"); // 지출 탭 비활성화

		//occupancyRatio
		$("#occupancyRatio").hide();
		
		selectedDateOption = 3;
		
		$("#datepicker").datepicker("refresh");
		var date = $("#datepicker").datepicker("getDate");
		$(".ui-datepicker-month").val(date.getMonth());
		$("#actualDate").val((date.getYear()+1900)+"-"+ (((date.getMonth()+1)<10) ? "0"+(date.getMonth()+1) : (date.getMonth()+1)));

		var d1 = $.datepicker.formatDate(dateFormat,new Date(date.getYear()+1900,date.getMonth(),1));
		var d2 = $.datepicker.formatDate(dateFormat,new Date(date.getYear()+1900,date.getMonth()+1,0));
		budgetList(d1,d2,3);
		
	});
	
	$("#prev").click(function() {
		switch(selectedDateOption) {
			case 1:
				dayByDayFlag=1;
				$("#datepicker").datepicker("setDate",--i);
				$(".ui-datepicker-current-day").trigger("click");
				break;
			case 2:
				selectedDateOption=1;
				$("#datepicker").datepicker("refresh");
				$("#datepicker").datepicker("setDate",weekPN-=7);
				selectedDateOption=2;
				$(".ui-datepicker-current-day").trigger("click");
				break;
			case 3:
				$(".ui-datepicker-prev").trigger("click");
				break;
		
		}
	});
	
	
	$("#next").click(function() {
		
		switch(selectedDateOption) {
		case 1:
			dayByDayFlag=1;
			$("#datepicker").datepicker("setDate",++i);
			$(".ui-datepicker-current-day").trigger("click");
			break;
		case 2:
			selectedDateOption=1;
			$("#datepicker").datepicker("refresh");
			$("#datepicker").datepicker("setDate",weekPN+=7);
			selectedDateOption=2;
			$(".ui-datepicker-current-day").trigger("click");
			break;
		case 3:
			$(".ui-datepicker-next").trigger("click");
			break;
			
		}
	});
	
	
	
/* ------------------------------------------- 현재 날짜 인풋 박스 입력 ---------------------------------------------*/
	
	var date = $("#datepicker").datepicker("getDate");
	var today = $.datepicker.formatDate( "yy-mm-dd", date);
	
	$("#actualDate").val(today);
	$("[name=budgetF] input:eq(4)").val(today);

	showPlan();
	function showPlan(){
	
	    var planDate = new Date();
		var year = planDate.getYear()+1900;
		var month = planDate.getMonth()+1;
		
		if(month<10) {
			month="0"+month;
		}

		$.ajax({
	   		url:"expensePlan.do",
	   		dataType:"json",
	   		data:{
	   			expensePlanDate: year +"-" + month
	   		}
	   	}).done( function(result) {
				var goal = result.goal;
				if(goal && goal.planStatus == 'y'){
					$("#budgetPlanDiv").show();
					$("#budgetPlanDiv > span:eq(0)").text(numberWithCommas(goal.expenseGoal) + "원");
					$("#budgetPlanDiv > span:eq(1)").text(numberWithCommas(result.currentTotal) + "원");
					$("#budgetPlanDiv > span:eq(2)").text(numberWithCommas(goal.expenseGoal - result.currentTotal) + "원");
				}else {
					$("#budgetPlanDiv").hide();
					$("#occupancyRatio").css({
						top:"-10px",
						left:"80px"
					});
				}
	   	});
		
	}
	
/* ------------------------------------------------------------------------------------------------------------- */
	
	
/*  --------------------------------------------------------------------------------------------------------- */
	
	var expenseObj = {};
	var incomeObj = {};
	var budgetCodeFordel = 0;
	
/* ------------------------------- 폼 초기화  -------------------------------------------------------*/
	
	// 폼 요소에 name 추가
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
		
		if(flag==1){
			budgetList($("#actualDate").val());
		}
		
		if(flag==2) {
			var dateArr = $("#actualDate").val().split("~");
			budgetList(dateArr[0],dateArr[1]);
		}
		
		showPlan();
		addBudgetName();
		$("#updateBudget").hide();
		$("#deleteBudget").hide();
		$("#budgetRegi").show();
		$("[name=budgetF] input:eq(2)").val(""); // 금액
		$("[name=budgetF] input:eq(3)").val(""); // 내용
		
		$("#budgetPlanDiv").hide();
		
	}
	/* -------------------------------------------------------------------------------------------------------------- */
	
	/* -------------------  지출/수입 등록에서 셀렉박스 옵션 만들기.  -----------------------------*/
	
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
		addBudgetName();
	});
	
	$("[name=budgetCode]").click(function(e) {
		addBudgetName();
	});
	
	/* -------------------------------------------------------------------------------------------------------------- */
	
	// 카테고리별 색상 입히기
	
	 function colorChoice(flag,ctgyNo){
	
		var labelColor="";
		
		if(flag==1){
		
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
				case 6:
					labelColor = "label label-grey";
					break;
			}
		
		}else {
		
			switch(ctgyNo){
			
			case 1:
				labelColor = "#f44b42";
				break;
			case 2:
				labelColor = "#681c9e";
				break;
			case 3:
				labelColor = "#f49b42";
				break;
			case 4:
				labelColor = "#41f44a";
				break;
			case 5:
				labelColor = "#414ff4";
				break;
			case 6:
				labelColor = "#7c7777";
				break;
			}
		}
		return labelColor;
	}
	
	 
	var regiOrModFlag // 등록, 수정 구분 플래그; 
	 
	var weekFlag=false; // week 구분 플래그
	 
	// budgetSearchCode : 일/주/월 구분.
	// budgetCode		: 지출/수입 구분.
	// ctgyNo			: 분류 구분.
	
	/* 지출-수입 테이블 로딩 함수*/
	function budgetList(startDate,endDate,budgetSearchCode,ctgyNo,budgetCode,flag){
		
		var expenseCategoryNo;
		var incomeCategoryNo;
		
		var expenseHtml="";
		var incomeHtml="";
		
		if(budgetCode==0){
			expenseCategoryNo = ctgyNo;
		}else {
			incomeCategoryNo = ctgyNo;
		}
		
		$.ajax({
			url:"budgetList.do",
			dataType:"json",
			data : {
				startDate: startDate,
				endDate : endDate,
				expenseCategoryNo: expenseCategoryNo,
				incomeCategoryNo: incomeCategoryNo,
				budgetSearchCode:budgetSearchCode
			},
			async:false
		}).done(function (result) {
			
			// 월 선택시, 지출 계획 숨기기.
			if(selectedDateOption == 3 ) {
				
				$("#budgetPlanDiv").hide();
				
			}else{
				showPlan();
			}
			
			// 일 , 주에 대한 지출/수입 테이블 작성
			
			var expense = result.expense;
			var income = result.income;
			var expenseEachDayCount = result.expenseEachDayCount;
			var incomeEachDayCount = result.incomeEachDayCount;
			
			var expenseSum =0;
			var incomeSum =0;

			var totalExpense=0;
			var totalIncome=0;
			
			if(endDate != undefined) {
				weekFlag=true;
			}
			
			if(weekFlag){
				// 날짜 컬럼 추가,식제
				$("#expenseDate").remove();
				$("#incomeDate").remove();
				$("#expenseColumn").prepend("<th id='expenseDate'>날짜</th>");
				$("#incomeColumn").prepend("<th id='incomeDate'>날짜</th>");
			}
			
				switch(budgetCode) {
				
					case undefined   :
						makeExpense();
						// 플래그
						if(endDate != undefined) weekFlag=true;
						makeIncome();
						weekFlag=false;
						break;
					case 0:
						makeExpense();
						break;
					case 1:
						makeIncome();
						break;
				}
			
				function makeExpense() {
				
				// 지출 리스트
						if(expenseEachDayCount.length!=0){
							
							var k = 0;
							
							for(var i=0;i<expenseEachDayCount.length;i++) {
								
								for(var j=0;j<expenseEachDayCount[i];j++,k++) {
									
									expenseHtml+="<tr class='expenseInfo'>";
									expenseHtml+="<td class='expenseNo' style='display:none;'>"+expense[k].expenseNo+"</td>";
									expenseHtml+="<td class='expenseCategoryNo' style='display:none;'>"+expense[k].expenseCategoryNo+"</td>";
									
									if(weekFlag) {
										expenseHtml+="<th style='text-align:center;'>"+expense[k].expenseDate+"</th>";
										weekFlag=false;
									}else{
										if(selectedDateOption != 1 ){
											expenseHtml+="<th style='visibility:hidden;'>"+expense[k].expenseDate+"</th>";
										}
									}
									
									expenseHtml+='<td class="amount"><span class="'+colorChoice(1,expense[k].expenseCategoryNo)+'">'+expense[k].expenseCategoryName+'</span></td>';
									expenseHtml+="<td class='content'>"+expense[k].expenseContent+"</td>";
									expenseHtml+="<td class='amount'>"+numberWithCommas(expense[k].expenseAmount)+"원</td>";
									expenseSum+=expense[k].expenseAmount;
									expenseHtml+="</tr>";
								}
								
								expenseHtml+="<tr>";
								expenseHtml+="<th class='amount'>합계</th>";
								
								
								if(endDate != undefined) {
									expenseHtml+="<td></td>";
								}
								
								expenseHtml+="<td></td>";
								expenseHtml+="<th class='amount'>"+numberWithCommas(expenseSum)+"원</th>";
								totalExpense+=expenseSum;
								expenseSum=0;
								expenseHtml+="</tr>";
								
								weekFlag=true;
								
							}
							
							if(endDate != undefined) {
								expenseHtml+="<tr>";
								expenseHtml+="<th class='amount'> 총 지출 합계</th>";
								expenseHtml+="<td></td>";
								expenseHtml+="<td></td>";
								expenseHtml+="<th class='amount'>"+numberWithCommas(totalExpense)+"원</th>";
								expenseHtml+="</tr>";
							}
							
						}else {
							
							expenseHtml+="<tr>";
							if(endDate != undefined) {
								expenseHtml+='<td colspan="4">지출 내역이 없습니다.</td>';
							}else {
								expenseHtml+='<td colspan="3">지출 내역이 없습니다.</td>';
							}
							expenseHtml+="</tr>";
						
						}
						
						// 지출 리스트 출력
						$("tbody#expense").html(expenseHtml);
						
						// 지출 수정/삭제를 위한 이벤트 등록
						$("tbody#expense > tr.expenseInfo").click(function(e){
							
							e.stopPropagation();
							$("#updateBudget").show();
							$("#deleteBudget").show();
							$("#budgetRegi").hide();
							
							budgetCodeFordel		  	 = 0;
							expenseObj.expenseNo 		 = $(this).children("td.expenseNo").text();
							expenseObj.expenseDate 	     = $(this).children("th").text();
							expenseObj.expenseCategoryNo = $(this).children("td.expenseCategoryNo").text();
							expenseObj.expenseContent    = $(this).children("td:eq(3)").text();
							
							var temp = $(this).children("td:eq(4)").text();
							temp = temp.replace(",","");
							temp = temp.replace("원","");
							
							expenseObj.expenseAmount = temp;
							
							// 폼 양식에 id 와 값 셋팅.
							
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
							regiOrModFlag=2;
							regiOrModFlag=2;
							
						});
						
						weekFlag=false;
				}
			
				function makeIncome() {
						
						// 수입 리스트
						if(incomeEachDayCount.length!=0){
							
							var k = 0;
			
							for(var i=0;i<incomeEachDayCount.length;i++) {
								
								for(var j=0;j<incomeEachDayCount[i];j++,k++) {
									
									incomeHtml+="<tr class='incomeInfo'>";
									incomeHtml+="<td class='incomeNo' style='display:none;'>"+income[k].incomeNo+"</td>";
									incomeHtml+="<td class='incomeCategoryNo' style='display:none;'>"+income[k].incomeCategoryNo+"</td>";
									
									if(weekFlag) {
										incomeHtml+="<th style='text-align:center;'>"+income[k].incomeDate+"</th>";
										weekFlag=false;
									}else{
										if(selectedDateOption != 1){
											incomeHtml+="<th style='display:none;'>"+income[k].incomeDate+"</th>";
										}
									}
									
									incomeHtml+='<td class="amount"><span class="'+colorChoice(1,income[k].incomeCategoryNo)+'">'+income[k].incomeCategoryName+'</span></td>';
									incomeHtml+="<td class='content'>"+income[k].incomeContent+"</td>";
									incomeHtml+="<td class='amount'>"+numberWithCommas(income[k].incomeAmount)+"원</td>";
									incomeSum+=income[k].incomeAmount;
									incomeHtml+="</tr>";
								}
								
								incomeHtml+="<tr>";
								incomeHtml+="<th class='amount'>합계</th>";
								
								
								if(endDate != undefined) {
									incomeHtml+="<td></td>";
								}
								
								incomeHtml+="<td></td>";
								incomeHtml+="<th class='amount'>"+numberWithCommas(incomeSum)+"원</th>";
								totalIncome+=incomeSum;
								incomeSum=0;
								incomeHtml+="</tr>";
								
								weekFlag=true;
								
							}
							
							if(endDate != undefined) {
								incomeHtml+="<tr>";
								incomeHtml+="<th class='amount'> 총 지출 합계</th>";
								incomeHtml+="<td></td>";
								incomeHtml+="<td></td>";
								incomeHtml+="<th class='amount'>"+numberWithCommas(totalIncome)+"원</th>";
								incomeHtml+="</tr>";
							}
							
						}else {
							incomeHtml+="<tr>";
							if(endDate != undefined) {
								incomeHtml+='<td colspan="4">수입 내역이 없습니다.</td>';
							}else {
								incomeHtml+='<td colspan="3">수입 내역이 없습니다.</td>';
							}
							incomeHtml+="</tr>";
						}
						
						// 수입 리스트 출력
						$("tbody#income").html(incomeHtml);
						
						// 수입 수정/삭제를 위한 이벤트 등록
						$("tbody#income > tr.incomeInfo").click(function(e){
			
							e.stopPropagation();
							regiOrModFlag=2;
							$("#updateBudget").show();
							$("#deleteBudget").show();
							$("#budgetRegi").hide();
							
							
							budgetCodeFordel		 =	1;
							incomeObj.incomeNo 		 = 	$(this).children("td.incomeNo").text();
							incomeObj.incomeDate 		 =	today;
							incomeObj.incomeCategoryNo  = 	$(this).children("td.incomeCategoryNo").text();
							incomeObj.incomeContent     = 	$(this).children("td:eq(3)").text();
							
							var temp = $(this).children("td:eq(4)").text();
							temp = temp.replace(",","");
							temp = temp.replace("원","");
							
							incomeObj.incomeAmount      =  temp;
							
							
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
				}
				
				// done(function(result){}) 함수안에 있다..
				if(flag==0){
					return;
				}
				if(flag==1){
					console.log("incomeHtml",incomeHtml);
					return;
				}			
				
				if(selectedDateOption==3){
					
					$("#expenseDiv").empty();
					$("#incomeDiv").empty();
					
					var expenseData = new Array();	
					var incomeData = new Array();
					
					var expenseSum=0;
					var incomeSum=0;
					
					var expenseMonthBudget = result.expenseMonthBudget;
					var incomeMonthBudget = result.incomeMonthBudget;
					
					var monthExpenseHtml="";
					var monthIncomeHtml="";
					
					for(var i=0;i<expenseMonthBudget.length;i++) {
						expenseSum+=expenseMonthBudget[i].eachSum;
					}	
			
					for(var i=0;i<expenseMonthBudget.length;i++) {
						
						var obj={};
					
						obj.label = expenseMonthBudget[i].expenseCategoryName;
						obj.data = (expenseMonthBudget[i].eachSum/expenseSum);

						obj.color = colorChoice(2,expenseMonthBudget[i].expenseCategoryNo);
						
						expenseData.push(obj);
						
						monthExpenseHtml+="<tr>"
						monthExpenseHtml+="<td><span class='"+colorChoice(1,expenseMonthBudget[i].expenseCategoryNo)+"'>"+obj.label+"</span></td>";
						monthExpenseHtml+="<td>"+numberWithCommas(expenseMonthBudget[i].eachSum)+"원</td>";
						monthExpenseHtml+="</tr>"
								
					}
					
					for(var i=0;i<incomeMonthBudget.length;i++) {
						incomeSum+=incomeMonthBudget[i].eachSum;
					}	
					
					for(var i=0;i<incomeMonthBudget.length;i++) {
						
						var obj={};
						obj.label = incomeMonthBudget[i].incomeCategoryName;
						obj.data = Math.round(((incomeMonthBudget[i].eachSum/incomeSum)*1000))/10;
						obj.color = colorChoice(2,incomeMonthBudget[i].incomeCategoryNo);
						
						incomeData.push(obj);
						
						monthIncomeHtml+="<tr>";
						monthIncomeHtml+="<td><span class='"+colorChoice(1,incomeMonthBudget[i].incomeCategoryNo)+"'>"+obj.label+"</span></td>";
						monthIncomeHtml+="<td>"+numberWithCommas(incomeMonthBudget[i].eachSum)+"원</td>";
						monthIncomeHtml+="</tr>";
							
					}	
					
						monthExpenseHtml+="<tr>"
						if(expenseSum!=0){	
							monthExpenseHtml+="<td>합계</td>"
							monthExpenseHtml+="<th>"+numberWithCommas(expenseSum)+"원</th>"
						}else {
							monthExpenseHtml+="<th colspan='2'>내역이 없습니다.</th>"
						}
						monthExpenseHtml+="</tr>"
						
						
						monthIncomeHtml+="<tr>"
						if(incomeSum!=0){	
							monthIncomeHtml+="<td>합계</td>"
							monthIncomeHtml+="<th>"+numberWithCommas(incomeSum)+"원</th>"
						}else {
							monthIncomeHtml+="<th colspan='2'>내역이 없습니다.</th>"
						}
						monthIncomeHtml+="</tr>"
							
									
						$("#monthExpense").html(monthExpenseHtml);
						$("#monthIncome").html(monthIncomeHtml);
						$("#monthBudgteTable").show();
						
						$("#monthExpenseTable + div tbody").html(expenseHtml);
						$("#monthIncomeTable + div tbody").html(incomeHtml);
						
						$(".expenseCtgy").html("<select><option value='0'>분류</option>"+esOpt+"</select>");
						$(".incomeCtgy").html("<select><option value='0'>분류</option>"+icOpt+"</select>");
						
						$(".expenseCtgy > select").change(function() {
							//			console.log(this.value);
							var expense= budgetList(startDate,endDate,3,this.value,0,0);
							console.log("테스트",expense);
							$("#monthExpenseTable + div tbody").html(expense);
						});
						
						$(".incomeCtgy > select").change(function() {
							//			console.log(this.value);
							var income= budgetList(startDate,endDate,3,this.value,1,1);
							
							console.log("income",income);
							
							$("#monthIncomeTable + div tbody").html(income);
						});
						
					//BEGIN PIE CHART
					
				    if(expenseData.length!=0){

				    	$("#expenseDiv #cover1").remove();
				    	
				    	$.plot('#expenseDiv', expenseData, {
					    series: {
					        pie: {
					            show: true,
					            startAngle:2,
					            radius: 1,
					            tilt:.9,
					            innerRadius:0.5,
					            label: {
					                show: true,
					                radius: 3/4,
					                background: {
					                	opacity: 1,
					                    color: 'white'
					                }
					            }
					        }
					    },
					    legend: {
					        show: false
					    }
					    });
					    $("#expenseDiv").prepend("<h3>지출</h3>");
				    }else {
				    	$("#expenseDiv").html("<div id='cover1' style='width:260px;height:200px;background-color:white;position:absolute;z-index:99999'></div>");
				    }
				
				    
				    if(incomeData.length!=0){
				    	
				    	$("#incomeDiv #cover2").remove();
				    	
					    $.plot('#incomeDiv', incomeData, {
					    	  series: {
							        pie: {
							            show: true,
							            startAngle:2,
							            radius: 1,
							            tilt:.9,
							            innerRadius:0.5,
							            label: {
							                show: true,
							                radius: 3/4,
							                background: {
							                	opacity: 1,
							                    color: 'white'
							                }
							            }
							        }
							    },
							    legend: {
							        show: false
							    }
					    });
					    
					    $("#incomeDiv").prepend("<h3>수입</h3>");
				    
				   }else {
					   $("#incomeDiv").html("<div id='cover2' style='width:260px;height:200px;background-color:white;position:absolute;z-index:99999'></div>");
				   }
				    
				
			} // month 처리 if문 끝.
				
		});	 // ajax 요청 끝.
		
		if(flag==0){
			return expenseHtml;
		}
		if(flag==1){
			return incomeHtml;
		}
		
	} // budgetList 함수 끝.
	
	// 수정,삭제 버튼에 이벤트 등록.
	function modAndDelEvent() {
		
		$("#deleteBudget").click(function (e){
			
			var delNo;
			
			if(budgetCodeFordel==0){
				delNo = expenseObj.expenseNo;
			}else{
				delNo = incomeObj.incomeNo;
			}
			
			$.ajax({
				url:"deleteBudget.do",
				data:{
					budgetCode:budgetCodeFordel,
					delNo : delNo
				},
				async:false
			}).done(function(result){
//				console.log(result);
				initForm(selectedDateOption);
				
			});
			
		});
	
		$("#updateBudget").click(function (e){
			
			var modNo;
			if(!budgetCodeFordel){
				modNo = "&expenseNo="+expenseObj.expenseNo;
			}else{
				modNo = "&incomeNo="+incomeObj.incomeNo;
			}
			
			var f = document.budgetF;
			console.log("금액",$("[name=budgetF] input:eq(2)").val());
			console.log("금액",$("[name=budgetF] input:eq(2)").attr("name"));
				
			if(isEmpty(eval("f."+$("[name=budgetF] input:eq(2)").attr("name")),"금액을 입력하세요")) return;
			
			var params = $("[name=budgetF]").serialize();
			console.log("params+modNo",params+modNo);
			
			$.ajax({
				url: "updateBudget.do",
				type:"POST",
				contentType: "application/x-www-form-urlencoded",
				data:params+modNo,
				async:false
			}).done(function(msg){
//				console.log(msg);
			});

			
			$("#updateBudget").attr("data-dismiss","modal");
			
			setTimeout(function() {
				$("#updateBudget").removeAttr("data-dismiss");
				initForm(selectedDateOption);
			},10);
			
			
		});
	}
	
	
	// 초기 오늘에 대한 지출/수입 테이블 그리기
	budgetList(today);
	modAndDelEvent();
	
	/* -------------------------------------------------------------------------------------------------------------- */
	
	
	/* ---------------------------------------------- 지출-수입 입력----------------------------------------------- */
	
	$("[name=budgetF] input:eq(2)").keyup(function(e) {

			if(e.keyCode == 13){
				if( regiOrModFlag == 1){
					$("#budgetRegi").trigger("click");
				}else{
					$("#updateBudget").trigger("click");
				}	
			}
		
	});
	
	$("[name=budgetF] input:eq(3)").keyup(function(e) {
			if(e.keyCode == 13){
				if( regiOrModFlag == 1){
					$("#budgetRegi").trigger("click");
				}else{
					$("#updateBudget").trigger("click");
				}	
			}
	});
	
	// 지출,수입 등록 버튼 클릭.
	$("#budgetModal").click(function() {
		$("[name=budgetF] input:eq(2)").focus();
		console.log("ㅎㅇzz");
		regiOrModFlag = 1;
	});
	
	
	// 지출,수입 등록
	$("#budgetRegi").click(function() {
		
		var f = document.budgetF;

		if(isEmpty(eval("f."+$("[name=budgetF] input:eq(2)").attr("name")),"금액을 입력하세요")) return;
		if(isEmpty(eval("f."+$("[name=budgetF] input:eq(3)").attr("name")),"내용을 입력하세요")) return;

		// 숫자 정규 표현식
		var regNumber = /^[0-9]*$/;
		if(!regNumber.test(eval("f."+$("[name=budgetF] input:eq(2)").attr("name")).value)) {
		    alert('숫자만 입력해주세요.');
		    return;
		}
		
		var params = $("[name=budgetF]").serialize();
		var path="";
		
		$("[name=budgetCode]").each(function() {
				if(this.checked){
					if(this.value==0){
						path="expenseRegi.do";
					}else {
						path="incomeRegi.do";
					}
	//				console.log(path); 
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
				$("#closeF").trigger("click");
				console.log("제")
				initForm(selectedDateOption);
			});

			$("#budgetRegi").attr("data-dismiss","modal");
			
			setTimeout(function() {
				$("#budgetRegi").removeAttr("data-dismiss");
			},10);
		
	});
	
// close를 눌렀을 때 초기화 시키기.
	$("#closeF").click(function() {
		initForm(0);
	});
	
 // 콤마 찍는 정규 표현식 적용 함수.
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
    	


	