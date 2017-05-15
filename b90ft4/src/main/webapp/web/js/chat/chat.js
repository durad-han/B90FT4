/**
 * http://usejsdoc.org/
 */

	var socket;
	var html="";
	
	var madeRoom = [];
	
	socket = io.connect("http://192.168.0.60:10001");
	socket.emit("passId",myId);
	
	socket.on("socket",function(data){
		socket = data;
		console.log(socket.id);
	})
	
	
	// 메시지 받기
	socket.on("msg",function (data) {
		
		 var msg = "";
		 
		msg+='<li class="odd">';
		msg+='    <p>';
		msg+='        <img src="/b90ft4/web/image/accountBook/팬더.jpg" class="avt" /><span class="user">'+data.sender+'</span><span';
		msg+='            class="time">09:33</span></p>';
		msg+='    <p>';
		msg+= 	  data.msg +'</p>';
		msg+='</li>';
	  	
		$("#"+data.sender).append(msg);
		
		var height = 0;
        
		$("#"+data.sender).find('li').each(function(i, value){
            height += parseInt($(this).height());
        });
        height += '';
        //alert(height);
        $("#"+data.sender).scrollTop(height);  // add more 400px for #chat-box position   
		
		
	});
	
	// 메시지 가져오기 두번째 단계 ( 채팅방을 열 때 내용을 가져온다.)
	socket.on("bringMsg",function(data) {
		
		var user = "";
		var msg = "";
		
		data.rows.forEach(function(row,i) {
			
			
			if(row.user==myId) {
				msg+='<li>';
				msg+='    <p>';
				msg+='        <img src="/b90ft4/web/image/accountBook/팬더.jpg" class="avt" /><span class="user">'+myId+'</span><span';
				msg+='            class="time">09:33</span></p>';
				msg+='    <p>';
				msg+= 	  row.msg +'</p>';
				msg+='</li>';
			}else {
				user = row.user;
				msg+='<li class="odd">';
				msg+='    <p>';
				msg+='        <img src="/b90ft4/web/image/accountBook/팬더.jpg" class="avt" /><span class="user">'+row.user+'</span><span';
				msg+='            class="time">09:33</span></p>';
				msg+='    <p>';
				msg+= 	  row.msg +'</p>';
				msg+='</li>';
			}
			
	
		});
		
		$("#"+user).html(msg); // 대화창에 메시지 추가.
		
		var height = 0;
		$("#"+user).find('li').each(function(i, value){
            height += parseInt($(this).height());
        });
        height += '';
        //alert(height);
        $("#"+user).scrollTop(height);  // add more 400px for #chat-box position   
		
		
	});
	
	
	// 방 닫기.
	function closeRoom(that) {
		console.log("방 닫기");
		var user = that.getAttribute("data-id");
		delete madeRoom[user];
		$("[data-close="+user+"]").remove();
	}
	
	// 방 삭제
	function deleteRoom(e){
		e.stopPropagation();
		console.log("전파 중지..");
		
		var that = e.target.parentNode; // li 요소
		// 부모 삭제
		var no = $(that).attr("data-roomNo");
		var user = $(that).attr("data-recvId");
//		console.log("삭제할 방번호 : ",no,user);
		
//		alert(confirm("삭제하시겠습니까?"));
		
		if(confirm("삭제하시겠습니까?")){
			that.parentNode.removeChild(that);
			socket.emit("deleteRoom",{roomNo:no,recvId:user});
		}
	}
	
	// 방만들기, 방삭제
	$("body").on("click","button#deleteRoom",deleteRoom);
