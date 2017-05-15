/**
 * http://usejsdoc.org/
 */

	var flag=true;
	$("#list").css("visibility","hidden");
	$("#addDiv").hide();

	$("#showList").click(function() {
		
		if(!flag){
			$("#list").css("visibility","hidden");
			$("#addDiv").hide();
			flag=true;
		}else{
			$("#list").css("visibility","visible");
			$("#addDiv").show();
			flag=false;
		}
	});

	var socket;
	var html="";
	
	var madeRoom = [];
	
	socket = io.connect("http://192.168.0.119:10001");
	socket.emit("passId",myId);
	
// 	socket.on("chatWith",function(data) {
// 		makeRooms(data);
// 	});
	
	// 메시지 받기
	socket.on("msg",function (data) {
		
		 var msg = "";
		
	   	 msg+='             <li class="left clearfix">                                                                                ' ;
	     msg+='                 <span class="chat-img pull-left">                                                                     ' ;
	     msg+='				      <img src="http://placehold.it/50/55C1E7/fff&text=JS" alt="User Avatar" class="img-circle" />       ' ;
	     msg+=' 				</span>                                                                                                  ' ;
	     msg+='                 <div class="chat-body clearfix">                                                                      ' ;
	     msg+='                     <div class="header">                                                                              ' ;
	     msg+='                         <strong class="primary-font">'+data.sender+'</strong> <small class="pull-right text-muted">      ' ;
	     msg+='   						  <span class="glyphicon glyphicon-time"></span>12 mins ago</small>                          ' ;
	     msg+='                     </div>                                                                                            ' ;
	     msg+='                     <p style="font-weight:bold;color:black"> ';
	  	 msg+= 							data.msg;
	     msg+='                     </p>                                                                                              ' ;
	     msg+='                 </div>                                                                                                ' ;
	     msg+='             </li> ';
		
		$("#"+data.sender).append(msg);
		
		resize(data.sender);
		
	});
	
	// 메시지 가져오기 두번째 단계 
	socket.on("bringMsg",function(data) {
		
		data.rows.forEach(function(row,i) {
			
			var msg = "";
			
			if(row.user==myId) {
				
				 msg+='             <li class="right clearfix"><span class="chat-img pull-right">                                             ' ;
			     msg+='                 <img src="http://placehold.it/50/FA6F57/fff&text=BP" alt="User Avatar" class="img-circle" />          ' ;
			     msg+='             </span>                                                                                                   ' ;
			     msg+='                 <div class="chat-body clearfix">                                                                      ' ;
			     msg+='                     <div class="header">                                                                              ' ;
			     msg+='                         <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>13 mins ago</small>  ' ;
			     msg+='                         <strong class="pull-right primary-font">'+row.user+'</strong>                                ' ;
			     msg+='                     </div>                                                                                            ' ;
			     msg+='						<p style="text-align:right;font-weight:bold;color:black"> ';                                                                          
			     msg+= 						row.msg;
			     msg+='                     </p>                                                                                              ' ;
			     msg+='                 </div>                                                                                                ' ;
			     msg+='             </li> ' ;    
				
			}else {
				
				 msg+='             <li class="left clearfix">                                                                                ' ;
			     msg+='                 <span class="chat-img pull-left">                                                                     ' ;
			     msg+='				      <img src="http://placehold.it/50/55C1E7/fff&text=JS" alt="User Avatar" class="img-circle" />       ' ;
			     msg+=' 				</span>                                                                                                  ' ;
			     msg+='                 <div class="chat-body clearfix">                                                                      ' ;
			     msg+='                     <div class="header">                                                                              ' ;
			     msg+='                         <strong class="primary-font">'+row.user+'</strong> <small class="pull-right text-muted">      ' ;
			     msg+='   						  <span class="glyphicon glyphicon-time"></span>12 mins ago</small>                          ' ;
			     msg+='                     </div>                                                                                            ' ;
			     msg+='                     <p style="font-weight:bold;color:black">                                                                                               ' ;
			  	 msg+= 							row.msg;
			     msg+='                     </p>                                                                                              ' ;
			     msg+='                 </div>                                                                                                ' ;
			     msg+='             </li> ';
				
			}
			
			$("#"+data.user).append(msg); // 대화창에 메시지 추가.
	
		});
		
		resize(data.user); // 상대방 유저.
		
	});
	
	// 메시지 전달.
	function msg(that) {
		
		var roomNo = that.getAttribute("data-roomNo");
		var recvId = that.getAttribute("data-recvId");
		var myMsg = $("[data-input=" +recvId + "]").val();
	 
	  	 var msg="";
	  	 
	     msg+='             <li class="right clearfix"><span class="chat-img pull-right">                                             ' ;
	     msg+='                 <img src="http://placehold.it/50/FA6F57/fff&text=BP" alt="User Avatar" class="img-circle" />          ' ;
	     msg+='             </span>                                                                                                   ' ;
	     msg+='                 <div class="chat-body clearfix">                                                                      ' ;
	     msg+='                     <div class="header">                                                                              ' ;
	     msg+='                         <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>13 mins ago</small>  ' ;
	     msg+='                         <strong class="pull-right primary-font">'+myId+'</strong>                                ' ;
	     msg+='                     </div>                                                                                            ' ;
	     msg+='						<p style="text-align:right;font-weight:bold;color:black"> ';                                                                          
	     msg+= 						myMsg;
	     msg+='                     </p>                                                                                              ' ;
	     msg+='                 </div>                                                                                                ' ;
	     msg+='             </li> ' ;    
		
		$("#"+recvId).append(msg); // 내 대화창
		
		 $("[data-input=" +recvId + "]").val("");
		socket.emit("msg",{roomNo:roomNo ,recvId:recvId,msg:myMsg} );
	
		resize(recvId);
		
	}
	
	// 대화창 크기 조절.
	function resize(user) {
		
		var chat = document.querySelector("[data-scroll="+user+"]");
		var th = chat.scrollHeight+20;
		var dh = $("[data-scroll="+user+"]").height();
		var size = th - dh;
		$("[data-scroll="+user+"]").scrollTop(size);
		
	} 
	
	// 방 만들기
	function makeRoom(that) {
		
		var data = {};
		
		data.room_no = that.getAttribute("data-roomNo");
		data.user = that.getAttribute("data-recvId");
		
		if(madeRoom[data.user]){
			console.log("이미 방이 있다..");
			return;
		}

		madeRoom[data.user] = "exist";
		
		console.log("roomNo :", data.room_no);
		console.log("customer :", data.user);
	
	   html+=' <div id="chat" data-close="'+data.user+'" class="panel panel-primary" style="width: 500px;height: 350px;border: 1px solid blue;z-index:99999999;">                                ' ;
	   html+='     <div class="panel-heading" style="background:#337ab7;border-color:#337ab7 !important;">                                                                                       ' ;
       html+='         <span class="glyphicon glyphicon-comment"></span> '+data.user+'님과의 대화창                                              ' ;
       html+='         <div class="btn-group pull-right">                                                                            ' ;
       html+='             <button type="button" data-id="'+data.user+'" class="btn btn-default btn-xs" onclick="closeRoom(this);"  >    ' ;
       html+='					   <span class="glyphicon glyphicon-chevron-down"></span>                                            ' ;
       html+='			   </button>                                                                                                 ' ;
//        html+='            <ul class="dropdown-menu slidedown">                                                                       ' ;
//        html+='             </ul>                                                                                                     ' ;
       html+='         </div>                                                                                                        ' ;
       html+='     </div>                                                                                                            ' ;
      
       html+='     <div class="panel-body chat" data-scroll='+data.user+'>                                                                                          ' ;
       html+='         <ul class="chat" id="'+data.user+'">                                                                                             ' ;
       
       html+='                                                                                                                       ' ;
       html+='         </ul>                                                                                                         ' ;
       html+='     </div>                                                                                                            ' ;
      
      
       html+='     <div class="panel-footer" style="background-color: #f5f5f5;border-top: 1px solid #ddd;">                                                                                        ' ;
       html+='         <div class="input-group">                                                                                     ' ;
       html+='             <input id="btn-input" type="text" class="form-control input-sm" data-input="'+data.user+'" placeholder="Type your message here..." />' ;
       html+='             <span class="input-group-btn">                                                                            ' ;
       html+='                 <button class="btn btn-warning btn-sm" id="btn-chat"  data-roomNo="'+data.room_no+'" data-recvId="'+data.user+'"  onclick="msg(this)">';
       html+='                     Send</button>                                                                                     ' ;
       html+='             </span>                                                                                                   ' ;
       html+='         </div>                                                                                                        ' ;
       html+='     </div>                                                                                                            ' ;
   
       html+=' </div> ';

		
		$("body").append(html);
		
		html="";
		
		// 메시지 가져오기 첫단계
		socket.emit("giveMsg",{roomNo: data.room_no , user:data.user});
		
	}

	// 마우스 다운 이벤트 무시..
	
	// 방 닫기.
	function closeRoom(that) {
		console.log("방 닫기");
		var user = that.getAttribute("data-id");
		delete madeRoom[user];
		$("[data-close="+user+"]").remove();
	}
	

	// 방 목록 만들기
	function makeRoomList(data) {
		
		var html="";
			html+='<ul class = "list-group"> ';
			for(var i=0;i<data.length;i++) {
				
				html+='<li class = "list-group-item" '; 
				html+='	data-recvId="'+data[i].user+'" data-roomNo="'+data[i].room_no+'" onclick="makeRoom(this);">'; 
				html+=  data[i].user+'님 과의 대화</li>';
			}
			html+='</ul>'
			
		$("#list").html(html);
			
	}
	
	// 방 가져오기 1 단계
