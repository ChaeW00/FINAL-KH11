<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Title</title>
<!-- <link rel="stylesheet" type="text/css" href="/static/css/commons.css"> -->
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
a {
/*   color: black !important; */
  text-decoration: none !important;
}

.filter--wrapper {
	position: relative;
}

.main--match--filter {
	display: flex;
	justify-content: space-between;
	padding: 8px 0px;
	max-width: 1024px;
	margin: 0 auto;
}

.filter--wrapper ul {
	box-sizing: content-box;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
	overflow-scrolling: touch;
	padding: 0;
	max-width: 1024px;
	display: flex;
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.filter--wrapper ul li:first-child {
	margin-left: 20px;
}

.filter--wrapper ul li {
	font-size: 14px;
	margin-left: 5px;
	padding: 0px 12px;
	line-height: 32px;
	height: 32px;
	position: relative;
	cursor: pointer;
	border: 1px solid #D9E0E6;
	border-radius: 20px;
	-webkit-transition: all 0.30s ease-in-out;
	-moz-transition: all 0.30s ease-in-out;
	-ms-transition: all 0.30s ease-in-out;
	-o-transition: all 0.30s ease-in-out;
	outline: none;
	box-sizing: content-box;
}

.filter--wrapper span {
	border: none;
	color: #727F88;
}

.filter--arrow {
	width: 8.5px;
	margin-left: 3px;
	vertical-align: middle;
}

.modal--mask {
	position: fixed;
	z-index: 9998;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .5);
	display: table;
	transition: opacity .3s ease;
}

@media ( min-width : 1024px) {
	.modal--wrapper.isBottom {
		height: fit-content;
		width: 360px;
		right: 0;
		top: 50%;
		bottom: 50%;
		margin: auto;
		border-radius: 20px;
		transform: initial;
		animation: none;
	}
}

.modal--wrapper.isBottom .modal--header {
	box-shadow: none;
	padding: 16px 20px;
}

.modal--header {
	padding: 16px 20px;
	text-align: left;
	display: flex;
	justify-content: space-between;
}

.modal--wrapper.isBottom .modal--title {
	width: 90%;
	text-align: left;
	font-weight: 700;
	font-size: 18px;
	color: #282B33;
}

.modal--wrapper .modal--close::after {
	position: absolute;
	right: 20px;
	background: none;
	content: "\f00d"; /* FontAwesome의 아이콘 코드 */
	font-family: "Font Awesome 5 Free"; /* FontAwesome 폰트 패밀리 */
	font-weight: 900; /* FontAwesome 아이콘의 두께 */
	font-size: 16px; /* 아이콘 크기 */
	width: 24px;
	height: 24px;
}

.modal--header .modal--close {
	cursor: pointer;
	font-size: 14px;
}

.modal--body {
	overflow-y: auto;
	padding: 0px 20px 16px 20px;
}

.modal--wrapper.isBottom .modal--bottom {
	position: relative;
	border-radius: 0px;
	padding: 0px 20px 16px 20px;
}

.modal--bottom {
	position: relative;
	width: auto;
}

.modal--bottom .modal--button {
	display: flex;
}

.modal--wrapper.isBottom .modal--bottom .btn {
	border-radius: 10px;
	font-size: 15px;
}
/* .btn.lg { */
/* 	line-height: 54px; */
/* 	font-size: 16px; */
/* 	padding: 0 10px; */
/* } */

/* .btn.blue { */
/* 	background-color: #1570FF; */
/* 	color: #fff; */
/* } */

/* .btn { */
/* 	width: 100%; */
/* 	background-color: #3540A5; */
/* 	color: white; */
/* 	border-radius: 6px; */
/* 	border: none; */
/* 	box-shadow: none; */
/* 	padding: 15px 10px; */
/* 	display: block; */
/* 	text-align: center; */
/* 	cursor: pointer;	 */
/* } */



.modal--wrapper {
	position: fixed;
	left: 0;
	right: 0;
	/* top: 0; */
	background-color: white;
	border-radius: 24px;
	z-index: 9999;
	display: flex;
	flex-direction: column;
	width: 80%;
	height: 80%;
	top: 50%;
	transform: translateY(-50%);
	margin: auto;
}
.filter--list__item {
	box-shadow: inset 0px -1px 0px #d9e0e6;
	min-height: 44px;
	line-height: 44px;
}

.filter--list-checkbox__item:last-child {
	box-shadow: none;
}

.checkbox-item {
	display: flex;
	padding: 10px 0;
	margin-right: 15px;
	width: 100%;
}

.modal--body ul {
	padding-left: 0;
}

