<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>웹소켓 테스트</h1>

<c:choose>
	<c:when test="${memberId == null}">
		<!-- 로그인 화면 : 로그아웃 상태일 때 -->
		<form action="login" method="post">
			<input type="text" name="memberId" required placeholder="아이디">
			<input type="password" name="memberPw" required placeholder="비밀번호">
			<button type="submit">로그인</button>
		</form>
	</c:when>
	<c:otherwise>
		<!-- 사용자 정보 : 로그인 상태일 때 -->
		<h2>
		아이디 : ${sessionScope.memberId} / 
		팀이름 : ${param.teamName}
		<br>
		<a href="logout">로그아웃</a>
		</h2>
	</c:otherwise>
</c:choose>

<hr>
<h2>매칭 생성</h2>
<form action="match" method="post">
	<h3>Home</h3>
	<input type="text" name="memberIdHome1" required placeholder="아이디">
	<input type="text" name="memberIdHome2" required placeholder="아이디">
	<input type="text" name="memberIdHome3" required placeholder="아이디">
	<h3>Away</h3>
	<input type="text" name="memberIdAway1" required placeholder="아이디">
	<input type="text" name="memberIdAway2" required placeholder="아이디">
	<input type="text" name="memberIdAway3" required placeholder="아이디">
</form>

<hr>

<h1>채팅방 목록</h1>

<c:forEach var="chatRoom" items="${chatRoomList}">
	<h3>
		<a href="channel?room=${chatRoom.roomName}">
		${chatRoom.roomName}
		</a>
	</h3>
</c:forEach>