<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="content">

<h1>환영합니다!</h1>
<h1>환영합니다!</h1>
<%
// 세션에서 값 불러오기
String value = (String) session.getAttribute("memberId");
%>
<p>세션에 저장된 값: <%= value %></p>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<h2>홈</h2>

