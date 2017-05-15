$(function () {

    // BEGIN FORM CHAT
    $('.btn-chat').click(function () {
        if($('#chat-box').is(':visible')){
            $('#chat-form').toggle('slide', {
                direction: 'right'
            }, 500);
            $('#chat-box').hide();
        } else{
            $('#chat-form').toggle('slide', {
                direction: 'right'
            }, 500);
        }
    });
    
    $('.chat-box-close').click(function(){
        $('#chat-box').hide();
        $('#chat-form .chat-group a').removeClass('active');
    });
    
    $('.chat-form-close').click(function(){
        $('#chat-form').toggle('slide', {
            direction: 'right'
        }, 500);
        $('#chat-box').hide();
    });

//    // 방만들기 이벤트 걸기.
//    console.log("방 만들기 이벤트 걸기");
//    $('#chat-form .chat-group a').unbind('*').click(function(){
//       
//    	$('#chat-box').hide();
//        
//    	$('#chat-form .chat-group a').removeClass('active');
//       
//    	$(this).addClass('active');
//       
//        var strUserName = $('> small', this).text();
//        
//        $('.display-name', '#chat-box').html(strUserName);
//        
//        var userStatus = $(this).find('span.user-status').attr('class');
//        
//        $('#chat-box > .chat-box-header > span.user-status').removeClass().addClass(userStatus);
//        
//        var chatBoxStatus = $('span.user-status', '#chat-box');
//       
//        var chatBoxStatusShow = $('#chat-box > .chat-box-header > small');
//      
//        if(chatBoxStatus.hasClass('is-online')){
//        	
//            chatBoxStatusShow.html('Online');
//            
//        } else if(chatBoxStatus.hasClass('is-offline')){
//        	
//            chatBoxStatusShow.html('Offline');
//            
//        } else if(chatBoxStatus.hasClass('is-busy')){
//        	
//            chatBoxStatusShow.html('Busy');
//            
//        } else if(chatBoxStatus.hasClass('is-idle')){
//        	
//            chatBoxStatusShow.html('Idle');
//            
//        }
//
//
//        var offset = $(this).offset();
//        
//        var h_main = $('#chat-form').height();
//        
//        var h_title = $("#chat-box > .chat-box-header").height();
//        
//        var top = ($('#chat-box').is(':visible') ? (offset.top - h_title - 40) : (offset.top + h_title - 20));
//
//        if((top + $('#chat-box').height()) > h_main){
//            top = h_main - 	$('#chat-box').height();
//        }
//
//        $('#chat-box').css({'top': top});
//
//        if(!$('#chat-box').is(':visible')){
//            $('#chat-box').toggle('slide',{
//                direction: 'right'
//            }, 500);
//        }
//        // FOCUS INPUT TExT WHEN CLICK
//        $('ul.chat-box-body').scrollTop(500);
//        $("#chat-box .chat-textarea input").focus();
//  
//    });
    
    
//    // Add content to form
//    $('.chat-textarea input').on("keypress", function(e){
//
//        var $obj = $(this);
//        var $me = $obj.parent().parent().find('ul.chat-box-body');
//        var $my_avt = '/b90ft4/web/image/accountBook/팬더.jpg';
//        var $your_avt = '/b90ft4/web/image/accountBook/팬더.jpg';
//       
//        if (e.which == 13) {
//          
//        	var $content = $obj.val(); // 내용 가져오기.
//
//            if ($content !== "") { // 내용이 비어있지 않다면..
//            
//            	var d = new Date();
//                var h = d.getHours();
//                var m = d.getMinutes();
//                if (m < 10) m = "0" + m;
//               
//                $obj.val(""); // CLEAR TEXT ON TEXTAREA
//
//                var $element = ""; 
//                $element += "<li>";
//                $element += "<p>";
//                $element += "<img class='avt' src='"+$my_avt+"'>";
//                $element += "<span class='user'>John Doe</span>";
//                $element += "<span class='time'>" + h + ":" + m + "</span>";
//                $element += "</p>";
//                $element = $element + "<p>" + $content +  "</p>";
//                $element += "</li>";
//                
//                $me.append($element);
//                var height = 0;
//               
//                $me.find('li').each(function(i, value){
//                    height += parseInt($(this).height());
//                });
//
//                height += '';
//                //alert(height);
//                $me.scrollTop(height);  // add more 400px for #chat-box position      
//
//                // RANDOM RESPOND CHAT
//
////                var $res = "";
////                $res += "<li class='odd'>";
////                $res += "<p>";
////                $res += "<img class='avt' src='"+$your_avt+"'>";
////                $res += "<span class='user'>Swlabs</span>";
////                $res += "<span class='time'>" + h + ":" + m + "</span>";
////                $res += "</p>";
////                $res = $res + "<p>" + "Yep! It's so funny :)" + "</p>";
////                $res += "</li>";
////              
////                setTimeout(function(){
////                    $me.append($res);
////                    $me.scrollTop(height+100); // add more 500px for #chat-box position             
////                }, 1000);
//                
//            }
//        }
//
//    });
    // END FORM CHAT

});