.checkbox-item [type="checkbox"] {
	position: absolute;
	opacity: 0;
	width: 24px;
	height: 24px;
	/* display: none; */
	width: inherit;
	margin: 0;
}

input {
	padding: 15px 10px;
	border-radius: 6px;
	border: 1px solid #ddd;
	box-shadow: none;
	outline: none;
	background-color: #F2F5F7;
	-webkit-appearance: none;
	appearance: none;
	font-size: 16px;
	color: #282B33;
}

.checkbox-item [type="checkbox"]+label {
	position: relative;
	display: flex;
	align-items: center;
	cursor: pointer;
	padding: 0;
	font-size: 16px;
	color: #282B33;
	font-weight: 400;
	margin: initial;
}

.checkbox-item .checkbox {
	position: relative;
	opacity: 1 !important;
}

.checkbox-item [type="checkbox"]+label .checkbox:before {
	content: '';
	margin-right: 10px;
	display: inline-block;
	vertical-align: text-top;
	width: 22px;
	height: 22px;
	background: #E6ECF1;
	border-radius: 6px;
	border: 1px solid #D9E0E6;
}

.checkbox-item [type="checkbox"]:checked+label .checkbox:before {
	background: #1570FF;
	border: 1px solid #1570FF;
}

.checkbox-item [type="checkbox"]:checked+label .checkbox:after {
	content: '';
	position: absolute;
	left: 6px;
	top: 11px;
	background: #E6ECF1;
	width: 2px;
	height: 2px;
	box-shadow: 0px 0 0 white, 2px 0 0 white, 4px 0 0 white, 4px -2px 0
		white, 4px -4px 0 white, 4px -6px 0 white, 4px -8px 0 white, 4px -10px
		0 white;
	transform: rotate(45deg);
}

.filter--list-checkbox__item {
	box-shadow: inset 0px -1px 0px #d9e0e6;
	margin: 10px 0px;
}
</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	$(function () {
		var filters = {};
		$('input[type="checkbox"]').change(function(){
			var checkbox = $(this);
			const filterContent = checkbox.val();
			//체크 된 경우 filters 객체에 추가
			if(checkbox.is(':checked')) {
				filters[filterContent] = true;
			} else {
				filters[filterContent] = false;
			}
			console.log(filters);
		})
		
		$('.btn').click(function(){
			console.log(filters);
			filterHandler();
		})
		
		$('.filter--list__item a').click(function(event){
			const fc = 'region';
			filters[fc] = this.textContent;
			filterHandler();
		})
		
		function filterHandler() {
			$.ajax({
				url: `/team/filter`,
				method: 'POST',
				contentType: "application/json",
				data: JSON.stringify(filters),
				dataType: 'json',
				success: function(response) {
					updateList(response);
				},
				error: function() {
					console.log('데이터 요청 실패');
				}
			});
		}
		
		function updateList(data) {
			var $listItems = [];
						
			data.forEach(function(item) {
				console.log(item);
				var imgNo = item.imgNo;
		        var teamName = item.teamName;
		        var teamMemberCount = item.teamMemberCount;
		        var teamCity = item.teamCity;
		        var teamLocation = item.teamLocation;
		        var teamGender = item.teamGender;
		        var teamAge = item.teamAge;
		        var teamDay = item.teamDay;
		        var teamTime = item.teamTime;
		        var waitingCount = item.waitingCount;
		        var ddd = 425;
		        var getUrl = '/img/download/' + imgNo;
		        console.log(getUrl);
		        var $listItem = $('<li>', {
		          class: 'team-main-list__item',
		          style: '',
		        }).append(
		          $('<a>', {
		            class: 'team-main-list__link',
		          }).append(
		            $('<div>', {
		              class: 'team-main-list__emblem',
		            }).append(
		              $('<img>', {
		                src: getUrl,
		                class: 'team-main-list__emblem-image'
		              })
		            ),
		            $('<div>', {
		              class: 'team-main-list__content',
		            }).append(
		              $('<div>', {
		                class: 'team-main-list__title',
		              }).append(
		                $('<span>').text(teamName).addClass('team-main-list__name'),
		                $('<span>', {
		                  class: 'badge team-main-list__member-count',
		                }).append(
		                  $('<img>', {
		                    src: '/static/image/man.png',
		                    style: 'width:10px; height:10px; margin-right: 4px;',
		                  }),
		                  teamMemberCount
		                )
		              ),
		              $('<span>', {
		                class: 'team-main-list__info'
		              }).text(teamCity + ' ' + teamLocation),
		              $('<span>', {
		                class: 'team-main-list__info'
		              }).text(teamGender + ' · ' + teamAge + ' · ' + teamDay + ' ' + teamTime),
		              $('<p>', {
		                class: 'team-main-list__extra-info'
		              }).text('조회 0 · 신청 ' + waitingCount)
		            )
		          )
		        );

		        $listItems.push($listItem);
			});
			
			//기존의 FreeList 영역을 업데이트
			$('#TeamList').empty().append($listItems);
		}
		
				//지역 선택창
		$('#region-filter').click(function(){
			$('#region').css('display', 'block');
		});
		
		$('.modal--close').click(function(){
			$('#region').css('display', 'none');
			$('#time').css('display', 'none');
			$('#gender').css('display', 'none');
			$('#day').css('display', 'none');
			$('#age').css('display', 'none');
		})
		
		$('#day-filter').click(function(){
			$('#day').css('display', 'block');
		})
		
		$('#gender-filter').click(function(){
			$('#gender').css('display', 'block');
		})
		
		$('#time-filter').click(function(){
			$('#time').css('display', 'block');
		})
		
		$('#age-filter').click(function(){
			$('#age').css('display', 'block');
		})

		
	});
	</script>
