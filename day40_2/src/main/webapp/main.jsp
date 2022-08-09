<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.vo.BoardVO,java.util.ArrayList" %> <!-- BoardVO와 ArrayList사용을 선언 -->
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" /> <!--  요청부터 응답까지  -->
<jsp:useBean id="member" class="model.vo.MemberVO" scope="session" /> <!-- 브라우저가 종료 될 때 까지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<script type="text/javascript">
	function check(){
		ans=prompt('비밀번호를 입력하세요.'); // ans변수에 prompt값 저장!
		if(ans==<%=member.getMpw()%>){// 만약(ans가 jsp:useBean member의 mpw와 같다면){
			location.href="controller.jsp?action=mypage"; // URL 이동 }
		}
	}
</script>

<h1><a href="javascript:check()"><%=member.getMname()%></a>님, 반갑습니다! :D</h1> <!-- a태그로 이동 시켜줘->이름 가져와줘 -->
<table border="2">
	<tr>
		<th>번 호</th><th>제 목</th><th>작성자</th>
	</tr>
<%
	for(BoardVO v:(ArrayList<BoardVO>)datas){ // BoardVO타입의 배열리스트 datas를 v변수에 모두 담을 때 까지 반복해줘
%>
	<tr>
		<th><a href="controller.jsp?action=board&bid=<%=v.getBid()%>"><%=v.getBid()%></a></th>
		<td><%=v.getTitle()%></td>
		<td><%=v.getWriter()%></td>
	</tr>
<%
	}
%>
</table>
<hr>
<a href="form.jsp">새로운 글 작성하기</a>

</body>
</html>