		memoCheck();
	
		function memoCheck(){
			if($("#showAndHideMemo").prop("checked")){
				$("label[for=showAndHideMemo]").text("메모 보기");
				bringMemo();
			}else {
				$("label[for=showAndHideMemo]").text("메모 숨기기");
				$("div.memo").each(function() {
					$(this).remove();
				});
			}
		}


		$("#showAndHideMemo").click(function() {
			memoCheck();
		})
		
		$("#addMemo").click(function() {
			
			var obj =  $("<div></div>").css({
					       position: "absolute",
					       left:"300px",
					       top:"300px",
					       "z-index" : "999999"
			       	   })
					   .attr("class","memo")
					   .append(
						$("<div class='memoContent'></div>")
						.attr("contentEditable",true)
						.css({
						   width:"150px", 
					       height: "200px",
					       background : "#ffff9d",
					       overflow: "auto"
					       }
						));
						
			
			$("body").append(obj);
			
			$.ajax({
				url:"/b90ft4/memo/save.do",
				data: {
					"posX" : $(obj).offset().left,
					"posY" : $(obj).offset().top
				}
			}).done(function (memoNo) {
				$(obj)
				.attr("id",memoNo)
				.prepend("<div style='width:150px;height:30px;background:yellow'><button type='button' onclick='delMemo("+memoNo+")' style='margin-left:84%'>X</button></div>");
			});
			
			
		});
		
		
		$("body").on("mousedown","div.memo",function(e){
			
			var offsetX = e.offsetX;
			var offsetY = e.offsetY;
			
			var that = $(this);
			
			$(document).mousemove(function(event) {
				that.css("left",event.clientX - offsetX);
				that.css("top",event.clientY - offsetY);
				that.css("opacity","0.5");
			}); 
			
			
		}).on("mouseup","div.memo",function() {
			
			$(document).off("mousemove");
			$(this).css("opacity","1");
			
			$.ajax({
				url:"/b90ft4/memo/edit.do",
				data: {
					"posX" : $(this).offset().left,
					"posY" : $(this).offset().top,
					"memoNo" : $(this).attr("id"),
					"memoContent" : $(this).find("div:eq(1)").html()
				}
			}).done(function (result) {
			});
			
			
		}).on("keyup","div.memo",function() {
			$.ajax({
				url:"/b90ft4/memo/edit.do",
				data: {
					"posX" : $(this).offset().left,
					"posY" : $(this).offset().top,
					"memoNo" : $(this).attr("id"),
					"memoContent" : $(this).find("div:eq(1)").html()
				}
			}).done(function (result) {
			});
		}).on("mousedown","div.memoContent",function(e) {
			e.stopPropagation();
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
		
		
		function bringMemo(){
			$.ajax({
				
				url: "/b90ft4/memo/list.do",
				dataType: "json"
				
			})
			.done(function (sList) {
		
				for(var i=0;i<sList.length;i++){
					
					var obj = 
						$("<div></div>").css({
					       position: "absolute",
					       left:sList[i].posX,
					       top:sList[i].posY,
					       "z-index" : "999999"
			       	   })
					   .attr("class","memo")
					   .attr("id",sList[i].memoNo)
					   .append("<div style='width:150px;height:30px;background:yellow;'><button type='button' onclick='delMemo("+sList[i].memoNo+")' style='margin-left:84%'>X</button></div>")
					   .append(
						$("<div class='memoContent'></div>")
								.attr("contentEditable",true)
								.css({
								   width:"150px", 
							       height: "200px",
							       background : "#ffff9d",
							       overflow: "auto"
								}).html(sList[i].memoContent));
					
					$("body").append(obj);
					
				}
			});
		}	
		