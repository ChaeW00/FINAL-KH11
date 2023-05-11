<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>홈</h2>
<%
// 세션에서 값 불러오기
String value = (String) session.getAttribute("memberId");
%>
<p>세션에 저장된 값: <%= value %></p>