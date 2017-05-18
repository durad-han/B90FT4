/**
 * http://usejsdoc.org/
 */

var date = new Date();
var year = date.getYear()+1900;
var month = date.getMonth()+1;
if(month<10) {
	month="0"+month;
}	
$("#expensePlanDate").val(year+"-"+month);

$("#budgetManagement").click(function() {
	$(".row.main").slideToggle(250);	
});

$.ajax({
	url:"expensePlan.do",
	dataType:"json",
	data : {
		expensePlanDate : $("#expensePlanDate").val()
	}
}).done(function(result) {
	console.log(result);
	
	if(result.goal.planStatus=='y'){
		$("#managementDiv").hide();
		$("#set").prop("disabled",true);
	}	
	else{
		$("#noSet").prop("disabled",true);
	}	
});


$("#set").click(function() {
	$("#managementDiv").slideToggle(250);
});


$("#noSet").click(function() {
	
	if(!confirm("설정된 지출 한도는 사라지는데 괜찮으신가요?")){
		return;
	}
	
	$("#managementDiv").hide();
		
	$.ajax({
		url:"regiPlan.do",
		data:{
			expensePlanDate : $("#expensePlanDate").val(),
			planStatus : "n"
		}
	}).done(function(result) {

	});
	
	$("#set").prop("disabled",false);
	$("#noSet").prop("disabled",true);
	
});


$("#registerPlan").click(function() {
	if($("#expenseGoal").val()=="") {
		alert("금액을 입력하세요.");
		return;
	} 
	
	$.ajax({
		url:"regiPlan.do",
		data:{
			expensePlanDate : $("#expensePlanDate").val(),
			expenseGoal : $("#expenseGoal").val(),
			planStatus : "y"
		}
	}).done(function(result) {
		alert("등록완료");
		$("#managementDiv").hide();
		$("#set").prop("disabled",true);
		$("#noSet").prop("disabled",false);
	});
	
});


$("button#getBook").click(function () {
	location.href="makeExcel.do";
});
