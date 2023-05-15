<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>웹소켓 테스트</h1>

<c:forEach var="match" items="${matchList}">
	<h1><a href="match?matchNo=${match.matchNo}">${match.matchTitle}</a></h1>
</c:forEach>

<a href="create">매치 생성</a>
${param.test}