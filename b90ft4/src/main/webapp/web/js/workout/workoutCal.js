var totalSpentCal = 0;   
var totalIntakeCal = 0;
var today = $.datepicker.formatDate("yy-mm-dd",new Date());
var BM = 0;
var userId = $("#userIdTag").text();
console.log(userId);
var spendBar 	= [0,0,0,0,0,0,0];
var leftBar 	= [0,0,0,0,0,0,0];
var overBar 	= [0,0,0,0,0,0,0];
var totalCal    = [0,0,0,0,0,0,0];
var date  = new Date();
var myDate = new Date();
var dayOfMonth = myDate.getDate();
myDate.setDate(dayOfMonth - 1);
$.ajaxSettings.traditional = true;
var date1 = $.datepicker.formatDate("yy-mm-dd",date);
myDate.setDate(dayOfMonth - 1);
var date2 = $.datepicker.formatDate("yy-mm-dd",myDate);
myDate.setDate(dayOfMonth - 2);
var date3 = $.datepicker.formatDate("yy-mm-dd",myDate);
myDate.setDate(dayOfMonth - 3);
var date4 = $.datepicker.formatDate("yy-mm-dd",myDate);
myDate.setDate(dayOfMonth - 4);
var date5 = $.datepicker.formatDate("yy-mm-dd",myDate);
myDate.setDate(dayOfMonth - 5);
var date6 = $.datepicker.formatDate("yy-mm-dd",myDate);
myDate.setDate(dayOfMonth - 6);
var date7 = $.datepicker.formatDate("yy-mm-dd",myDate);

$(document).ready(function() {
	chartDayCall();

});



//음식 검색 관련 함수

function searchFood(foodValue){
	$.ajax({
		url : "selectWorkoutFoodList.do",
		dataType : "json",
		data : {"foodValue":foodValue}
	}).done(function(result){
		var foodSearchList = "";
		var foodOtherInfo = "";
		var tempFood = "";
		for(var i = 0 ; i<result.length ; i++){
			foodSearchList += '<option value='+result[i].foodCal+'>'+result[i].foodName+' / '+result[i].foodCal+' kcal</option>';
			foodOtherInfo  += '<option value='+result[i].foodCal+'>'+result[i].foodName+' / '+result[i].foodCal+' kcal</option>';
			tempFood += '<tr><td align="left"><input type="button" style="background-color:white;border:0px;" onclick="addFood('+result[i].foodNumber+','+result[i].foodCal+')" value="'+result[i].foodName+' / '+result[i].foodCal+' kcal" id="foodButton'+result[i].foodNumber+'"></td></tr>';
		}
		$('#foodList').html(foodSearchList);
		$('#foodTable').html(tempFood);
	});
}

function addFood(foodNumber,foodCal){
	var foodName = $("#foodButton"+foodNumber).val();
	
	$('#foodSelectedTable').append('<tr id = "foodSelected'+foodNumber+'"><td align="left"><input type="button" style="background-color:white;border:0px;" onclick="removeFood('+foodNumber+','+foodCal+')" value="'+foodName+'"></td></tr>'
	);
	totalIntakeCal += foodCal;
	$('#setConsumeCal').val(totalIntakeCal);
	
}
function removeFood(foodNumber,foodCal){
	$('#foodSelected'+foodNumber).remove();
	totalIntakeCal -= foodCal;
	$('#setConsumeCal').val(totalIntakeCal);
}
$("#setFood").on("keyup" , function(){
	var foodValue = $("#setFood").val();
	searchFood(foodValue);
});




