<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Title</title>
<link rel="stylesheet" type="text/css" href="/static/css/commons.css">

<style>
.content {
	padding-top: 110px; /* 헤더의 높이만큼 padding-top 값을 설정합니다. */
}
</style>
</head>
<body>
	<div class="content">
		<h3>
			<a href="write">글쓰기</a>
		</h3>

		<table border="1" width="800">
			<thead>
				<tr>
					<th>번호</th>
					<th align="left">작성자</th>
					<th width="40%">제목</th>
					<th>내용</th>
					<th>날짜</th>
					<th>나이</th>
					<th>구장</th>
					<th>성별</th>
					<th>인원수</th>
					<th>요금</th>
					<th>실력</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="FreeDto" items="${FreeList}">
					<tr>
						<td>${FreeDto.freeNo}</td>
						<td>${FreeDto.freeWriter}</td>
						<td>${FreeDto.freeTitle}</td>
						<td>${FreeDto.freeContent}</td>
						<td>${FreeDto.freeDate}</td>
						<td>${FreeDto.freeAge}</td>
						<td>${FreeDto.freeGround}</td>
						<td>${FreeDto.freeGender}</td>
						<td>${FreeDto.freeSize}</td>
						<td>${FreeDto.freeFee}</td>
						<td>${FreeDto.freeSkill}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>