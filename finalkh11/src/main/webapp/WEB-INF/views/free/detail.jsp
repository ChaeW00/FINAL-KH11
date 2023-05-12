<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/static/css/commons.css">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<header>
<style>
body {
	padding-top: 120px;
}
</style>
</header>
<body>
	<div class="container-800">
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

			<tr>
				<td>${freeDto.freeNo}</td>
				<td>${freeDto.freeWriter}</td>
				<td>${freeDto.freeTitle}</td>
				<td>${freeDto.freeContent}</td>
				<td>${freeDto.freeDate}</td>
				<td>${freeDto.freeAge}</td>
				<td>${freeDto.freeGround}</td>
				<td>${freeDto.freeGender}</td>
				<td>${freeDto.freeSize}</td>
				<td>${freeDto.freeFee}</td>
				<td>${freeDto.freeSkill}</td>

			</tr>

		</tbody>
		</table>
	</div>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>