function updateCal(){
	
	var spentCal = parseInt(gvSpentCal);
	var intakeCal = parseInt(gvIntakeCal);
	if(isNaN(spentCal)){
		spentCal = 0;
	}
	if(isNaN(intakeCal)){
		intakeCal = 0;
	}
	$.ajax({
		url : "UpdateWorkoutStatisticsByWorkoutCal.do",
		dataType : "json",
		data : {"spentCal" : spentCal , "intakeCal" : intakeCal ,"today" : today, "userId" : userId} 
	});
}
function saveCal(){
	 spendBar 	= [0,0,0,0,0,0,0];
	 leftBar 	= [0,0,0,0,0,0,0];
	 overBar 	= [0,0,0,0,0,0,0];
	 totalCal    = [0,0,0,0,0,0,0];
	gvSpentCal = $("#setSpendCal").val();
	gvIntakeCal = $("#setConsumeCal").val();
	updateCal();
	chartDayCall();
}

//차트 초기 호출 관련 함수들
function chartDayCall(){
	$.ajax({
		url:"/b90ft4/workout/selectWorkoutStatisticsListWeek.do",
		dataType:"json",
		data : {"userId" : userId}
		}).done(function(result){
		
 				myDate.setDate(dayOfMonth - 7);
 				 
			    for(var k in result) {
			    	
			    	var stDate = $.datepicker.parseDate( "yy-mm-dd", result[k].workoutDay );//ajax에서 받아온 k번째 날짜
	 			    var endDate = myDate;//7일전
	 			    var btMs = stDate.getTime() - endDate.getTime();//
	 			    var i = Math.floor(btMs / (1000*60*60*24));//

					if(result[k].spentCal < result[k].intakeCal){
						spendBar[k] = result[k].spentCal;
						leftBar[k] = result[k].intakeCal - result[k].spentCal;
						totalCal[k] = Number(spendBar[k] + leftBar[k]);
	
					}
					else{
						spendBar[k] = result[k].intakeCal;
						overBar[k] = result[k].spentCal - result[k].intakeCal;
						totalCal[k] = Number(spendBar[k] + overBar[k]);
					} 
			    }
			    setChart();
		});

}

function setChart(){
	$("#calChart").html(" ");
	var maxYaxis = Math.ceil(Math.max(totalCal[0],totalCal[1],totalCal[2],totalCal[3],totalCal[4],totalCal[5],totalCal[6]))+100;
	var s1 = spendBar;
	var s2 = leftBar;
	var s3 = overBar;
	var ticks = [date7,date6,date5,date4,date3,date2,date1];
	
	plot1 = $.jqplot('calChart', [s1,s2,s3], {
	    // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
	    animate: !$.jqplot.use_excanvas,
	    stackSeries: true,
	    seriesDefaults:{
	        renderer:$.jqplot.BarRenderer,
	        pointLabels: { show: true , stackedValue: true}
	    },
	    axes: {
	        xaxis: {
	        	
	            renderer: $.jqplot.CategoryAxisRenderer,
	            ticks: ticks
	        },
	        yaxis: {
	        	min:0,
	        	max:maxYaxis,
	        	markSize:0
	        }
	    },
	    highlighter: { show: false }
	});

}






$(".BMSet").on("keyup" , function(){
	calculateBM();
});


$('#BMContainer').addClass('hidden');
function showBMContainer(){
	$('#BMContainer').removeClass('hidden');
	$("#callBMBtn").trigger("click");
	
}
function showBM(){
	$.ajax({
		url:"selectWorkoutUserInfo.do",
		dataType:"json",
		data:{"userId" : userId}

		}).done(function(result){
			
			//console.dir(result);
			$('#setUserHeight').val(Number(result.userHeight));
			$('#setUserWeight').val(Number(result.userWeight));
			$('#setUserAge').val(Number(result.userAge));
			
			if(result.userGender == 'male'){
				$('#genderFemale').removeClass('checked');
				$('#genderMale').addClass('checked');
			}
			else{
				$('#genderMale').removeClass('checked');
				$('#genderFemale').addClass('checked');
			}
			
		    var userHeight = Number($("#setUserHeight").val());
		    var userWeight = Number($("#setUserWeight").val());
		    var userAge = Number($("#setUserAge").val());
		    var userGender = $('input:radio[name=gender]:checked').val();
		    	BM = 66.47 + ( 13.175 * userWeight ) + ( 5 * userHeight ) - ( 6.76 *  userAge );
		    
		    if ( userGender == 'female'){
		    	BM = 655.1 + (9.56 * userWeight ) + (1.85 * userHeight ) - ( 4.68 * userAge );
		    	tempflag = 2;
		    }
		    var tempBM = Number($("#setSpendCal").val())+Number(BM);
			$("#setSpendCal").val(tempBM);
		});
}


