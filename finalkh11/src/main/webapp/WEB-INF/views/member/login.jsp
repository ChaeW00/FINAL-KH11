<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<h1>로그인</h1>

<form action="login" method="post">
	아이디 : <input type="text" name="memberId" required> <br><br>
	비밀번호 : <input type="password" name="memberPw" required> <br><br>
	<button type="submit">로그인</button>
</form>
