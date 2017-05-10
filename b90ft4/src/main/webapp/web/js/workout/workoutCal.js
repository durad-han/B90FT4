var totalSpentCal = 0;   
var totalIntakeCal = 0;
var today = $.datepicker.formatDate("yy-mm-dd",new Date());
var BM = 0;
var userId = 'tester01';

$(".BMSet").on("keyup" , function(){
	calculateBM();
});


function callIntakeCal(){
	totalIntakeCal = 0;
	$.ajax({
		url:"selectWorkoutStatisticsList.do",
		dataType:"json",
		data : {"today" : today }
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
		data : {"today" : today }
		}).done(function(result){
			console.dir(result);
			for(var i = 0 ; i < result.length ; i++){
				totalSpentCal += parseInt(result[i].spentCal);
			}
			$('#setSpendCal').val(totalSpentCal);
		});
	}
  
   
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
           label: "소비 칼로리",
           color: "#f15f5f"
       },{
           data: d4_2,
           label: "섭취 칼로리",
           color: "#3DB9D3"
       },{
           data: d4_3,
           label: "초과 소비 칼로리",
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
	
	var initTotalIntakeCal = 0;
	var initTotalSpentCal = 0;
	var initUserHeight = 0;
	var initUserWeight = 0;
	var initUserAge = 0;
	var initUserGender = 'male';
	var initBM = 0;
	var initUpdateSpendCalVal = 0;
	function initChart(){
		//$("#callIntakeCalBtn").trigger("click");
		$.ajax({
			url:"selectWorkoutStatisticsList.do",
			dataType:"json",
			data : {"today" : today }
			//,async : false
			}).done(function(result){				
				for(var i = 0 ; i < result.length ; i++){
					initTotalIntakeCal += parseInt(result[i].intakeCal);
				}
				//console.log('initTotalSpentCal:'+initTotalIntakeCal);
				$.ajax({
					url:"selectWorkoutStatisticsList.do",
					dataType:"json",
					data : {"today" : today }
					}).done(function(result){
						console.dir(result);
						for(var i = 0 ; i < result.length ; i++){
							initTotalSpentCal += parseInt(result[i].spentCal);
							//console.log('initTotalSpentCal:'+initTotalSpentCal);
							//console.log('initTotalIntakeCal:'+initTotalIntakeCal);
							
						}
						$.ajax({
							url:"selectWorkoutUserInfo.do",
							dataType:"json",
							data:{"userId" : userId}

							}).done(function(result){
								
								//console.dir(result);
								initUserHeight = Number(result.userHeight);
								initUserWeight = Number(result.userWeight);
								initUserAge = Number(result.userAge);
								initUserGender = result.userGender;
								console.log('initUserAge:'+initUserAge);
								console.log('initUserAge:'+initUserGender);
								console.log('initTotalSpentCal:'+initTotalSpentCal);
								console.log('initTotalIntakeCal:'+initTotalIntakeCal);
								/*
								if(result.userGender == 'male'){
									$('#genderFemale').removeClass('checked');
									$('#genderMale').addClass('checked');
								}
								else{
									$('#genderMale').removeClass('checked');
									$('#genderFemale').addClass('checked');
								}
								*/

								
							    initBM = 66.47 + ( 13.175 * initUserWeight ) + ( 5 * initUserHeight ) - ( 6.76 *  initUserAge );
							    
							    if ( initUserGender == 'female'){
							    	initBM = 655.1 + (9.56 * initUserWeight ) + (1.85 * initUserHeight ) - ( 4.68 * initUserAge );
							    	
							    }
							    initUpdateSpendCalVal = Number(Number(initTotalSpentCal) + Number(initBM));
								

							    spendCal4 = initUpdateSpendCalVal;

							    leftCal4 = consumeCal4 - spendCal4;
							    overCal4 = spendCal4 - consumeCal4;
							    if (spendCal4 < consumeCal4){
							 	   overCal4 = 0;
							    }
							    barChartStack();

								
							});
					});
			});
		
		console.log(initTotalIntakeCal);

		//$("#callSpentCalBtn").trigger("click");
		
		//$("#callBMBtn").trigger("click");
		
		//$("#calculateBMBtn").trigger("click");
		
		//$("#setBMBtn").trigger("click");
		
		//$("#setCalBtn").trigger("click");
		
		
		
		
/*		callSpentCal();
	    var userHeight = "";
	    var userWeight = "";
	    var userAge = "";
	    var userGender = "";
		$.ajax({
			url:"selectWorkoutUserInfo.do",
			dataType:"json",
			data:{"userId" : userId}

			}).done(function(result){
				
				//console.dir(result);

					
				userHeight = Number(result.userHeight);
				userWeight = Number(result.userWeight);
				userAge = Number(result.userAge);
				userGender = result.userGender;
				
				BM = 66.47 + ( 13.175 * userWeight ) + ( 5 * userHeight ) - ( 6.76 *  userAge );
			    
			    if ( userGender == 'female'){
			    	BM = 655.1 + (9.56 * userWeight ) + (1.85 * userHeight ) - ( 4.68 * userAge );
			    	tempflag = 2;
			    }
			    setBM();
			    setCal();
				 
			});
	*/
		    
		
	}
	window.onload = function(){
		initChart();
	}
