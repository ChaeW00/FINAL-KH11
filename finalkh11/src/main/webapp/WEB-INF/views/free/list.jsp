
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
.content {
	padding-top: 120px; /* 헤더의 높이만큼 padding-top 값을 설정합니다. */
	box-sizing: border-box;
}

#dateNav {
	padding: 20px 0;
}

.post-slider {
	padding: 10px 30px;
	max-width: 1024px;
	margin: 0 auto;
}

.post-slider .post-wrapper {
	margin: 0px auto;
}

.post-li {
	/*     display: flex;
	    align-items: center;
	    justify-content: center; */
	background: none;
	border: 0;
	cursor: pointer;
	transition: all 0.5s;
}

.post-slider .post-wrapper .post {
	width: 128px;
	display: inline-block;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.post-li .dateWrap {
	border-radius: 38px;
	padding: 10px 0;
	margin-right: 10px;
	display: flex !important;
	flex-direction: column;
}

.post.isActive {
	background-color: #1570FF;
	color: white;
}

.post-li .post {
	border-radius: 38px;
	padding: 10px 0;
	margin-right: 10px;
	display: flex !important;
	flex-direction: column;
}

li.post {
	text-align: center; /* 내부 요소들을 가운데 정렬 */
}

.isSun {
	color: #ea3e42;
}

.isSat {
	color: #3534A5;
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

p {
	margin: 0;
	padding: 0;
	word-break: break-all;
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

/*목록 컨텐츠 css*/
.list--match-schedule--container {
	max-width: 1024px;
	margin: 0 auto;
}

@media ( min-width : 1024px) {
	.list--match-schedule--item a {
		padding: 15px;
	}
}

.list--match-schedule--item a {
	border-bottom: 1px solid #ddd;
	display: flex;
	align-items: center;
	flex-wrap: nowrap;
	padding: 20px 15px;
	justify-content: space-between;
}

.free-list__title {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

@media ( min-width : 1024px) {
	.list--match-schedule--item .list--match-schedule__time {
		width: 10%;
		text-align: center;
		font-weight: 700;
		font-size: 15px;
	}
}

@media ( min-width : 1024px) {
	.list--match-schedule--item .list--match-schedule__info {
		width: 30%;
	}
}

@media ( min-width : 1024px) {
	.list--match-schedule--item .list--match-schedule__info h3 {
		font-size: 16px;
	}
}

.list--match-schedule--item .list--match-schedule__info h3 {
	font-size: 14px;
	font-weight: 400;
	word-break: keep-all;
}

.match-list__title h3 {
	display: inline;
}

@media ( min-width : 1024px) {
	.list--match-schedule--item .list--match-schedule__status {
		width: 10%;
	}
}

@media ( min-width : 1024px) {
	.list--match-schedule--item .list-match-schedule__title {
		width: 50%;
		padding-right: 10px;
	}
}

.label--match-option {
	font-size: 12px;
	color: #727F88;
	margin-top: 3px;
	display: flex;
	align-items: center;
	justify-content: flex-start;
	flex-wrap: wrap;
}

.label--match-option span {
	padding-right: 3px;
}

.label--match-option span:not(.is_mid, .is_beginner)::before {
	content: '·';
	padding-right: 3px;
}

.match--option {
	display: flex;
	align-items: center;
}

.match--option:not(.is_mid, .is_beginner)::before {
	content: '';
	background-color: #3534a5;
	width: 2px;
	height: 5px;
	border-radius: 5px;
	margin-right: 3px;
	margin-top: -2px;
}

.match--option.isMen:before {
	background-color: #3534a5;
}

.match--option.isWomen:before {
	background-color: #FF5D5D;
}

.match--option.isMix:before {
	background-color: #FFC645;
}

.match--option.isMen:before, .match--option.isMix:before, .match--option.isWomen:before
	{
	content: '';
}
.match--option.is_beginner {
    display: flex;
    align-items: center;
    background-color: #009E5C;
    color: white;
    border-radius: 4px;
    padding: 2px 5px;
    margin-left: 3px;
}
.match--option.is_mid {
    display: flex;
    align-items: center;
    background-color: #553246;
    color: #ffc645;
    border-radius: 4px;
    padding: 2px 5px;
    margin-left: 3px;
}
.match-status {
	width: 100%;
	text-align: center;
	padding: 8px 5px;
	border-radius: 6px;
	font-size: 12px;
}

.match-status.isHurry {
	color: white;
	background-color: #FF4D37;
}

.match-status.isFull {
	color: #ccc;
	background-color: #EEEEEE;
}

.match-status.isOpen {
	color: white;
	background-color: #1570FF;
}

/* 회전목마 전광판 css */
@media (min-width: 1024px){
.carousel--container {
    background-color: #F2F5F7;
    margin: 0 auto;
    border-bottom: 1px solid #ddd;
    margin-bottom: 50px;
}
}

</style>

<script type="text/javascript">
	$(function () {
		
		function dateNav(){
	    //현재 날짜 가져오기
	    var currentDate = new Date();
	    //2주간 날짜 생성
	    for(var i=0;i<14;i++){
	    	//날짜 계산
	    	var date = new Date(currentDate.getTime() + i*24*60*60*1000);
	    	//날짜와 요일 생성
	    	var day = date.getDate();
	    	var weekday = getWeekday(date.getDay());
	    	//슬라이드 항목에 동적으로 생성된 날짜와 요일 추가
	    	var slideItem = document.createElement('li');
	    	slideItem.className='post';
	    	if(weekday==='일'){
	    		slideItem.classList.add('isSun');
	    	}else if(weekday==='토'){
	    		slideItem.classList.add('isSat');
	    	}
	    	slideItem.innerHTML= '<p>' + day + '</p><span>' + weekday + '</span>';
	    	//슬라이드 항목을 ul 요소에 추가
	    	var postList = document.querySelector('.post-li');
	    	postList.appendChild(slideItem);
	    }
	    
	    function getWeekday(dayIndex){
	    	var weekdays = ['일', '월', '화', '수', '목', '금', '토'];
	    	return weekdays[dayIndex];
	    }
	    
	    var slideWrapper = $('.post-wrapper .post-li');
	    
	    slideWrapper.slick({
	        slidesToShow: 7,
	        slidesToScroll: 1,  
	    });
	    //초기 슬라이드 인덱스 확인
	    var initialSlide = slideWrapper.slick('slickCurrentSlide');
	    //이전 다음 버튼 상태 설정 함수
	    function setButtonStates(currentSlide, slideCount){
	    	if (currentSlide === 0) {
	            $('.slick-prev').prop('disabled', true);
	        } else {
	            $('.slick-prev').prop('disabled', false);
	        }
	
	        // 마지막 슬라이드인 경우 "Next" 버튼 비활성화
	        if (currentSlide === slideCount/2) {
	            $('.slick-next').prop('disabled', true);
	        } else {
	            $('.slick-next').prop('disabled', false);
	        }
	    }
	    
	    setButtonStates(initialSlide, slideWrapper.slick('getSlick').slideCount);
	    //슬라이드 변경 이벤트 핸들러
	    slideWrapper.on('beforeChange', function(event, slick, currentSlide, nextSlide){
	    	setButtonStates(nextSlide, slick.slideCount);
	    });
	    
	    var dateItems = document.querySelectorAll('.post');
	    //각 <li> 태그에 이벤트 핸들러 등록
	    dateItems.forEach(function(item){
	    	item.addEventListener('click', function(){
	    		var selectedDate = this.querySelector('p').textContent;
	    		console.log(selectedDate);
	    	});
	    });
		}
		
		dateNav();
		
		//var dateFilterElement = document.getElementById('dateFilter');
		//var levelFilterElement = document.getElementById('levelFilter');
		
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
				url: `/free/filter`,
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
			
			function getGenderClass(gender) {
	        	if(gender === '남자') {
	        		return 'isMen';
	        	}else if(gender ==='여자') {
	        		return 'isWomen';
	        	}else{
	        		return 'isMix';
	        	}
	        }
			
			function getLevelClass(level) {
				if(level === '상') {
					return 'is_mid';
				}else if(level ==='중') {
					return 'is_beginner';
				}
			}
			
			data.forEach(function(item) {
				console.log(item);
				var groundNo = item.groundNo;
		        var freeTitle = item.freeTitle;
		        var freeNeedNum = item.freeNeedNum;
		        var freeLevel = item.freeLevel;
		        var freeGender = item.freeGender;
		        var freeSize = item.freeSize;
		        
		        var $listItem = $('<li>', {
		            class: 'list--match-schedule--item',
		            style: '',
		          }).append(
		            $('<a>', {
		              class: 'parent-container',
		            }).append(
		              $('<div>', {
		                class: 'list--match-schedule__time',
		              }).append($('<p>').text('16:00')),
		              $('<div>', {
		                class: 'list--match-schedule__info',
		              }).append(
		                $('<div>', {
		                  class: 'match-list__title',
		                }).append($('<h3>').text(groundNo)),
		                $('<div>', {
		                  class: 'label--match-option',
		                }).append(
		                  $('<span>', {
		                    class: 'match--option ' + getGenderClass(freeGender),
		                  }).text(freeGender),
		                  $('<span>').text(freeNeedNum + '명'),
		                  $('<span>').text(freeSize),
		                  $('<span>', {
		                	  class: 'match--option ' + getLevelClass(freeLevel),
		                  }).text(freeLevel)
		                )
		              ),
		              $('<div>', {
		                class: 'list-match-schedule__title',
		              }).append(
		                $('<div>', {
		                  class: 'free-list__title',
		                }).text(freeTitle)
		              ),
		              $('<div>', {
		                class: 'list--match-schedule__status',
		              }).append(
		                $('<div>', {
		                  class: 'match-status isFull',
		                }).append($('<p>').text('마감'))
		              )
		            )
		          );

		        $listItems.push($listItem);
			});
			
			//기존의 FreeList 영역을 업데이트
			$('#FreeList').empty().append($listItems);
		}
		
		//지역 선택창
		$('#region-filter').click(function(){
			$('#region').css('display', 'block');
		});
		
		$('.modal--close').click(function(){
			$('#region').css('display', 'none');
			$('#level').css('display', 'none');
			$('#gender').css('display', 'none');
		})
		
		$('#level-filter').click(function(){
			$('#level').css('display', 'block');
		})
		
		$('#gender-filter').click(function(){
			$('#gender').css('display', 'block');
		})
		
		//데이트 네비 선택
		$('.post').click(function(){
			$(this).addClass("isActive");
		});
		
		
	});
	</script>

<div class="content">
	<div class="row"></div>
	<div class="carousel--container">
		
	</div>
	<div class="main--free-container">
	<div id="dateNav" class="sub-header" style="padding-bottom: 10px">
		<div class="post-slider">
			<div class="post-wrapper">
				<ul class="post-li">
				</ul>
			</div>
		</div>
		<div class="main_filter">
			<div class="main--match--filter">
				<div class="filter--wrapper" style="width: 100%;">
					<ul>
						<li id="region-filter"><span>모든지역</span> <i
							class="fa-solid fa-arrow-down filter--arrow"></i></li>
						<li class=""><span>마감 가리기</span> <i
							class="fa-solid fa-arrow-down filter--arrow"></i></li>
						<li id="gender-filter"><span>성별</span> <i
							class="fa-solid fa-arrow-down filter--arrow"></i></li>
						<li id="level-filter"><span>레벨</span> <i
							class="fa-solid fa-arrow-down filter--arrow"></i></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row mt-4"><div class="offset-sm-1 col-sm-10 text-end">
		<a class="btn btn-primary" href="write">
			<i class="fa-solid fa-plus"></i>
			모집글 등록
		</a>
	</div></div>
	
	<div class="row mt-4"><div class="offset-sm-1 col-sm-10">
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>작성자</th>
					<th width="50%">제목</th>
					<th>작성일</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="freeDto" items="${list}">
					<tr>
						<td>${freeDto.freeNo}</td>
						<td>${freeDto.freeWriter}</td>
						<td>
							<a href="detail/${freeDto.freeNo}">${freeDto.freeTitle}</a>
						</td>
						<td>${freeDto.writeTime}</td>
						<td>
							<div class="match-status isFull">
								<p>마감</p>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div></div>

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
				<li class="filter--list__item"><a>경기도</a></li>
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
<div id="level" class="modal-container" style="display: none;">
	<div class="modal--mask"></div>
	<div class="modal--wrapper isBottom">
		<div class="modal--header">
			<p class="modal--title">레벨</p>
			<p class="modal--close"></p>
		</div>
		<div class="modal--body" style="padding: 20px;">
			<ul class="checkbox-wrap filter--list-checkbox">
				<li class="checkbox-item filter--list-checkbox__item"><input
					type="checkbox" id="level_beginner" value="low"> <label
					for="level_beginner" class="checkLabel"> <span
						class="checkbox"></span>
						<p>아마추어1 이하</p>
				</label></li>
				<li class="checkbox-item filter--list-checkbox__item"><input
					type="checkbox" id="level_mid" value="high"> <label
					for="level_mid" class="checkLabel"> <span class="checkbox"></span>
						<p>아마추어2 이상</p></label></li>
				<li class="checkbox-item filter--list-checkbox__item"><input
					type="checkbox" id="level_every" value="normal"> <label
					for="level_every" class="checkLabel"> <span
						class="checkbox"></span>
						<p>일반</p>
				</label></li>
			</ul>
		</div>
		<div class="modal--bottom">
			<div class="modal--button">
				<span class="btn blue lg">적용하기</span>
			</div>
		</div>
	</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>