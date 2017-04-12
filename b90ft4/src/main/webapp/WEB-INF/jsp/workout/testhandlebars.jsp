<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title</title>
</head>
<body>
xx1
<div id = "xx1">
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/web/js/common/handlebars.min.js"></script>
<script src="${pageContext.request.contextPath}/web/js/common/handlebarsHelper.js"></script>
xx2
<div id = "xx2">
</div>
<script id="entry-template" type="text/x-handlebars-template">
<table>
    <thead> 
        <th>이름</th> 
        <th>아이디</th> 
        <th>메일주소</th> 
    </thead> 
    <tbody> 
        {{#users}} 
        <tr> 

{{#eq name '홍길동5'}}
       	     
<td>{{name}}</td>
{{/eq}}
            <td>{{id}}</td> 
            <td><a href="mailto:{{email}}">{{email}}</a></td> 
        </tr> 
        {{/users}} 
    </tbody> 
</table>
</script>
xx3	
<div id = "xx3">
</div>
<script src = "${pageContext.request.contextPath}/web/js/workout/testhandlebars.js">
</script>
</div>

</body>
</html>