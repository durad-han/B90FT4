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

$("[name=set]").click(function(){
	console.log("라디오 테스트");
	
});

$("#budgetManagement").click(function() {
	$("div.modal-dialog").slideToggle(250);	
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
	}	
//			$("#set").prop("checked",true);
	else{
		$("#managementDiv").show();
	}	
});


$("#set").click(function() {
	$("#managementDiv").show();
});


$("#noSet").click(function() {
	$("#managementDiv").hide();
		
		$.ajax({
			url:"regiPlan.do",
			data:{
				expensePlanDate : $("#expensePlanDate").val(),
				planStatus : "n"
			}
		}).done(function(result) {
		});
		
	return;
});

function checkCode(){
   
	  $("[name=budgetManageCode]").each(function() {
			
		  if(this.checked && this.value == 0){
					$("#managementDiv").show();
					return;
				}

			if(this.checked && this.value == 1){
					$("#managementDiv").hide();
					
					$.ajax({
						url:"regiPlan.do",
						data:{
							expensePlanDate : $("#expensePlanDate").val(),
							planStatus : "n"
						}
					}).done(function(result) {
					});
					return;
				}
		});
  }



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
	});
	
});


$("button#getBook").click(function () {
	location.href="makeExcel.do";
});
