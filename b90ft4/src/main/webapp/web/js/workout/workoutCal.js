	var totalSpentCal = 0;   
	var totalIntakeCal = 0;
	var today = $.datepicker.formatDate("yy-mm-dd",new Date());
	var BM = 0;
	var userId = 'tester01';
//bar-chart-stack 
var d4_1 = [["Jan", 126],["Feb", 73],["Mar", 94],["Apr", 54],["May", 92],["Jun", 141],["Jul", 29],["Aug", 44],["Sep", 30],["Oct", 40],["Nov", 67],["Dec", 92]];
    var d4_2 = [["Jan", 58],["Feb", 61],["Mar", 46],["Apr", 35],["May", 55],["Jun", 46],["Jul", 57],["Aug", 80],["Sep", 100],["Oct", 91],["Nov", 35],["Dec", 57]];
    $.plot("#bar-chart-stack", [{
        data: d4_1,
        label: "New Visitor",
        color: "#3DB9D3"
    },{
        data: d4_2,
        label: "Returning Visitor",
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



	function callIntakeCal(){
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
	console.log("callSpentCal loaded");
	console.log("today : "+ today);
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
   console.log("consume:"+$("#setConsumeCal").val());
   consumeCal4 = $("#setConsumeCal").val();
   leftCal4 = consumeCal4 - spendCal4;
   overCal4 = spendCal4 - consumeCal4;
   if (spendCal4 < consumeCal4){
	   overCal4 = 0;
   }
   barChartStack();
   console.log("차트스택 빠져나온 spendcal4 : "+spendCal4);

   }
   
 //bar-chart-stack  
   var d4_1 = [["날짜1", spendCal1],["날짜2", spendCal2],["날짜3", spendCal3],[today, spendCal4]];
   var d4_2 = [["날짜1", leftCal1],["날짜2", leftCal2],["날짜3", leftCal3],[today, leftCal4]];
   var d4_3 = [["날짜1", overCal1],["날짜2", overCal2],["날짜3", overCal3],[today, overCal4]];
   function barChartStack(){
	   d4_1 = [["날짜1", spendCal1],["날짜2", spendCal2],["날짜3", spendCal3],[today, spendCal4]];
	   d4_2 = [["날짜1", leftCal1],["날짜2", leftCal2],["날짜3", leftCal3],[today, leftCal4]];
	   d4_3 = [["날짜1", overCal1],["날짜2", overCal2],["날짜3", overCal3],[today, overCal4]];
	   
	   console.log("차트스택 안에있는 spendcal4 : "+spendCal4);
		console.dir(d4_1);
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
/* 	   
	   <div id='BMContainer' hidden="true">
	   키:<input id='setUserHeight' type='text'>cm<br>
	   몸무게:<input id='setUserWeight' type='text'>kg<br>
	   나이:<input id='setUserAge' type='text'><br>
	   기초대사량:<input id ='BMView'type='text'><br>
	    */

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
   