//			 .on("click",".list-group.chat li",makeRoom);
	

	// 방 목록 만들기
	function makeRoomList(data) {
		
		console.log("방 만들기.");
		
		var onhtml="";
		var offhtml="";
		onhtml +='<strong>online</strong>';
		offhtml +='<strong>offline</strong>';
			
		for(var i=0;i<data.length;i++) {
				var userStatus = '';
				var dataRecvId = data[i].user;
				var dataRoomNo= data[i].room_no;
				
				if(data[i].login=='y'){
					onhtml +='<a href="#" data-recvId="'+dataRecvId+'" data-roomNo="'+dataRoomNo+'" >';
					onhtml +='<span class="user-status is-online"></span>' 
					onhtml +='<small>'+data[i].user+'</small>'; 
					onhtml +='</a>';
					
				}else {
					offhtml +='<a href="#" data-recvId="'+dataRecvId+'" data-roomNo="'+dataRoomNo+'" >';
					offhtml +='<span class="user-status is-offline"></span>' 
					offhtml +='<small>'+data[i].user+'</small>'; 
					offhtml +='</a>';
				}
		} 
		
		if(onhtml.indexOf("<a") == -1) {
			onhtml+="<span style='color:white;margin-left:50px;'>친구를 추가해보세요!</span>";
		}
		
		if(offhtml.indexOf("<a") == -1) {
//			offhtml+="<span style='color:white;'>친구를 추가해보세요!</span>";
		}
		
		$("#group-1").html(onhtml);
		$("#group-2").html(offhtml);
			
	}
	
	
	// 방 가져오기 1 단계
