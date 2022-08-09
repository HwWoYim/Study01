<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.vo.BoardVO" scope="request" /> <!-- 요청에서 응답까지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
<script type="text/javascript">
	function del(){ // 삭제 수행
		ans=confirm('정말 삭제할까요?'); // 확인창을 띄워  true/false값 저장
		if(ans==true){	// 만약 저장한 값이 true라면?
			document.bForm.action.value="delete";	// 문서전체의 bForm의 action의 value는 "delete"로 변경한다.
			document.bForm.submit();	// 문서 전체의 bForm의 submit을 수행하라.
		}
		else{ // 아니라면???
			return;	// return하라.
		}
	}
</script>

<form name="bForm" action="controller.jsp" method="post">
	<input type="hidden" name="action" value="update"> <!-- update는 서버로 넘길 값이다. -->
	<input type="hidden" name="bid" value="<%=data.getBid()%>"> <!-- data.getBid()는 서버로 넘길 값이다. -->
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%=data.getTitle()%>" required></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" value="<%=data.getContent()%>" required></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" value="<%=data.getWriter()%>" required readonly></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="변경하기">&nbsp;<input type="button" value="삭제하기" onClick="del()">
			</td>
		</tr>
	</table>
</form>
<hr>
<a href="controller.jsp?action=main">메인으로 돌아가기</a>

</body>
</html>