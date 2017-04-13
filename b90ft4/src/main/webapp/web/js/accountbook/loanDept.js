/*  ---------------------------------------  달력 만들기 자바스크립트 -------------------------------------------------------------- */

	var selectCurrentWeek = function() {
		setTimeout(function () {
	        $('#datepicker').find('.ui-datepicker-current-day a').addClass('ui-state-active');
	    }, 1);
	}
//	 visibility: hidden;
	var datepicker_default;
	var startDate;
	var endDate;
	var selectedDateOption=1;
	var i=0; // 화살표로 날짜 움직이기 제어 변수.
	var dateFormat = 'yy-mm-dd';

	
	var weekPN=0;
	
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
		    			$("[id=actualDate]").val(selectedDate); // 선택한 날짜를 인풋 박스에 출력.
		    			$("[name=bondF] input:eq(5)").val(selectedDate);
		    			bondList(selectedDate);
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
	     				bondList(startDate,endDate);
	     				
		    			var selectedWeek = startDate + "~" + endDate;
		    			$("[id=actualDate]").val(selectedWeek);
		    			selectCurrentWeek();
		                
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
	
	makeCalendar();
	$("#datepicker").datepicker(datepicker_default);
	
	$("#day").click(function() {
		$("head > style#hidden").remove();
			
		$("#budgetModal").show();		 // 지출/수입 등록 버튼
		$("#expenseTable").show(); 	     // 지출 테이블
		$("#incomeTable").show(); 	     // 수입 테이블
		$("#expenseDiv").hide(); 	     // 지출 원 그래프 
		$("#incomeDiv").hide(); 	     // 수입 원 그래프 
		$("#expenseDate").remove(); 	 // 지출 테이블 날짜 컬럼
		$("#incomeDate").remove(); 		 // 수입 테이블 날짜 컬럼
		
		$("#incomeTab").removeClass("active"); // 수입 탭 비활성화
		
		$("#monthBudgteTable").hide();
		
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

		$("#budgetModal").hide();   // 지출/수입 버튼
		$("#expenseTable").show();  // 지출 테이블
		$("#incomeTable").show();   // 수입 테이블
		$("#expenseDiv").hide();    // 지출 원 그래프 
		$("#incomeDiv").hide();     // 수입 원 그래프 
		$("#expenseDate").remove(); // 지출 테이블 날짜 컬럼
		$("#incomeDate").remove();  // 수입 테이블 날짜 컬럼
		$("#incomeTab").removeClass("active"); // 수입 탭 비활성화
		
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
	
	$("#prev").click(function() {
		switch(selectedDateOption) {
			case 1:
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
	
//	console.log("today",today);
	$("#actualDate").val(today);
	$("[name=bondF] input:eq(5)").val(today);
//	$("[name=budgetF] input:eq(4)").val(today);
//	console.log($("[name=budgetF] input:eq(4)").val());
//	console.log($("[name=budgetF] input:eq(4)").attr("name"));
	
	
/* ------------------------------------------------------------------------------------------------------------- */

/* -------------------  대입금/차입금 등록에서 name 부여하기.  -----------------------------*/

	addBondName();
	$("[name=bondCode]").click(function(e) {
		addBondName();
	});
	
/* -------------------------------------------------------------------------------------------------------------- */	
	var loanObj = {};
	var debtObj = {};
	var bondCodeFordel = 0;
		
/* -------------------------------------------------------------------------------------------------------------- */	
	// 대입금/차입금 리스트
	
	function bondList(startDate,endDate) {
		$.ajax({
			url:"bondList.do",
			dataType:"json",
			data: {
				startDate : startDate,
				endDate : endDate
			}
		}).done(function(result) {
		
			console.log(result);
			
			var loan = result.loan;
			var debt = result.debt;
			
			var loanHtml="";
			var debtHtml="";
			
		if(loan.length!=0){	
			
			for(var i=0;i<loan.length;i++) {
				loanHtml+="<tr>";
				loanHtml+="<td style='display:none;'>"+loan[i].loanNo+"</td>";
				loanHtml+="<td style='display:none;'>"+loan[i].loanDate+"</td>";
				loanHtml+="<td>"+loan[i].debtor+"</td>";
				loanHtml+="<td>"+loan[i].loanContent+"</td>";
				loanHtml+="<td>"+loan[i].loanAmount+"</td>";
				loanHtml+="</tr>";
			}
			
		}else{
			loanHtml+="<tr>";
			loanHtml+="<td>내역이 없습니다.</td>";
			loanHtml+="</tr>";
		}
		
		if(debt.length!=0){
			for(var i=0;i<debt.length;i++) {
				debtHtml+="<tr>";
				loanHtml+="<td style='display:none;'>"+debt[i].debtNo+"</td>";
				loanHtml+="<td style='display:none;'>"+debt[i].debtDate+"</td>";
				debtHtml+="<td>"+debt[i].moneyLender+"</td>";
				debtHtml+="<td>"+debt[i].debtContent+"</td>";
				debtHtml+="<td>"+debt[i].debtAmount+"</td>";
				debtHtml+="</tr>";
			}
		}else{
			debtHtml+="<tr>";
			debtHtml+="<td>내역이 없습니다.</td>";
			debtHtml+="</tr>";
		}
			
			$("#loanTbody").html(loanHtml);
			$("#debtTbody").html(debtHtml);
		
			$("#loanTbody > tr").click(function() {
				
				$("#updateBond").show();
				$("#deleteBond").show();
				$("#regiLoanDept").hide();
				
				bondCodeFordel		  		 = 0;
				loanObj.loanNo 			 = $(this).children("td:eq(0)").text();
				loanObj.loanDate 		 = $(this).children("td:eq(1)").text();
				loanObj.debtor 			 = $(this).children("td:eq(2)").text();
				loanObj.loanContent  	 = $(this).children("td:eq(3)").text();
				loanObj.loanAmount    	 = $(this).children("td:eq(4)").text();
				loanObj.loanDate
				
				// 폼 양식에 id 와 값 셋팅.
				addBondName();
				
				$("[name=bondF] input:eq(2)").val(loanObj.debtor);
				$("[name=bondF] input:eq(3)").val(loanObj.loanAmount);
				$("[name=bondF] input:eq(4)").val(loanObj.loanContent);
				$("[name=bondF] input:eq(5)").val(loanObj.loanDate);
				$("#bondModal").trigger("click");
				console.log(loanObj);
			});
		
		}); // 아잭스 끝.
		
	} // 함수 끝

	bondList(today);
	modAndDelEvent();
	
/* -------------------------------------------------------------------------------------------------------------- */	
	
	$("#regiLoanDept").click(function(){
		
		console.log("ㅋㅋ");
		
		var f = document.bondF;
		if(isEmpty(eval("f."+$("[name=bondF] input:eq(3)").attr("name")),"금액을 입력하세요")) return;
		
		var params = $("[name=bondF]").serialize();
		
		console.log(params);
		
		$.ajax({
			url : "regiBond.do",
			data : params,
			type: "POST"
		}).done(function(result) {
			console.log(result);
			initForm();
		});
		
	})	


/* ------------------------------------------------------------------ */

// 폼 요소에 name 추가

	function addBondName(){
		$("[name=bondCode]").each(function() {
			if(this.checked) {
				if(this.value==0){
					
					$("[name=bondF] #bondName").text("빌려간 사람");
					
					$("[name=bondF] input:eq(2)")
					.attr("name","debtor");
					
					$("[name=bondF] input:eq(3)")
					.attr("name","loanAmount");

					$("[name=bondF] input:eq(4)")
					.attr("name","loanContent");
					
					$("[name=bondF] input:eq(5)")
					.attr("name","loanDate");
					
					
				} else{
					
					$("[name=bondF] #bondName").text("빌려준 사람");
					
					$("[name=bondF] input:eq(2)")
					.attr("name","moneyLender");
					
					$("[name=bondF] input:eq(3)")
					.attr("name","debtAmount");
					
					$("[name=bondF] input:eq(4)")
					.attr("name","debtContent");
					
					$("[name=bondF] input:eq(5)")
					.attr("name","debtDate");
					
				}
				return;
			}
		});
	}

	
	// 폼 초기화
	function initForm(flag){
		
		console.log($("#actualDate").val());
		bondList($("#actualDate").val());
		
		$("#updateBond").hide();
		$("#deleteBond").hide();
		$("#regiLoanDept").show();
		$("[name=bondF] input:eq(2)").val("");
		$("[name=bondF] input:eq(3)").val("");
		$("[name=bondF] input:eq(4)").val("");
	}

	$("#closeF").click(function() {
		initForm();
	})


// 수정,삭제 버튼에 이벤트 등록.
	function modAndDelEvent() {
		
		$("#deleteBond").click(function (){
			var delNo;
			if(!bondCodeFordel){
				delNo = loanObj.loanNo;
			}else{
				delNo = debtObj.debtNo;
			}
			
			$.ajax({
				url:"deleteBond.do",
				data:{
					bondCode:bondCodeFordel,
					delNo : delNo
				}
			}).done(function(result){
//				console.log(result);
				initForm();
			})
		});
	
		$("#updateBond").click(function (){

			var modNo;
			var date;
			if(!bondCodeFordel){
				modNo = "&loanNo="+loanObj.loanNo;
				date = loanObj.loanDate;
			}else{
				modNo = "&debtNo="+debtObj.debtNo;
				date = debtObj.debtDate;
			}

			var f = document.budgetF;
			
//			console.log("금액",$("[name=budgetF] input:eq(2)").val());
//			console.log("금액",$("[name=budgetF] input:eq(2)").attr("name"));
				
//			if(isEmpty(eval("f."+$("[name=bondF] input:eq(3)").attr("name")),"금액을 입력하세요")) return;
			
			var params = $("[name=bondF]").serialize();
//			console.log("params",params+modNo);
			
			$.ajax({
				url: "updateBond.do",
				type:"POST",
				contentType: "application/x-www-form-urlencoded",
				data:params+modNo,
				async:false
			}).done(function(msg){
//				console.log(msg);
				initForm();
			});

		});
		
	}
	