function hideBMContainer(){
	$('#BMContainer').addClass('hidden');
}


function callIntakeCal(){
	$.ajax({
		url:"selectWorkoutStatisticsList.do",
		dataType:"json",
		data : {"today" : today,
				"userId" : userId}
		}).done(function(result){
			console.dir(result);
			console.dir($('#setConsumeCal').val());
			for(var i = 0 ; i < result.length ; i++){
				totalIntakeCal += parseInt(result[i].intakeCal);
			}
			$('#setConsumeCal').val(totalIntakeCal);
		});
}

function callSpentCal(){
	totalSpentCal = 0;
	//console.log("callSpentCal loaded");
	//console.log("today : "+ today);
	$.ajax({
		url:"selectWorkoutStatisticsList.do",
		dataType:"json",
		data : {"today" : today,
				"userId" : userId}
		}).done(function(result){
			console.dir(result);
			for(var i = 0 ; i < result.length ; i++){
				totalSpentCal += parseInt(result[i].spentCal);
			}
			$('#setSpendCal').val(totalSpentCal);
		});
	}



  
 /*  
   var spendCal1 = 500; 
   var consumeCal1 = 1000;
   var leftCal1 = consumeCal1 - spendCal1;
   var overCal1 = spendCal1 - consumeCal1;
   if (spendCal1 < consumeCal1){
	   overCal1 = 0;
   }

   var spendCal2 = 1000; 
   var consumeCal2 = 1000;
   var leftCal2 = consumeCal2 - spendCal2;
   var overCal2 = spendCal2 - consumeCal2;
   
   if (spendCal2 < consumeCal2){
	   overCal2 = 0;
   }

   var spendCal3 = 1500; 
   var consumeCal3 = 1000;
   var leftCal3 = consumeCal3 - spendCal3;
   var overCal3 = spendCal3 - consumeCal3;
   if (spendCal3 < consumeCal3){
	   overCal3 = 0;
   }
   
   
   var spendCal4 = 0;
   var consumeCal4 = 0;
   var leftCal4 = 0;
   var overCal4 = 0;
   function setCal(){
   spendCal4 = $("#setSpendCal").val();
   consumeCal4 = $("#setConsumeCal").val();
   //console.log("consume:"+$("#setConsumeCal").val());
   //consumeCal4 = $("#setConsumeCal").val();
   leftCal4 = consumeCal4 - spendCal4;
   overCal4 = spendCal4 - consumeCal4;
   if (spendCal4 < consumeCal4){
	   overCal4 = 0;
   }
   barChartStack();
  // console.log("차트스택 빠져나온 spendcal4 : "+spendCal4);

   }
   
 //bar-chart-stack  
   var d4_1 = [["날짜1", spendCal1],["날짜2", spendCal2],["날짜3", spendCal3],[today, spendCal4]];
   var d4_2 = [["날짜1", leftCal1],["날짜2", leftCal2],["날짜3", leftCal3],[today, leftCal4]];
   var d4_3 = [["날짜1", overCal1],["날짜2", overCal2],["날짜3", overCal3],[today, overCal4]];
   function barChartStack(){
	   d4_1 = [["날짜1", spendCal1],["날짜2", spendCal2],["날짜3", spendCal3],[today, spendCal4]];
	   d4_2 = [["날짜1", leftCal1],["날짜2", leftCal2],["날짜3", leftCal3],[today, leftCal4]];
	   d4_3 = [["날짜1", overCal1],["날짜2", overCal2],["날짜3", overCal3],[today, overCal4]];
	   
	   //console.log("차트스택 안에있는 spendcal4 : "+spendCal4);
	   //console.dir(d4_1);
       $.plot("#bar-chart-stack", [{
           data: d4_1,
           label: "소비 칼로리 spendCal",
           color: "#f15f5f"
       },{
           data: d4_2,
           label: "섭취 칼로리 leftCal",
           color: "#3DB9D3"
       },{
           data: d4_3,
           label: "초과 소비 칼로리 overCal",
           color: "#ffce54"
       }], {
           series: {
               stack: !0,
               bars: {
                   align: "center",
                   lineWidth: 0,
                   show: !0,
                   barWidth: .6,
                   fill: .9
               }
           },
           grid: {
               borderColor: "#fafafa",
               borderWidth: 1,
               hoverable: !0
           },
           tooltip: !0,
           tooltipOpts: {
               content: "%x : %y",
               defaultTheme: false
           },
           xaxis: {
               tickColor: "#fafafa",
               mode: "categories"
           },
           yaxis: {
               tickColor: "#fafafa"
           },
           shadowSize: 0
       });
		console.dir(d4_1);
   }
   barChartStack();
   */
   //BM 관련 함수
