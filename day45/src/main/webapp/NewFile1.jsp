<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- datas 데이터를 꺼내오려면 test클래스가 객체화가 되어야 하며 el식하기위해 스코프를 설정해야한다. -->
<jsp:useBean id="test" class="test.Test" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL식 - 1</title>
</head>
<body>

<form action="NewFile2.jsp" method="post">
	<select name="sel">
		<%
		for(String v:test.getDatas()){
		%>
		<option><%=v%></option>
		<%	
		}
		 %>
		 
	</select>
	<input type="submit" value="선택">
</form>

</body>
</html>