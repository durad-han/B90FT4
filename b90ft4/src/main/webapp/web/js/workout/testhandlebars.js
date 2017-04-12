
function f(){
	//핸들바 템플릿 가져오기
	var source = $("#entry-template").html(); 

	//핸들바 템플릿 컴파일
	var template = Handlebars.compile(source); 

	//핸들바 템플릿에 바인딩할 데이터
	var data = {
	    	users: [
	            { name: "홍길동1", id: "aaa1", email: "aaa1@gmail.com" },
	            { name: null , id: "aaa2", email: "aaa2@gmail.com" },
	            { name: "홍길동3", id: "aaa3", email: "aaa3@gmail.com" },
	            { name: "홍길동4", id: "aaa4", email: "aaa4@gmail.com" },
	            { name: "홍길동5", id: "aaa5", email: "aaa5@gmail.com" }
	        ]
	}; 

	//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
	var html = template(data);
	console.dir(data);
	console.log(data);
	
	$('#xx1').append(data);
	//생성된 HTML을 DOM에 주입
	$('#xx2').append(html);
	$('#xx3').append(html);
	$('#xx4').append(html);

}

f();