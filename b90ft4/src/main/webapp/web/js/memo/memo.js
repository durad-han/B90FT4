
	    memoCheck();
	
		console.log($("#showAndHideMemo").prop("checked"));
		
		function memoCheck(){
			if($("#showAndHideMemo").prop("checked")){
				bringMemo();
			}else {
				//console.log("ㅋㅋ");
				$("div.memo").each(function() {
					$(this).remove();
				});
			}
		}

		$("#showAndHideMemo").change(function() {
			memoCheck();
			console.log($("#showAndHideMemo").prop("checked"));
		})
		
		$("#addMemo").click(function() {
			
			var obj =  $("<div></div>").css({
					       position: "absolute",
					       left:"300px",
					       top:"300px",
					       width:"150px",
					       height:"250px",
					       background: "#ffff9d",
					       "z-index" : "1049"
			       	   })
					   .attr("class","memo")
					   .append(
						$("<div class='memoContent'></div>")
						.attr("contentEditable",true)
						.css({
						   width:"145px", 
					       height: "190px",
					       background : "#ffff9d",
						   overflow : "auto",
						   margin: "0 auto"
					       }
						));
						
//			$("#last").after(obj);
			$("body").append(obj);
			
			$.ajax({
				url:"/b90ft4/memo/save.do",
				data: {
					"posX" : $(obj).offset().left,
					"posY" : $(obj).offset().top,
					"memoWidth" :$(obj).width(),
					"memoHeight" :$(obj).height()
				}
			}).done(function (memoNo) {
				$(obj)
				.attr("id",memoNo)
				.prepend("<div style='cursor: move;width:100%;height:50px;background:yellow'><a class='button remove' onclick='delMemo("+memoNo+")' style='margin-left:84%'>X</a></div>");
			});
			
		});
		
		// 메모 이동
		$("body").on("mousedown","div.memo",function(e){
			
			e.stopPropagation();
			
			var x = e.offsetX;
			var y = e.offsetY;
			var that = $(this);
 			var width = that.width();
 			var height = that.height();
			
 			// 서쪽
			if(x >=0 && x<=4) {
				westSide(this);
			}	
//			
			// 동쪽
			if(x >=width-4  && x <= width){
				console.log("동쪽");
				eastSide(this);
			}
//			
//			// 북쪽
			if(y>=0 && y<=4){
				northSide(this);				
			}
//			
			// 남쪽
			if(y>=height-4  && y <= height){
				southSide(this);
			}
			
			if( !(x >=0 && x<=4) &&
				!(x >=width-4  && x <= width) &&
				!(y>=0 && y<=4) &&
				!(y>=height-4  && y <= height))
			{
				moveMemo();
			}
 			
//			$(this).siblings().attr({
//				ondragstart:"return false;",
//				onselectstart:"return false"
//			});

			
//			$(document).on("dragstart",function() {
//				return false;
//			});
//			
//			$(document).on("selectstart",function() {
//				return false;
//			});

//			$(this).siblings().on("dragstart",function(){
//				return;
//			});

//			$(this).siblings().on("selectstart",function(){
//				return;
//			});
			
			console.log("시블링");
			
			
		// 메모 이동.
		function moveMemo() {
			$(document).mousemove(function(event) {
				that.css("left", event.clientX - x);
				that.css("top", event.clientY + $(document).scrollTop() - y);
				that.css("opacity", "0.5");
			}).mouseup(function() {
				$(this).off();
			});
		}
			
		// edit.do
		}).on("mouseup","div.memo",function() {
			
			
//			$(document).off("dragstart");
//			$(document).off("selectstart");

			
			$(this).css("opacity","1");
			
			$.ajax({
				url:"/b90ft4/memo/edit.do",
				data: {
					"posX" : $(this).offset().left,
					"posY" : $(this).offset().top,
					"memoNo" : $(this).attr("id"),
					"memoContent" : $(this).find("div:eq(1)").html(),
					"memoWidth" : $(this).width(),
					"memoHeight" : $(this).height()
				}
			}).done(function (result) {
			});
			
			if($('#budgetModal').length > 0 ){
//				console.log("존재");
//				$('#budgetModal').hide();
//				$("#myModal").remove();
//				console.log("삭제");
				
//				$("body").append($(div));
//				console.log("삽입");
				
//				$('#budgetModal').show();
//				$("#myModal").show();
				
				
			}else{
				console.log("존재 X");
			}
			
			
			// edit.do
		}).on("keyup","div.memo",function() {
			$.ajax({
				url:"/b90ft4/memo/edit.do",
				data: {
					"posX" : $(this).offset().left,
					"posY" : $(this).offset().top,
					"memoNo" : $(this).attr("id"),
					"memoContent" : $(this).find("div:eq(1)").html(),
					"memoWidth" : $(this).width(),
					"memoHeight" : $(this).height()
				}
			}).done(function (result) {
			});
		}).on("mousedown","div.memoContent",function(e) {
			e.stopPropagation();
		}).on("mousemove","div.memo",function(e) {
			
			e.stopPropagation();
			
			var x = e.offsetX;
 			var y = e.offsetY;
			var width = $(this).width();
			var height = $(this).height();
			
			// 동서쪽
			if(x>=0 && x<=4 || x >=width-4  && x <= width){
				$(this).css("cursor","e-resize");
				
				if(x >=0 && x<=4){
// 					console.log("서쪽");
				}
				
				if(x >=width-4  && x <= width){
// 					console.log("동쪽");
				}
			}
			
			// 남북쪽
			if(y>=0 && y<=4 || y>=height-4 && y<=height) {
				
				// 북쪽 버그 있다..
//				if(y >=0 && y<=4){
// 					console.log("북쪽",y); 
//				}
				
				if(y >=height-4  && y <= height){
					$(this).css("cursor","s-resize");
// 					console.log("남쪽");
				}
			}

			// 남서쪽
			if( (x>=0 && x<=4) && (y>=height-4 && y<=height)  ) {
				$(this).css("cursor","sw-resize");
// 				console.log("남서쪽");
			}
			
			// 북서쪽
			if( (x>=0 && x<=4) && (y>=0 && y<=4)  ) {
				$(this).css("cursor","nw-resize");
// 				console.log("북서쪽");
			}
			
			// 북동쪽
			if( (y>=0 && y<=4) && (x>=width-4 && x<=width)  ) {
				$(this).css("cursor","ne-resize");
// 				console.log("북동쪽");
			}
			
			// 남동쪽
			if( (y>=height-4 && y<=height) && (x>=width-4 && x<=width)  ) {
				$(this).css("cursor","se-resize");
// 				console.log("남동쪽");
			}
			
			
			// 기본 커서
			if(		!(x>=0 && x<=4 || x >=width-4  && x <= width)
				 && !(y>=0 && y<=4 || y>=height-4 && y<=height) )
			{
// 				console.log("마우스 커서 변경 종료.");
				$(this).css("cursor","default");
			}
			
		});
		
		
		function delMemo(id){
			if(!confirm("메모를 삭제하시겠습니까?")) return;
			
			console.log(id);
			$.ajax({
				url:"/b90ft4/memo/delete.do",
				data : {memoNo : id}
			}).done(function(result) {
				console.log(result);
				$("#"+id).remove();
			});
		}
		
		// 서버로부터 메모 가져오기.
		function bringMemo(){
			$.ajax({
				
				url: "/b90ft4/memo/list.do",
				dataType: "json"
				
			})
			.done(function (sList) {
		
				for(var i=0;i<sList.length;i++){
					
					console.log(sList[i]);
					
					var obj = 
						$("<div></div>").css({
					       position: "absolute",
					       left:sList[i].posX,
					       top:sList[i].posY,
					       width:sList[i].memoWidth+"px",
					       height:sList[i].memoHeight+"px",
					       background: "#ffff9d",
				    	   "z-index" : "1049"
			       	   })
					   .attr("class","memo")
					   .attr("id",sList[i].memoNo)
					   .append("<div style='cursor: move;width:100%;height:40px;background:yellow;'><a type='button' class='button remove' onclick='delMemo("+sList[i].memoNo+")' style='margin-left:90%'>X</a></div>")
					   .append(
						$("<div class='memoContent'></div>")
								.attr("contentEditable",true)
								.css({
								   width:sList[i].memoWidth-5+"px", 
							       height: sList[i].memoHeight-45+"px",
							       background : "#ffff9d",
								   overflow : "auto",
							       margin: "0 auto"
								}).html(sList[i].memoContent));
					
					$("body").append(obj);
//					$("#last").after(obj);
					
				}
			});
		}	
		
		
	// 메모 크기 조절.
		
 	// 북쪽
	function northSide(that) {
	
		$(document).mousemove(function(e) {
			
		var size = (($(that).offset().top) - e.clientY);
		
		if(size<=0 && $(that).height()<=300){
			return;
		}
			
			
		$(that).css({
			"top" : "-="+size,
			"height" : "+="+size
		});
		
		$(that).find("div.memoContent").css({
			"height" : $(that).height() - 50
		});
			
		
		}).mouseup(function() {
			$(document).off();
	//			console.log("북쪽 document 마우스 업");
		});
	}
	
	
	// 서쪽 
	function westSide(that) {
		$(document).mousemove(function(e) {

		var size = (($(that).offset().left) - e.clientX);
		
		if(size<=0 && $(that).width()<=200){
			return;
		}
	
		$(that).css({
			"left" : "-="+ size,
			"width" : "+="+ size
		});
		
		$(that).find("div.memoContent").css({
			"width" : $(that).width()-10
		});
		
		
		}).mouseup(function() {
			$(document).off();
	//			console.log("서쪽 document 마우스 업");
		});
	}
	
	
	// 동쪽
	function eastSide(that) {
	
		$(document).mousemove(function(e) {
			
		var size = e.clientX - ($(that).offset().left += $(that).width());

//			console.log("size : " + size);
		
		if(size<=0 && $(that).width()<=200
				){
			return;
		}
		
		$(that).css({
			"width" : "+="+size
		});
		
		$(that).find("div.memoContent").css({
			"width" : $(that).width()-10
		});

		
		}).mouseup(function() {
			$(document).off();
	//			console.log("동쪽 document 마우스 업");
		});
	}
	
	
	// 남쪽
	function southSide(that) {
	
		$(document).mousemove(function(e) {
		
		var size = e.clientY - ($(that).offset().top += $(that).height());
		
		if(size<=0 && $(that).height()<=300){
			return;
		}
		
		$(that).css({
			"height" : "+="+size
		});
		
		console.log("size : " + size);
		
		$(that).find("div.memoContent").css({
			"height" : $(that).height() - 30
		});
		
//		console.log("memo : " + $(that).height(),"memoContent : " + $(that).find("div.memoContent").height());
		
		}).mouseup(function() {
			$(document).off();
	//			console.log("남쪽 document 마우스 업");
		});
	}
		
	$(document).ready(function() {
	    $(".dropdown-toggle").dropdown();
	});