// 	$("#bringRoom").click(function() {
// 		socket.emit("giveRoom",myId);
// 	});
	
	// 방 가져오기 1 단계 - 서버에서 bringRoom 동작시킨다.
	socket.emit("giveRoom",myId); 
	
	// 방 가져오기 2 단계 - 방 목록이 생성된다.
	socket.on("bringRoom",function(data) {
		
		// 방 목록 만들기
		makeRoomList(data);
		
	    // 방 목록에 방 만드는 이벤트 걸기.
	    console.log("방 만들기 이벤트 걸기");
	    $('#chat-form .chat-group a').unbind('*').click(function(){
	       
	    	$('#chat-box').hide();
	    	
	    	$('ul.chat-box-body').html(""); // 초기화
	    	$('#chat-form .chat-group a').removeClass('active');
	       
	    	$(this).addClass('active');
	       
	        var strUserName = $('> small', this).text();
	        
	        $('.display-name', '#chat-box').html(strUserName);
	        
	        var userStatus = $(this).find('span.user-status').attr('class');
	        
	        $('#chat-box > .chat-box-header > span.user-status').removeClass().addClass(userStatus);
	        
	        var chatBoxStatus = $('span.user-status', '#chat-box');
	       
	        var chatBoxStatusShow = $('#chat-box > .chat-box-header > small');
	      
	        if(chatBoxStatus.hasClass('is-online')){
	        	
	            chatBoxStatusShow.html('Online');
	            
	        } else if(chatBoxStatus.hasClass('is-offline')){
	        	
	            chatBoxStatusShow.html('Offline');
	            
	        } else if(chatBoxStatus.hasClass('is-busy')){
	        	
	            chatBoxStatusShow.html('Busy');
	            
	        } else if(chatBoxStatus.hasClass('is-idle')){
	        	
	            chatBoxStatusShow.html('Idle');
	            
	        }
	
	
	        var offset = $(this).offset();
	        
	        var h_main = $('#chat-form').height();
	        
	        var h_title = $("#chat-box > .chat-box-header").height();
	        
	        var top = ($('#chat-box').is(':visible') ? (offset.top - h_title - 40) : (offset.top + h_title - 20));
	
	        if((top + $('#chat-box').height()) > h_main){
	            top = h_main - 	$('#chat-box').height();
	        }
	
	        $('#chat-box').css({'top': top});
	
	        if(!$('#chat-box').is(':visible')){
	            $('#chat-box').toggle('slide',{
	                direction: 'right'
	            }, 500);
	        }
	        // FOCUS INPUT TExT WHEN CLICK
	        $('ul.chat-box-body').scrollTop(500);
	        
	        
	        var recvId = this.getAttribute("data-recvId");
	        var roomNo = this.getAttribute("data-roomNo");
	        
	        console.log(recvId,roomNo);
	        
	        $("ul.chat-box-body").attr("id",recvId);
	        
	        $("#chat-box .chat-textarea input").attr({
	        	"data-roomNo": roomNo,
	        	"data-recvId": recvId
	        });
	        
	        // 메시지 가져오기 첫단계
			socket.emit("giveMsg",{roomNo: roomNo , user:recvId});
	        
			
			var height = 0;
			$("#"+recvId).find('li').each(function(i, value){
	            height += parseInt($(this).height());
	        });
	        height += '';
	        //alert(height);
	        $("#"+recvId).scrollTop(height);  // add more 400px for #chat-box position   
			
			
	        $("#chat-box .chat-textarea input").focus();
	    });
		
		
	});
	
  //   Add content to form
  $('.chat-textarea input').on("keypress", function(e){

      var $obj = $(this);
      
      var recvId = this.getAttribute("data-recvId");
      var roomNo = this.getAttribute("data-roomNo");
      console.log(recvId,roomNo);
      
      var $me = $obj.parent().parent().find('ul.chat-box-body');
      var $my_avt = '/b90ft4/web/image/accountBook/팬더.jpg';

      if (e.which == 13) {
        
      	var $content = $obj.val(); // 내용 가져오기.

          if ($content !== "") { // 내용이 비어있지 않다면..
          
          	var d = new Date();
              var h = d.getHours();
              var m = d.getMinutes();
              if (m < 10) m = "0" + m;
             
              $obj.val(""); // CLEAR TEXT ON TEXTAREA

              var $element = ""; 
              $element += "<li>";
              $element += "<p>";
              $element += "<img class='avt' src='"+$my_avt+"'>";
              $element += "<span class='user'>"+myId+"</span>";
              $element += "<span class='time'>" + h + ":" + m + "</span>";
              $element += "</p>";
              $element = $element + "<p>" + $content +  "</p>";
              $element += "</li>";
              
              // 메시지 전달.
              socket.emit("msg",{roomNo:roomNo ,recvId:recvId,msg:$content} );
              // 내용물 삽입.
              $me.append($element); 
              var height = 0;
             
              $me.find('li').each(function(i, value){
                  height += parseInt($(this).height());
              });

              height += '';
              //alert(height);
              $me.scrollTop(height);  // add more 400px for #chat-box position      

              // RANDOM RESPOND CHAT

//              var $res = "";
//              $res += "<li class='odd'>";
//              $res += "<p>";
//              $res += "<img class='avt' src='"+$your_avt+"'>";
//              $res += "<span class='user'>Swlabs</span>";
//              $res += "<span class='time'>" + h + ":" + m + "</span>";
//              $res += "</p>";
//              $res = $res + "<p>" + "Yep! It's so funny :)" + "</p>";
//              $res += "</li>";
//            
//              setTimeout(function(){
//                  $me.append($res);
//                  $me.scrollTop(height+100); // add more 500px for #chat-box position             
//              }, 1000);
              
          }
      }

  });
	

	var friend= "";
	
	// 자기 관리 순위로 친구 추가.
	function addFriend(id) {
		console.log(id);
		friend = id;
		socket.emit("retrieveUser",id);	
	}
	
	
	// 내가 접속해 있을 때, 누군가 나를 친구 추가시 혹은 삭제시, 친구가 접속시,퇴장 시  방 목록이 리프레쉬 된다.
	socket.on("refreshFriend",function() {
		socket.emit("giveRoom",myId); 
	});

	
	
	// 친구 추가
// 	$("#addFriend").click(function() {
//		socket.emit("retrieveUser",$("#friend").val());		
//	});
	
	// 유저 체크.
	socket.on("userCheckResult",function(data) {
		if(data.status == 'true'){
			socket.emit("chatWith",friend); // 친구와 방 생성 작업. (실질적인 친구 추가 작업)
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
	
	
	
