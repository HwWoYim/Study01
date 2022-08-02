<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 액션</title>
</head>
<body>

<hr>
	<jsp:include page="side.jsp"> <!-- 메인페이지가 사이드페이지에게 요청을 주고 데이터를 받아오는 것. -->
		<jsp:param value="apple" name="msg"/>
		<jsp:param value="1024" name="num"/>
	</jsp:include>
<hr>

</body>
</html>