// 	$("#bringRoom").click(function() {
// 		socket.emit("giveRoom",myId);
// 	});
	
	// 방 가져오기 1 단계
	socket.emit("giveRoom",myId); 
	
	// 방 가져오기 2 단계
	socket.on("bringRoom",function(data) {
		makeRoomList(data);
	});
	
	
	// 친구 추가
	$("#addFriend").click(function() {
		socket.emit("retrieveUser",$("#friend").val());		
	});
	
	// 자기 관리 순위로 친구 추가.
	function addFriend(id) {
		console.log(id);
		$("#friend").val(id);
		$("#addFriend").trigger("click");
//		socket.emit("retrieveUser",id+"");	
	}
	
	
	// 유저 체크.
	socket.on("userCheckResult",function(data) {
		if(data.status == 'true'){
			socket.emit("chatWith",$("#friend").val()); // 친구와 방 생성 작업.
			socket.emit("giveRoom",myId);  				// 매칭된 친구와의 대화방 모두 가져오는 작업.
			alert(data.msg);
		}
		if(data.status == 'false'){
			// case 1. : 비회원.
			// case 2. : 이미 친구인 경우.
			alert(data.msg);
		}
		
		$("#friend").val(""); // 친구 창 비우기.
	});
	
	
	// 이 아래는 중요도가 낮다.
	
	// addDiv,list 위치 조정
//	var listWidth = $("#showList").width();
//	var listheight = $("#showList").height();
//	var listTop   = $("#showList").offset().top;
//	var listLeft  = $("#showList").offset().left;
////	
//	$("#addDiv").css({
//		position:"fixed",
//		left:listLeft,
//		top: listTop + listheight + 15
//	});
//	
//	$("div#list").css({
//		position:"fixed",
//		left: listLeft,
//		top: listTop - 200
//	});
//	
// 	$("#list").toggle(1000);
		
	
	// 대화창 움직이게 하기
	$("body").on("mousedown", "div#chat", function(e) {
		
			var offsetX = e.offsetX;
			var offsetY = e.offsetY;

			var that = $(this);

			$(document).mousemove(function(event) {
				that.css("left", event.clientX - offsetX);
				that.css("top", event.clientY - offsetY);
				that.css("opacity", "0.5");
			});
			
	}).on("mouseup", "div#chat", function() {

		$(document).off("mousemove");
		$(this).css("opacity", "1");

	// 이벤트 전파 중지.
	}).on("mousedown",".panel-body",function(e) {
		e.stopPropagation();
	}).on("mousedown",".panel-footer",function(e) {
		e.stopPropagation();
	});