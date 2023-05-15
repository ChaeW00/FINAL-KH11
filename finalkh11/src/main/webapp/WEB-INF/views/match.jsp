<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>${matchTitle}</h1>
<hr>

<form action="createChat" method="post">
<input type="hidden" name="matchNo" value="${matchNo}">
<h2>home</h2>
<c:forEach var = "i" begin = "0" end = "2">
	<select name=homeMember${i}>
		<option>선택</option>
		<c:forEach var="member" items="${homeList}">
			<option>${member.memberId}</option>
		</c:forEach>
	</select>
</c:forEach>

<h2>away</h2>
<c:forEach var = "i" begin = "0" end = "2">
	<select name=awayMember${i}>
		<option>선택</option>
		<c:forEach var="member" items="${awayList}">
			<option>${member.memberId}</option>
		</c:forEach>
	</select>
</c:forEach>
<br>
<br>
<button type="submit">명단 및 채팅방 생성</button>
</form>