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
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
.content {
	padding-top: 120px; /* 헤더의 높이만큼 padding-top 값을 설정합니다. */
	box-sizing: border-box;
}
.team-main__container {
    max-width: 1024px;
    margin: auto;
}
.team-main-list__wrapper {
    padding: 0px 20px;
}
</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	$(function () {
		

		
	});
	</script>
</head>
<body>
	<div class="content">
		<div class="team-main__container">
			<div id="list">
				<div class="team-main-list__wrapper">
					<ul>
						<c:forEach var="teamDto" items="${TeamList}">
							<li class="team-main-list__item">
								<a href="/team/detail/${teamDto.teamNo}" class="team-main-list__link">
									<div class="team-main-list__emblem">
										<img alt="팀 로고사진" src="${pageContext.request.contextPath}/img/download/${teamDto.imgNo}" width="150" height="150">
									</div>
									<div class="team-main-list__content">
										<div class="team-main-list__title">
											<span class="team-main-list__name">${teamDto.teamName}</span>
											<span class="badge team-main-list__member-count">
												<img src="" style="margin-right: 4px;">
												7명
											</span>
										</div>
										<span class="team-main-list__info">${teamDto.teamCity} ${teamDto.teamLocation}</span>
										<span class="team-main-list__info">${teamDto.teamGender} · ${teamDto.teamAge} · ${teamDto.teamDay}</span>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>