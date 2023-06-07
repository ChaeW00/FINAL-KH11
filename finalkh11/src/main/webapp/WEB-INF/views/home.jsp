<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="content" style="margin-top:133px;">

	<h1>환영합니다!</h1>
	<h1>환영합니다!</h1>
	<%
	// 세션에서 값 불러오기
	String value = (String) session.getAttribute("memberId");
	%>
</div>

<h3>홈</h3>

<h3>세션에 저장된 값: <%= value %></h3>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>