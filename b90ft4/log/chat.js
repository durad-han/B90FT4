/**
 * http://usejsdoc.org/
 */

var http = require("http");
var fs = require("fs");
var io = require("socket.io");
var mysql = require("mysql");

var con = mysql.createConnection({
	host: "14.32.66.123", // 데이터 베이스 주소. 만약 다른 컴퓨터에 접근하고 싶으면, 그 컴퓨터의 아이피.
	port: 3306,  // 오라클은 1521, mySql 은 3306이 default 포트이다. 
	user: "team4", // 사용자를 별도로 만들지 않았다면, root로 admin 권한되어 있을 것이다.
	password: "team4",
	database: "team4" // mySQl에서 만든 DB
});


var server = http.createServer(function(request, response) {
	fs.readFile("chat.html",function(err,data) {
		response.writeHead(200, {"Content-Type": "text/html; charset=UTF-8"});
		response.end(data);
	});
}).listen(10001, function() {
	console.log("서버 구동 시작 ...");
});

var socketIo = io.listen(server);
var userId = [];

socketIo.sockets.on("connection", function(socket) {

	// ID 등록
	socket.on("passId",function(id) {
		console.log(id,"님 접속");
		this.userId=id;
		userId[id] = socket;
	});
	
	
	// 방 주기, 방 가져오기의 선행 작업.
	socket.on("giveRoom",function(id) {
		
		var sql = "select * " +
				  "  from tb_sam_chat_room " +
				  "where user1 = ? " +
				  "   or user2 = ? ";
		
		con.query(sql,[id,id],function(err, rows, fields) {
			
			rows.forEach(function(row,i) {
				if(row.user1==id){
					row.user = row.user2;
				}else{
					row.user = row.user1;
				}
				
				delete row.user1;
				delete row.user2;
				
			});
			
			console.log("방 가져오기");
			console.log(rows);
			
			socket.emit("bringRoom",rows);
		});
	});
	
	
	
	
	// ~ 와 채팅 시작. ( 친구 추가 할 때 필요 할 듯..)
	socket.on("chatWith",function(id){

		var that = this;
		console.log("id :",id,this.userId);
		
		var sql = " select * " +
		  		  "   from tb_sam_chat_room " +
		  		  " where ( user1 = ? and user2 = ? ) " +
		  		  "    or ( user1 = ? and user2 = ? ) ";

		
		var chatStarter = this.userId;
		
		// 방 존재 여부 체크.
		con.query(sql,[id,chatStarter,chatStarter,id],function(err, rows, fields) {
			
			// 에러가 존재할 경우
			if (err) {
				console.log("쿼리 실행시 오류 발생"); console.log(err); con.end(); // DB 종료.
				return;
			}
			
			var  flag = rows.length;
			
			console.log(flag);
			
			
			// 방이 없다면 방을 생성.
			if(!flag){
				
				console.log("방 생성");
				
				var sql = "insert into tb_sam_chat_room (user1,user2)" +
						  "  values (?,?)";
				
				con.query(sql,[chatStarter,id],function(err,rows,fields) {
					// 에러가 존재할 경우
					if (err) {
						console.log("쿼리 실행시 오류 발생"); console.log(err); con.end(); // DB 종료.
						return;
					}
				});
			}
		});
	});
	
	// 메시지 전달하기.
	socket.on("msg",function(data) {
		
		var sql = "insert into tb_sam_chat_msg(room_no,user,msg)" +
				  " values (?,?,?)";
		
		data.sender = this.userId;
		
		con.query(sql,[data.roomNo,data.sender,data.msg],function(err, result) {
			
			if (err) {
				console.log("등록 중 오류 발생");
				console.log(err);
				return;
			}
			
			console.log("메시지 등록 성공.");
//			con.end();
			
			if(userId[data.recvId]){
				socketIo.to(userId[data.recvId].id).emit("msg",data);	
			}else{
				console.log("상대방 접속 안했다.");
				
			}
		});
		
	});
	
	// 기존의 대화 뿌려주기.
	socket.on("giveMsg",function(data) {
		
		var that = this;
		
		var sql = "select * " +
				  "  from tb_sam_chat_msg " +
				  "where room_no = ? " +
				  "order by reg_date "; 
		
		con.query(sql,[data.roomNo],function(err,rows,fields) {
			
			if(err){
				console.log("대화 가져오기 에러.");
				console.log(err);
				return;
			}
			
			console.log(rows);
			that.emit("bringMsg",{rows:rows, user:data.user});
			
		});
	});
	
	
	// 유저 검색
	socket.on("retrieveUser",function(id) {
		
		console.log("유저검색", id);

		var that = this;
		
		var sql = "select * " +
		  "from tb_sam_user " +
		  "where user_id = ? "; 
		
		// 회원 가입한 아이디인지 검색.
		con.query(sql,[id],function(err, rows, fields) {

			var flag;
			var msg;
			
			console.log(rows);
			
			if(!rows.length){
				flag = "false"; // 비회원
				msg = "아이디가 없습니다."
				that.emit("userCheckResult",{status:flag,msg:msg});
				return;
			}
			
			var sql = " select * " +
	  		  "   from tb_sam_chat_room " +
	  		  " where ( user1 = ? and user2 = ? ) " +
	  		  "    or ( user1 = ? and user2 = ? ) ";
			
			// 친구와 이미 방이 생성되었는지 검색.
			con.query(sql,[id,that.userId,that.userId,id],function(err,rows,fields) {
				
				if(!rows.length){
					flag = "true"; 
					msg = "친추 추가 완료.";
				}else{
					flag = "false";
					msg = "이미 추가된 친구.";
				}
				
				that.emit("userCheckResult",{status:flag,msg:msg});
				
			});
			
		});
	});
	
});









// 서로간의 유저명을 통해 방 번호 검색
//var sql = " select room_no roomNo" +
//		  "  from tb_sam_chat_room " +
//		  " where (user1 = ? and user2= ?)" +
//  		  "    or (user1 = ? and user2= ?)";
//
//con.query(sql,[id,chatStarter,chatStarter,id],function(err, rows, fields) {
//	
//	if (err) {
//		console.log("쿼리 실행시 오류 발생"); console.log(err); con.end(); // DB 종료.
//		return;
//	}
	
//	var roomNo = rows[0].roomNo;
//	socketIo.to(userId[id].id).emit("chatWith",{roomNo:roomNo, user:chatStarter});
//	socketIo.to(userId[chatStarter].id).emit("getRoomNo",roomNo); // 방 번호 주기.
//	con.end();
	
//});






//console.log("선택 연결 종료");
//console.log("상대방 사용자",recvId); // 상대방 사용자
//
//delete currentUser[this.id]; // 자기 삭제
//
//// 상대방 사용자를 다른 유저와 매칭 시키기 위해 방에 바로 등록.
//if(currentUser[recvId]){
//	// 연결 중단 후 , 상대방 유저 재매칭 시키기.
//	matchUser(roomArr,currentUser[recvId]);
//	// 상대방이 나갔다는걸 알려준다.
//	currentUser[recvId].emit("bye","상대방 접속 종료.");
//}
//
//// 남은 유저 확인
//checkUser();