//<button onclick = 'calculateBM()'>계산</button>
   function calculateBM(){

	    var userHeight = Number($("#setUserHeight").val());
	    var userWeight = Number($("#setUserWeight").val());
	    var userAge = Number($("#setUserAge").val());
	    var userGender = $('input:radio[name=gender]:checked').val();
	    	BM = 66.47 + ( 13.175 * userWeight ) + ( 5 * userHeight ) - ( 6.76 *  userAge );
	    
	    if ( userGender == 'female'){
	    	BM = 655.1 + (9.56 * userWeight ) + (1.85 * userHeight ) - ( 4.68 * userAge );
	    	tempflag = 2;
	    }
	    $('#BMView').val(BM);
   }
//<button onclick = 'setBM()'>오늘 소비 칼로리에 적용</button>
	function setBM(){
		var updateSpendCalVal = Number($('#setSpendCal').val()) + Number(BM);
		$('#setSpendCal').val(updateSpendCalVal);
	}
//<button onclick = 'callBM()'>불러오기</button>
	function callBM(){
		$.ajax({
			url:"selectWorkoutUserInfo.do",
			dataType:"json",
			data:{"userId" : userId}

			}).done(function(result){
				//console.dir(result);
			
				if(!result){
					alert("저장된 정보가 없습니다.");
				}
				$('#setUserHeight').val(Number(result.userHeight));
				$('#setUserWeight').val(Number(result.userWeight));
				$('#setUserAge').val(Number(result.userAge));
				
				if(result.userGender == 'male'){
					$('#genderFemale').removeClass('checked');
					$('#genderMale').addClass('checked');
				}
				else{
					$('#genderMale').removeClass('checked');
					$('#genderFemale').addClass('checked');
				}
				calculateBM();
			});
	}
//<button onclick = 'saveBM()'>저장</button>
	function saveBM(){
		
		var userHeight = Number($("#setUserHeight").val());
	    var userWeight = Number($("#setUserWeight").val());
	    var userAge = Number($("#setUserAge").val());
	    var userGender = $('input:radio[name=gender]:checked').val();
		
		$.ajax({
			url:"updateWorkoutUserInfo.do",
			dataType:"json",
			data : {
					"userId" : userId,
					"userHeight" : userHeight,
					"userWeight" : userWeight,
					"userAge" : userAge,
					"userGender" : userGender
					}
			
			}).done(function(){
				console.log("update is done.");
			});
		
	}
//<button onclick = 'deleteBM()'>삭제</button>
	function deleteBM(){
		$.ajax({
			url:"deleteWorkoutUserInfo.do",
			dataType:"json",
			data:{"userId" : userId}
			
			}).done(function(){
				console.log("delete is done.");
			});
		
	}

