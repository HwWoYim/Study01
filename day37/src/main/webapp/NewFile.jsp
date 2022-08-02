<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward 액션</title>
</head>
<body>

<hr>
	<jsp:forward page="side.jsp"> <!-- 포워드는 제어권을 넘겨주고 돌려받지 않는것. -->
		<jsp:param value="apple" name="msg"/>
		<jsp:param value="1024" name="num"/>
	</jsp:forward>
<hr>
</body>
</html>