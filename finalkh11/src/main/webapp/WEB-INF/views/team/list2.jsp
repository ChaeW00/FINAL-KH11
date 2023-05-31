<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="w-80">
	<div class="row center">
		<h1>팀 ${teamDto.teamName}</h1>
		<hr>
	</div>

	<div class="row">
		
		<table class="table table-border">
			<tr>
				<th>팀이름</th>
				<td>${teamDto.teamName}</td>
			</tr>
			<tr>
				<th>활동요일</th>
				<td>${teamDto.teamDay}</td>
			</tr>
			<tr>
				<th>활동시간</th>
				<td>${teamDto.teamTime}</td>
			</tr>
			<tr>
				<th>활동도시</th>
				<td>${teamDto.teamCity}</td>
			</tr>
			<tr>
				<th>활동지역</th>
				<td>${teamDto.teamLocation}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${teamDto.teamGender}</td>
			</tr>
			<tr>
				<th>나이대</th>
				<td>
					${teamDto.memberRole}
				</td>
			</tr>
			<tr>
				<th>전적</th>
				<td>
					${teamDto.memberRole}
				</td>
			</tr>
			<tr>
				<th>가입일시</th>
				<td>
					<fmt:formatDate value="${teamDto.teamDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
		</table>
	</div>
</div>

</div>
<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>








