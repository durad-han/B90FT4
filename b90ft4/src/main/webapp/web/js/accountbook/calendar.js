alert("달력");

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
	     			if(flag==1) {
	     				var date = $(this).datepicker('getDate');
	     				var dateFormat = 'yy-mm-dd';
		    			var result = $.datepicker.formatDate( dateFormat, date );
		    			$("[name=date]").val(result);
	     			}
	     			if(flag==2) {
		    			var date = $(this).datepicker('getDate');
		                startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
		               	endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
		               	var dateFormat = 'yy-mm-dd';
		    			var result = $.datepicker.formatDate( dateFormat, startDate ) + " - " + $.datepicker.formatDate( dateFormat, endDate);
		    			$("[name=date]").val(result);
		                selectCurrentWeek();
		     		}
	            },
				onChangeMonthYear: function(year, month) {
					if(flag==3){
					$("[name=date]").val(year+"-"+ ( month < 10 ? "0"+month : month));
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
		flag = this.value;
	});
	
	$("#week").click(function() {
		$("head > style#hidden").remove();
		flag = this.value
	});
	
	$("#month").click(function() {
		$("head").append(style);
		
		var date = $("#datepicker").val();	
		
		if(date){
			var selectDate = date.split("-");
			var year = selectDate[0];
			var month = selectDate[1];
			$("#datepicker").val(year+"-"+month);
		}
		flag = this.value
	});