<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 



	<div class="container-400">
        <div class="row center">
            <h1 style="color: darkblue;">비밀번호확인</h1>
            <h2 style="font-size: small;">탈퇴하시려면 비밀번호를 입력해주세요</h2>
        </div>
        <form action="exit" method="post" autocomplete="off">
        <div class="row">
            <table class="table table-border">
                <thead>
                    <tr>
                        <th><input type="password" size="20" height="20" name="memberPw" placeholder="현재 비밀번호" required></th>
                        <td><button type="submit" class="form-btn positive">탈퇴</button></td>
                        
                        <c:if test="${param.mode == 'error'}">
                            <h2 style="color: red;">비밀번호가 일치하지 않습니다</h2>
                        </c:if>
                    </tr>
                </thead>
            </table>
        </div>
        </form>


    </div>

