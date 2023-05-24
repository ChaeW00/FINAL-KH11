<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 팀</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5"  >
        <h2 class="mb-4">나의 팀 목록</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">팀 번호</th>
                    <th scope="col">팀 이름</th>
                    <th scope="col">팀 지역</th>
                    <th scope="col">팀 리더</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${teams}" var="team" varStatus="status">
                    <tr>
                        <th scope="row">${status.count}</th>
                        <td>${team.teamNo}</td>
                        <td>${team.teamName}</td>
                        <td>${team.teamCity}</td>
                        <td>${team.teamLeader}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
</body>
</html>
<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>