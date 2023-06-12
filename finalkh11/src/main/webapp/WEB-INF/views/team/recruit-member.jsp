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
.team-main-list__item {
    position: relative;
}
ol, ul, li {
    list-style: none;
}
.team-main-list__link {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    border-bottom: 1px solid #E6ECF1;
    padding: 16px 0px;
}
.team-main-list__emblem {
    margin-right: 10px;
}
.team-main-list__emblem-image {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    vertical-align: middle;
    -o-object-fit: cover;
    object-fit: cover;
}
.team-main-list__content {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
}
.team-main-list__title {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    margin-bottom: 4px;
}
.team-main-list__name {
    font-weight: 500;
    font-size: 16px;
    line-height: 19px;
}
.team-main-list__member-count {
    margin-left: 4px;
    background-color: #F2F5F7;
    height: 16px;
    font-weight: 500;
    font-size: 12px;
    line-height: 14px;
    text-align: center;
    color: #727F88;
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    padding: 0px 4px;
    margin-right: 0;
}

.badge {
    padding: 3px 5px;
    border-radius: 4px;
    font-size: 11px;
    margin-right: 10px;
    background-color: #D9E0E6;
    display: inline-block;
}

.team-main-list__info {
    font-size: 14px;
    font-weight: 500;
    line-height: 17px;
    color: #727F88;
    margin-bottom: 4px;
}
.team-main-list__extra-info {
    font-weight: 500;
    font-size: 14px;
    line-height: 17px;
    color: #727F88;
    margin-top: 16px;
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
										<img src="${teamDto.getImageURL()}" class="team-main-list__emblem-image">
									</div>
									<div class="team-main-list__content">
										<div class="team-main-list__title">
											<span class="team-main-list__name">${teamDto.teamName}</span>
											<span class="badge team-main-list__member-count">
												<img src="/static/image/man.png" width="10" height="10" style="margin-right: 4px;">
												${teamDto.teamMemberCount}												
											</span>
										</div>
										<span class="team-main-list__info">${teamDto.teamCity} ${teamDto.teamLocation}</span>
										<span class="team-main-list__info">${teamDto.teamGender} · ${teamDto.teamAge} · ${teamDto.teamDay}</span>
										<p class="team-main-list__extra-info">조회 0 · 신청 ${teamDto.waitingCount}</p>
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