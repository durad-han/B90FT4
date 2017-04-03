<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.ui-datepicker-header{
}
.ui-datepicker-week-end{
}
.ui-datepicker-today{
	background-color: grey
	
}

img {
	width: 15px;
	height: 15px;
}

</style>
</head>
<body>
         <!-- 지출/비용 시작 -->
         <!-- 달력 -->

	<input type="text" name="date" id="actualDate">
	<div id="datepicker" placeholder="ex) 2017-03-30"></div><br>
<button>
		클릭xxxzcxzcx
	</button>

</body>
</html>

<script>

$("#datepicker").datepicker({
	  showOn: "both", // button or focus , 캘린더가 나타난다.
	  altField: "#actualDate",
//	  altFormat:"yy-mm-dd",
//	  appendText: "(yyyy-mm-dd)",
	  autoSize: true,
//	  buttonImage: "cc.png",
//	  buttonImageOnly: true,
	  buttonText: "Choose",
	  changeMonth: true,
	  changeYear: true,
	  closeText: "닫기",
	  showButtonPanel: true,
	  constrainInput: true,
	  currentText : "오늘",
	  dateFormat: "yy-mm-dd",
	  dayNames : ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	  dayNamesMin  : ["일","월","화","수","목","금","토"],
	  dayNamesShort  : ["일","월","화","수","목","금","토"],
//	  defaultDate : +7
	  duration: "slow", // 달력이 나타는 속도. default : normal
    firstDay: 1,  // 한 주의, 첫번째 날. 0 : 일요일, 1 : 월요일
    gotoCurrent: true,
    hideIfNoPrevNext : true,
//     maxDate: "+1m +1w", // 최대 날짜
//     minDate: new Date(2017, 1 - 1, 2), // 최소 날짜	
    monthNames : ["1월","2월","3월","4월","5월","6월","7월",
                  "8월","9월","10월","11월","12월"], // 미셀렉박스시 적용
    monthNamesShort  : ["1월","2월","3월","4월","5월","6월","7월",
                  "8월","9월","10월","11월","12월"], // 셀렉박스시 적용
    navigationAsDateFormat: true,
    prevText : "이전",
    nextText : "다음",
	  onChangeMonthYear : function (year,month,inst) {
	   		console.log("year:",year,"month:",month);	
	  },
//  onClose : function(dateText, inst) {
  	  
//  },
 	  onSelect  : function (dateText, inst) {
  	  console.log("date : ",dateText);
			var date = $("#datepicker").datepicker('getDate');
			console.log(date);
			var dateFormat = 'yy-mm-dd';
			var result = $.datepicker.formatDate( dateFormat, date );
			console.log("result",result);
 	  },
 	  showMonthAfterYear: true,
 	  showOtherMonths: true, // 이전, 다음 달의 날짜를 보여줄지의 여부.
 	  selectOtherMonths: true, // 이전, 다음 달의 날짜를 선택 할수있는 있냐없냐.
 	  showWeek: true,
 	  weekHeader : "week",
//  yearRange: "2002:2012"
 	  yearSuffix: "년"
});

console.log($("#datepicker"));

$("#next").click(function() {
	console.log("ㅋㅋ");
//	$("#datepicker").datepicker("option","defaultDate","+1d +7d");
//	$("#datepicker").datepicker("option","disabled", true );\
//	$( "#datepicker" ).datepicker("setDate", +1);
  $("#datepicker").datepicker("refresh");
//	$("#datepicker").datepicker( "destroy" ); // 삭제시킨다..
//	$("#datepicker").datepicker( "dialog", "10/12/2012" ); // 대화상자
//	$( "#datepicker" ).datepicker( "hide" );
//	$( "#datepicker" ).datepicker( "show" );

});


$("button").click(function() {
	console.log("datepicker",$("#datepicker").datepicker("getDate"));
});


</script>
