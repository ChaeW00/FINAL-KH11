<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Title</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

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
	<div class="container">
		<div class="content">
			<div class="team-main__container">
				<div class="main--match--filter">
					<div class="filter--wrapper" style="width: 100%;">
						<ul class="nav nav-tabs">
							<li class="nav-item" id="region-filter">
								<a class="nav-link active" data-toggle="tab" href="#region-tab">
									모든 지역 <i class="fa-solid fa-arrow-down filter--arrow"></i>
								</a>
							</li>
							<li class="nav-item" id="gender-filter">
								<a class="nav-link" data-toggle="tab" href="#gender-tab">
									성별 <i class="fa-solid fa-arrow-down filter--arrow"></i>
								</a>
							</li>
							<li class="nav-item" id="age-filter">
								<a class="nav-link" data-toggle="tab" href="#age-tab">
									나이 <i class="fa-solid fa-arrow-down filter--arrow"></i>
								</a>
							</li>
							<li class="nav-item" id="day-filter">
								<a class="nav-link" data-toggle="tab" href="#day-tab">
									요일 <i class="fa-solid fa-arrow-down filter--arrow"></i>
								</a>
							</li>
							<li class="nav-item" id="time-filter">
								<a class="nav-link" data-toggle="tab" href="#time-tab">
									시간대 <i class="fa-solid fa-arrow-down filter--arrow"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div id="list">
					<div class="team-main-list__wrapper">
						<div class="row mt-3">
							<div class="col-7 d-flex justify-content-end">
								<a href="/team/insert" class="btn btn-primary">
									<i class="fa-solid fa-plus me-2"></i>등록
								</a>
							</div>
						</div>
						<ul class="list-group">
							<c:forEach var="teamDto" items="${TeamList}">
								<li class="list-group-item team-main-list__item">
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