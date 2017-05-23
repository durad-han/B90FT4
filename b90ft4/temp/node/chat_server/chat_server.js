/**
 * http://usejsdoc.org/
 */

var http = require("http");
var fs = require("fs");
var io = require("socket.io");
var mysql = require("mysql");
var CORS = require("cors");
var express = require("express");
var bodyParser = require("body-parser");

var app = express();

var con = mysql.createConnection({
	host: "14.32.66.123", // 데이터 베이스 주소. 만약 다른 컴퓨터에 접근하고 싶으면, 그 컴퓨터의 아이피.
	port: 3306,  // 오라클은 1521, mySql 은 3306이 default 포트이다. 
	user: "team4", // 사용자를 별도로 만들지 않았다면, root로 admin 권한되어 있을 것이다.
	password: "team4",
	database: "team4" // mySQl에서 만든 DB
});


app.use(express.static('chat'));
app.use(CORS());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));


app.get('/', function (request, response) {
	fs.readFile("chat/admin.html", function(err, data) {
		response.writeHead(200, {"Content-Type": "text/html; charset=UTF-8"});
		response.end(data);
	});
});


var server = http.createServer(app).listen(10006, function() {
	
	console.log("서버 구동 시작 ...");
	
});

var socketIo = io.listen(server);
var userId = [];

//setInterval(function() {
//	console.log("----남아 있는 사용자 체크------")
//		for(var key in userId) {
//			console.log(userId[key].userId);
//		}
//	console.log("---------------------------")
//},10000);


// 내친구 검색 쿼리 
var searchFriendSql = "select room_no, user " +
					  " from (select room_no, CASE ? " +
				      " WHEN user1 THEN user2 " +
					  " WHEN user2 THEN user1 " +
					  " END user " +
					  " from tb_sam_chat_room ) e " +
					  " where user is not null " ;


// 친구들에게 접속,퇴장 알림.
function notifyFriend(id) {
	con.query(searchFriendSql,[id],function(err, rows, fields) {
		rows.forEach(function(row,i) {
			
			if(userId[row.user]){
				socketIo.to(userId[row.user].id).emit("refreshFriend");
			}
			
		});
	});
}

// 채팅 서버 접속.
socketIo.sockets.on("connection", function(socket) {

	// 채팅서버 퇴장.
	socket.on("disconnect",function() {
		// 친구에게 내가 퇴장했다는 걸 알린다.
		
		var that = this;
		setTimeout(function() {
			if(!userId[that.userId]){
				notifyFriend(that.userId);
				console.log(that.userId +" 님 퇴장");
			}
		},3000);
		
		var user = that.userId;
		delete userId[user];
		
	});
	
	// 채팅서버 입장.
	socket.on("passId",function(id) {
		
		console.log(id,"님 접속");
		this.userId=id;
		// ID 등록
		userId[id] = socket;

		// 친구에게 내가 접속했다는 걸 알린다.
		notifyFriend(id);
		
		
	});
	
	
	// 방,메시지 삭제
	socket.on("deleteRoom",function(data) {
	
		var sql = "delete " +
				  "  from tb_sam_chat_msg " +
				  "where room_no = ? "; 
		
		con.query(sql,[data.roomNo],function(err,rows,fields){
			
			var sql = "delete " +
			  "  from tb_sam_chat_room " +
			  "where room_no = ? "; 
			
			con.query(sql,[data.roomNo],function(err,rows,fields) {
				
				console.log("대화방 삭제 완료");
				
				if(userId[data.recvId]){
					console.log("접속해 있을 경우, 상대방 대화방 삭제도 시켜주기.")
					socketIo.to(userId[data.recvId].id).emit("refreshFriend");
				}
			});
		});
	})

	
	// 방 주기, 나의 방 가져오기의 선행 작업.
	socket.on("giveRoom",function(id) {
		con.query(searchFriendSql,[id],function(err, rows, fields) {
			
//			console.log("방 가져오기");
//			console.log(rows);
			
			// 유저 로그인 상태 체크.
			rows.forEach(function(row,i){
				if(userId[row.user]) {
					row.login='y';
				}else {
					row.login='n';
				}
			});
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
			
			// 방이 없다면 방을 생성.
			if(!rows.length){
				
				console.log("방 생성");
				
				var sql = "insert into tb_sam_chat_room (user1,user2)" +
						  "  values (?,?)";
				
				con.query(sql,[chatStarter,id],function(err,rows,fields) {
					// 에러가 존재할 경우
					if (err) {
						console.log("쿼리 실행시 오류 발생"); console.log(err); con.end(); // DB 종료.
						return;
					}
					
					// 상대방 접속해 있을 경우, 방 리프레쉬 작업
					if(userId[id]){
//						console.log("접속해 있을 경우, 상대방 대화방 삭제도 시켜주기.")
						socketIo.to(userId[id].id).emit("refreshFriend");
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
			
			that.emit("bringMsg",{rows:rows, user:data.user});
			
		});
	});
	
	
	// 친구 추가를 위한 유저 검색
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