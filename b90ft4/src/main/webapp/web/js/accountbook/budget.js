
/* 지출 입력 */


var budgetCode=0;

$("#budgetRegi").click(function() {
	
	var f = document.budgetF;
	
	console.log("등록");
	
	$("[name=budgetF] input:eq(4)").val($("#actualDate").val());
	
	if(isEmpty(eval("f."+$("input:eq(4)").attr("name")),"날짜를 선택하세요")) return;

	if(isEmpty(eval("f."+$("input:eq(2)").attr("name")),"금액을 입력하세요")) return;
	
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
	
	$("#closeF").trigger("click");
	
});




/*  달력 만들기 자바스크립트 */

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
	
	

	