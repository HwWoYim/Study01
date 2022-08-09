<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="model.vo.MemberVO" scope="session" /> <!-- MemberVO member = new MemberVO 범위는 브라우저 종료 전 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성페이지</title>
</head>
<body>

<form action="controller.jsp" method="post">
	<input type="hidden" name="action" value="insert"> <!-- name="이름" value="서버로 넘길 값" -->
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" required></td> <!-- required=필수값을 넣어줘야 한다. -->
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" required></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" value="<%=member.getMid()%>" readonly required></td> <!-- member의 pk 값, 읽기전용, 필수 값 -->
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="글 작성하기">
			</td>
		</tr>
	</table>
</form>
<hr>
<a href="controller.jsp?action=main">메인으로 돌아가기</a>

</body>
</html>