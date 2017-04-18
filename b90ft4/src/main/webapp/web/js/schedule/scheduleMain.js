console.log("scheduleMain.js 로드됨...!!");

//----- datePicker -----------------------------------------------------------



//----- schedule ---------------------------------------------------------------------------------------------

//----- scheduleTimeline -------------------------------------------------------------------------------------
$(window).on('scroll', function(){
	$timeline_block.each(function(){
		if( $(this).offset().top <= $(window).scrollTop()+$(window).height()*0.75 && $(this).find('.cd-timeline-img').hasClass('is-hidden') ) {
			$(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
		}
	});
});

//----- foxholder -----------------------------------------------------------
jQuery('.clz-insertSchedule').foxholder({
	demo: 6 //(1-15)
});

$("#inputImportance").starRating({
	totalStars: 3,
	initialRating: 1,
	starSize: 25,
	starShape: 'rounded',
	emptyColor: 'lightgray',
	hoverColor: 'salmon',
	activeColor: 'yellow',
	useFullStars: true,
	useGradient: true,
	starGradient: {start: '#FEF7CD', end: '#FF9511'},
	disableAfterRate: false,
	onHover: function(currentIndex, currentRating, $el){
	      $('#imp').text(currentIndex);
	    },
	onLeave: function(currentIndex, currentRating, $el){
	        $('#imp').text(currentRating);
	    },
    callback: function(currentRating, $el){
        // make a server call here
    }
});


//----- 좌측 스케줄 리스트로부터 선택된 스케줄 detail 값 받아오기 -------------------------------------------------------------
function goDetail(sNo){
	console.log("goDetail")
	console.log(sNo + "번 스케줄 출력");
	
	$.ajax({
		url : "/b90ft4/schedule/rschedule.json",
		type: "POST",
		// 리스트의 a 스크립트 링크 내부에 심어놓은 스케줄 고유번호
		data: {scheduleNo : sNo},
		dataType: "json",
	}).done(printSchedule);
};

//----- 받아온 값으로 스케줄 출력 -------------------------------------------------------------------------------------
function printSchedule(result){
	console.log("디테일 꾸미기")
	var html = "";
	html += "<div id='sForm'>"
	html += "<div class='form-body pal'>"
	html += "<div class='form-group' id='schedule'>"
	html += "    <div class='input-icon right'>"
	html += "        <i class='fa fa-user'></i>"
	html += "        <input id='inputTitle' type='text' value='"+result.title+"' class='form-control' /></div>"
	html += "</div>"
	html += "<div class='row'>"
	html += "    <div class='col-md-6'>"
	html += "        <div class='form-group'>"
	html += "            <input id='inputStart' type='text' value='"+result.start+"' class='form-control' /></div>"
	html += "    </div>"
	html += "    <div class='col-md-6'>"
	html += "        <div class='form-group'>"
	html += "            <input id='inputEnd' type='text' placeholder='"+result.end+"' class='form-control' /></div>"
	html += "    </div>"
	html += "</div>"
	html += "<div class='form-group'>"
	html += "    <div class='input-icon right'>"
	html += "        <i class='fa fa-user'></i>"
	html += "        <input id='inputContent' type='text' placeholder='내용을 입력해주세요' value='"+result.content+"' class='form-control' /></div>"
	html += "</div>"
	html += "<div class='form-group'>"
	html += "   <select class='form-control' id='inputImportance'>"
	switch(result.importance){
	case '1':
		html += "       <option value='0'>☆ ☆ ☆</option>"
		html += "       <option value='1' selected='selected'>★ ☆ ☆</option>"
		html += "       <option value='2'>★ ★ ☆</option>"
		html += "       <option value='3'>★ ★ ★</option>"
		break;
	case '2':
		html += "       <option value='0'>☆ ☆ ☆</option>"
		html += "       <option value='1'>★ ☆ ☆</option>"
		html += "       <option value='2' selected='selected'>★ ★ ☆</option>"
		html += "       <option value='3'>★ ★ ★</option>"
		break;
	case '3':
		html += "       <option value='0'>☆ ☆ ☆</option>"
		html += "       <option value='1'>★ ☆ ☆</option>"
		html += "       <option value='2'>★ ★ ☆</option>"
		html += "       <option value='3' selected='selected'>★ ★ ★</option>"
		break;
	default:
		html += "       <option value='0' selected='selected'>☆ ☆ ☆</option>"
		html += "       <option value='1'>★ ☆ ☆</option>"
		html += "       <option value='2'>★ ★ ☆</option>"
		html += "       <option value='3'>★ ★ ★</option>"
	break;
	}
		
	html += "   </select></div>"
	html += "	<div class='form-actions text-center pal'>"
	html += "		<button onclick='goModify("+result.scheduleNo+");' class='btn btn-warning'>수정</button>"
	html += "		<button onclick='goDelete("+result.scheduleNo+");' class='btn btn-danger'>삭제</button>"
	html += "	</div>"
	html += "</div>"
	html += "</div>"
		
	$("#schDetail").html(html)
	prevNext(result.scheduleNo);
};

//----- 해당 스케줄의 이전, 다음 스케줄 연결 생성------------------------------------------------------------------------------
function prevNext(scheduleNo){
	console.log("prev & next")
	var prevHtml = "";
	var nextHtml = "";
	
	$.ajax({
		//고민점 : 이전 글이 삭제되어 고유번호가 비어있을 경우 건너뛰어 그 이전 글을 받아오려면?
		//범위검색을 하여 첫번째로 오는 값을 보여줄까?
		url : "/b90ft4/schedule/rschedule.json",
		type: "POST",
		data: {scheduleNo : scheduleNo-1},
		dataType: "json"
	}).done(function(result){
		console.log("prev");
		console.dir(result);
		if(result == null){
			prevHtml += "이전 스케줄이 존재하지 않습니다.";                                            
		}else{
			prevHtml += "<a href='javascript:goDetail("+result.scheduleNo+")'>";
			prevHtml += "이전 스케줄 : ";
			prevHtml += "<strong>"+result.title+"</strong>";
			prevHtml += "<p class='date'>"+result.start+"</p>";
			prevHtml += "</a>";
		}
		$("#prev").html(prevHtml)
	});
	
	$.ajax({
		url : "/b90ft4/schedule/rschedule.json",
		type: "POST",
		data: {scheduleNo : scheduleNo+1},
		dataType: "json"
	}).done(function(result){
		console.log("next");
		console.dir(result);
		if(result == null){
			nextHtml += "다음 스케줄이 존재하지 않습니다.";
		}else{
			nextHtml += "<a href='javascript:goDetail("+result.scheduleNo+")'>";
			nextHtml += "다음 스케줄 : ";
			nextHtml += "<strong>"+result.title+"</strong>";                    
			nextHtml += "<p class='date'>"+result.start+"</p>";                 
			nextHtml += "</p>";                                                 
			nextHtml += "</a>";                                                 
		}
		$("#next").html(nextHtml)
	})
};



//----- 스케줄 수정 폼 ------------------------------------------------------------------------------------------------------
function goModify(scheduleNo){
	console.log("goModify : "+scheduleNo+"번 스케줄")
	$.ajax({
		url : "/b90ft4/schedule/rschedule.json",
		type: "POST",
		// 리스트의 a 스크립트 링크 내부에 심어놓은 스케줄 고유번호
		data: {scheduleNo : scheduleNo},
		dataType: "json",
		success: function(){
			$.notify("스케줄을 수정합니다", {align:"center", verticalAlign:"middle", color: "#fff", background: "#D44950", blur: 0.2, delay: 1500});
		}
	}).done(modifyForm);
};


//----- 받아온 값으로 스케줄 출력-----------------------------------------------------------------------------------------------
function modifyForm(result){
	console.log("수정 폼 꾸미기")
	var html = "";
	html += "<div name='modifyForm' >"
	html += "<div class='form-body pal'>"
	html += "<div class='form-group' id='schedule'>"
	html += "    <div class='input-icon right'>"
	html += "        <i class='fa fa-user'></i>"
	html += "        <input id='inputTitle' type='text' value='"+result.title+"' class='form-control' /></div>"
	html += "</div>"
	html += "<div class='row'>"
	html += "    <div class='col-md-6'>"
	html += "        <div class='form-group'>"
	html += "            <input id='inputStart' type='text' value='"+result.start+"' class='form-control' /></div>"
	html += "    </div>"
	html += "    <div class='col-md-6'>"
	html += "        <div class='form-group'>"
	html += "            <input id='inputEnd' type='text' placeholder='"+result.end+"' class='form-control' /></div>"
	html += "    </div>"
	html += "</div>"
	html += "<div class='form-group'>"
	html += "    <div class='input-icon right'>"
	html += "        <i class='fa fa-user'></i>"
	html += "        <input id='inputContent' type='text' placeholder='내용을 입력해주세요' value='"+result.content+"' class='form-control' /></div>"
	html += "</div>"
	html += "<div class='form-group'>"
	html += "   <select class='form-control' id='inputImportance'>"
		console.log("importance 값 : "+result.importance)
	switch(result.importance){
	case '1':
		html += "       <option value='0'>☆ ☆ ☆</option>"
		html += "       <option value='1' selected='selected'>★ ☆ ☆</option>"
		html += "       <option value='2'>★ ★ ☆</option>"
		html += "       <option value='3'>★ ★ ★</option>"
		break;
	case '2':
		html += "       <option value='0'>☆ ☆ ☆</option>"
		html += "       <option value='1'>★ ☆ ☆</option>"
		html += "       <option value='2' selected='selected'>★ ★ ☆</option>"
		html += "       <option value='3'>★ ★ ★</option>"
		break;
	case '3':
		html += "       <option value='0'>☆ ☆ ☆</option>"
		html += "       <option value='1'>★ ☆ ☆</option>"
		html += "       <option value='2'>★ ★ ☆</option>"
		html += "       <option value='3' selected='selected'>★ ★ ★</option>"
		break;
	default:
		html += "       <option value='0' selected='selected'>☆ ☆ ☆</option>"
		html += "       <option value='1'>★ ☆ ☆</option>"
		html += "       <option value='2'>★ ★ ☆</option>"
		html += "       <option value='3'>★ ★ ★</option>"
	break;
	}
		
	html += "   </select></div>"
	html += "<div class='form-actions text-center pal'>"
	html += "	<button onclick='modifySubmit("+result.scheduleNo+")' class='btn btn-success'>수정</button>"
	html += "	<a href='javascript:goDetail("+result.scheduleNo+");' class='btn btn-danger'>취소</a>"
	html += "</div>"
	html += "</div>"
	html += "</div>"
		
	$("#schDetail").html(html)
	prevNext(result.scheduleNo);
};


//----- 스케줄 수정 서브밋 ------------------------------------------------------------------------------------------------------
function modifySubmit(scheduleNo){
	console.log("modifySubmit : "+scheduleNo+"번 스케줄")
	
	swal({
		  title: "정말 수정하시겠습니까?",
		  text: "선택한 스케줄이 변경됩니다",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "수정",
		  closeOnConfirm: false
		},
		function(){
				swal("수정", "스케줄이 변경되었습니다", "success");
				$.ajax({
					url : "/b90ft4/schedule/modify.json", // dho 이게 적용이 안돼 이상해 모르겠어 ㄷㄷ
					type: "POST",
					data: { scheduleNo: scheduleNo,
						userId: 'tester01',
						start: $("input[id=inputStart]").val(),
						end: $("input[id=inputEnd]").val(),
						title: $("input[id=inputTitle]").val(),
						content: $("input[id=inputContent]").val(),
						importance:$("select[id=inputImportance]").val(),
						category: 1,
						achieve: 1
					},
					dataType: "json"
				}).done(goDetail);
			});
};


//----- 스케줄 삭제----------------------------------------------------------------------------------------------------------
function goDelete(scheduleNo){
	console.log("goDelete : "+scheduleNo+"번 스케줄")
	swal({
	  title: "정말 삭제하시겠습니까?",
	  text: "선택한 스케줄이 삭제됩니다",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#DD6B55",
	  confirmButtonText: "삭제",
	  closeOnConfirm: false
	},
	function(){
		console.log("inner del function")
		$.ajax({
			url : "/b90ft4/schedule/delete.json",
			type: "POST",
			data: {scheduleNo : scheduleNo},
			dataType: "json"
		}).done(function(){
			swal("삭제", "스케줄이 삭제되었습니다", "success");
			})
			
		});
	
//	$.ajax({
//		url : "/b90ft4/schedule/delete.json",
//		type: "POST",
//		data: {scheduleNo : scheduleNo},
//		dataType: "json"
//	}).done(function(){
//		alert("삭제됨");
//	});
	console.log("goDelete...")
	
};


//----- 스케줄 입력---------------------------------------------------------------------------------------------------
function scheduleForm(form){
	console.log("insertForm")
	console.dir(form)
	
	if ($("#inputTitle").val() == "") {
		swal("등록", "제목을 입력하세요", "error");
		$("input[id=inputTitle]").focus();
		return false;
	}
	if ($("input[id=inputStart]").val() == "") {
		swal("등록", "스케줄이 시작될 시간을 지정해주세요", "error");
		$("input[id=inputStart]").focus();
		return false;
	}
	if ($("input[id=inputEnd]").val() == "") {
		swal("등록", "스케줄이 종료될 시간을 지정해주세요", "error");
		$("input[id=inputEnd]").focus();
		return false;
	}
	
	console.log("title : "+$("input[id=inputTitle]").val());
	console.log("start : "+$("input[id=inputStart]").val());
	console.log("end : "+$("input[id=inputEnd]").val());
	console.log("content : "+$("input[id=inputContent]").val());
	console.log("importance : "+$("select[id=inputImportance]").val());
//	$.ajax({
//		url : "/b90ft4/schedule/insertSchedule.json",
//		type: "POST",
//		data: { scheduleNo: scheduleNo,
//				start: $("input[id=inputStart]").val(),
//				end: $("input[id=inputEnd]").val(),
//				title: $("input[id=inputTitle]").val(),
//				content: $("input[id=inputContent]").val(),
//				importance:$("select[id=inputImportance]").val()
//		},
//		dataType: "json"
//	}).done(goDetail);
	return true;
};


function swTest(){
	swal({
		  title: "정말 삭제하시겠습니까?",
		  text: "선택한 스케줄이 삭제됩니다",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "삭제",
		  closeOnConfirm: false
		},
		function(){
				swal("삭제", "스케줄이 삭제되었습니다", "success");
			});
}