</head>
<body>
	<div class="content">
		<div class="team-main__container">
			<div class="main--match--filter">
					<div class="filter--wrapper" style="width: 100%;">
						<ul>
							<li id="region-filter"><span>모든 지역</span> <i
								class="fa-solid fa-arrow-down filter--arrow"></i></li>
							<li id="gender-filter"><span>성별</span> <i
								class="fa-solid fa-arrow-down filter--arrow"></i></li>
							<li id="age-filter"><span>나이</span> <i
								class="fa-solid fa-arrow-down filter--arrow"></i></li>
							<li id="day-filter"><span>요일</span> <i
								class="fa-solid fa-arrow-down filter--arrow"></i></li>
							<li id="time-filter"><span>시간대</span> <i
								class="fa-solid fa-arrow-down filter--arrow"></i></li>
						</ul>
					</div>
				</div>
			<div id="list">
				<div class="team-main-list__wrapper">
					<ul id="TeamList">
						<c:forEach var="teamDto" items="${TeamList}">	
							<li class="team-main-list__item">
								<a href="/team/detail/${teamDto.teamNo}" class="team-main-list__link">
									<c:choose>
                                   		<c:when test="${teamDto.imgNo == 0 }">
                                   			<div class="team-main-list__emblem">
                                       			<img src="/static/image/profile.png" class="team-main-list__emblem-image">
                                       		</div>
                                   		</c:when>
                                   		<c:otherwise>
                                   			<div class="team-main-list__emblem">
												<img src="${teamDto.getImageURL()}" class="team-main-list__emblem-image">		
											</div>
                                   		</c:otherwise>
                                   	</c:choose>
									<div class="team-main-list__content">
										<div class="team-main-list__title">
											<span class="team-main-list__name text-dark">${teamDto.teamName}</span>
											<span class="badge team-main-list__member-count">
												<img src="/static/image/man.png" width="10" height="10" style="margin-right: 4px;">
												${teamDto.teamMemberCount}												
											</span>
										</div>
										<span class="team-main-list__info">${teamDto.teamCity} ${teamDto.teamLocation}</span>
										<span class="team-main-list__info">${teamDto.teamGender} · ${teamDto.teamAge} · ${teamDto.teamDay} ${teamDto.teamTime}</span>
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
		<div id="region" class="modal-container" style="display: none;">
		<div class="modal--mask"></div>
		<div class="modal--wrapper isBottom">
			<div class="modal--header">
				<p class="modal--title">지역</p>
				<p class="modal--close"></p>
			</div>
			<div class="modal--body" style="padding: 0px 25px;">
				<ul class="filter--list">
					<li class="filter--list__item"><a>모든 지역</a></li>
					<li class="filter--list__item"><a>서울</a></li>
					<li class="filter--list__item"><a>경기</a></li>
					<li class="filter--list__item"><a>인천광역시</a></li>
					<li class="filter--list__item"><a>강원</a></li>
					<li class="filter--list__item"><a>대전</a></li>
					<li class="filter--list__item"><a>충남/세종</a></li>
					<li class="filter--list__item"><a>충북</a></li>
					<li class="filter--list__item"><a>대구</a></li>
					<li class="filter--list__item"><a>경북</a></li>
					<li class="filter--list__item"><a>부산</a></li>
					<li class="filter--list__item"><a>울산</a></li>
					<li class="filter--list__item"><a>경남</a></li>
					<li class="filter--list__item"><a>광주</a></li>
					<li class="filter--list__item"><a>전남</a></li>
					<li class="filter--list__item"><a>전북</a></li>
					<li class="filter--list__item"><a>제주</a></li>
				</ul>
			</div>
		</div>
	</div>
		<div id="gender" class="modal-container" style="display: none;">
		<div class="modal--mask"></div>
		<div class="modal--wrapper isBottom">
			<div class="modal--header">
				<p class="modal--title">성별</p>
				<p class="modal--close"></p>
			</div>
			<div class="modal--body" style="padding: 20px;">
				<ul class="checkbox-wrap filter--list-checkbox">
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="sex_m" value="xm"> <label for="sex_m"
						class="checkLabel"><span class="checkbox"></span>
							<p>남자</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="sex_w" value="xw"> <label for="sex_w"
						class="checkLabel"><span class="checkbox"></span>
							<p>여자</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="sex_u" value="xu"> <label for="sex_u"
						class="checkLabel"><span class="checkbox"></span>
							<p>남녀 모두</p></label></li>
				</ul>
			</div>
			<div class="modal--bottom">
				<div class="modal--button">
					<span class="btn blue lg">적용하기</span>
				</div>
			</div>
		</div>
	</div>
		<div id="age" class="modal-container" style="display: none;">
		<div class="modal--mask"></div>
		<div class="modal--wrapper isBottom">
			<div class="modal--header">
				<p class="modal--title">나이</p>
				<p class="modal--close"></p>
			</div>
			<div class="modal--body" style="padding: 20px;">
				<ul class="checkbox-wrap filter--list-checkbox">
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="age_10" value="age10"> <label for="age_10"
						class="checkLabel"><span class="checkbox"></span>
							<p>10대</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="age_20" value="age20"> <label for="age_20"
						class="checkLabel"><span class="checkbox"></span>
							<p>20대</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="age_30" value="age30"> <label for="age_30"
						class="checkLabel"><span class="checkbox"></span>
							<p>30대</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="age_40" value="age40"> <label for="age_40"
						class="checkLabel"><span class="checkbox"></span>
							<p>40대</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="age_50" value="age50"> <label for="age_50"
						class="checkLabel"><span class="checkbox"></span>
							<p>50대 이상</p></label></li>
				</ul>
			</div>
			<div class="modal--bottom">
				<div class="modal--button">
					<span class="btn blue lg">적용하기</span>
				</div>
			</div>
		</div>
	</div>
		<div id="day" class="modal-container" style="display: none;">
		<div class="modal--mask"></div>
		<div class="modal--wrapper isBottom">
			<div class="modal--header">
				<p class="modal--title">요일</p>
				<p class="modal--close"></p>
			</div>
			<div class="modal--body" style="padding: 20px;">
				<ul class="checkbox-wrap filter--list-checkbox">
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="mon" value="mon"> <label for="mon"
						class="checkLabel"><span class="checkbox"></span>
							<p>월요일</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="tue" value="tue"> <label for="tue"
						class="checkLabel"><span class="checkbox"></span>
							<p>화요일</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="wed" value="wed"> <label for="wed"
						class="checkLabel"><span class="checkbox"></span>
							<p>수요일</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="thi" value="thi"> <label for="thi"
						class="checkLabel"><span class="checkbox"></span>
							<p>목요일</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="fri" value="fri"> <label for="fri"
						class="checkLabel"><span class="checkbox"></span>
							<p>금요일</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="sat" value="sat"> <label for="sat"
						class="checkLabel"><span class="checkbox"></span>
							<p>토요일</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="sun" value="sun"> <label for="sun"
						class="checkLabel"><span class="checkbox"></span>
							<p>일요일</p></label></li>
				</ul>
			</div>
			<div class="modal--bottom">
				<div class="modal--button">
					<span class="btn blue lg">적용하기</span>
				</div>
			</div>
		</div>
	</div>
		<div id="time" class="modal-container" style="display: none;">
		<div class="modal--mask"></div>
		<div class="modal--wrapper isBottom">
			<div class="modal--header">
				<p class="modal--title">시간대</p>
				<p class="modal--close"></p>
			</div>
			<div class="modal--body" style="padding: 20px;">
				<ul class="checkbox-wrap filter--list-checkbox">
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="dawn" value="dawn"> <label for="dawn"
						class="checkLabel"><span class="checkbox"></span>
							<p>아침</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="morning" value="morning"> <label for="morning"
						class="checkLabel"><span class="checkbox"></span>
							<p>낮</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="noon" value="noon"> <label for="noon"
						class="checkLabel"><span class="checkbox"></span>
							<p>저녁</p></label></li>
					<li class="checkbox-item filter--list-checkbox__item"><input
						type="checkbox" id="late" value="late"> <label for="late"
						class="checkLabel"><span class="checkbox"></span>
							<p>심야</p></label></li>
				</ul>
			</div>
			<div class="modal--bottom">
				<div class="modal--button">
					<span class="btn blue lg">적용하기</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>