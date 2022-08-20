<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

   <div id = "header">
      <h1>작은 티모</h1>
      
      <div class = "gnb">
         <ul>
            <li><a>메인으로</a></li>
            <li><a>회원가입</a></li>
            <li><a>로그인</a></li>
         </ul>
      </div>
   </div>

   <div id = "wrapper">
      <div id = "content">
         <h2>글 등록하기</h2>
         <form action="ctrlB.jsp?action=insertB" method = "post">
            <input type = "hidden" name = "mid" value = "${mid}">
            <input type = "text" name = "msg">
            <input type = "submit" value = "글 등록">
            <!-- 만약에, 로그인을 하지 않았다면 로그인 한 후에 이용할 수있게끔 -->
         </form>
      </div>
      <div id = "main">
         <h2>글 목록보기</h2>
         <c:forEach var = "v" items = "${datas}">
         
            <c:set var = "b" value = "${v.boardVO}" />
            
            <h3>[${b.mid}] ${b.msg} [ 좋아요 ${b.favcnt} | 댓글 ${b.rcnt} ]</h3>
            <div class = "reply">
               <ul>
               <c:forEach var = "r" items = "$(v.rList)">
                  <li>[${r.mid}] ${r.rmsg}</li>
               </c:forEach>
               </ul>
            </div>
            <div class = "reply">
               <form action="ctrlB.jsp?action=insertR" method = "post">
                  <input type = "hidden" name = "mid" value = "${mid}">
                  <input type = "hidden" name = "bid" value = "${b.bid}">
                  <input type = "text" name = "rmsg">
                  <input type = "submit" value = "댓글 등록">
               </form>
            </div>
         </c:forEach>            
      </div>
      
      <a>더보기&gt;&gt;</a>
   </div>

   <div id = "footer">
      회사소개 | 이용약관 | <strong>개인정보처리방침</strong> | 정책 | 고객센터 <strong>ⓒ Corp.</strong>      
   </div>
</body>
</html>
<!-- 메인페이지에서 필요한 데이터 
1. mid : 로그인한 사람의 아이디 정보
+ mid msg action  -->