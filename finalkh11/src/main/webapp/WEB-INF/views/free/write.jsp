<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Title</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.free-write-container {
	max-width: 928px;
	margin: 0 auto;
}

.recruits-new {
	display: block;
	max-width: 480px;
	margin: 0 auto;
}

.recruits-new .title {
	font-size: 20px;
	font-weight: 500;
}

.page-head {
	display: block;
	width: 100%;
	padding: 32px 16px;
}

.recruits-new .contents-box {
	padding: 0 16px 32px;
}

.content {
	padding-top: 400px;
	box-sizing: border-box;
}
/* 모달 컨테이너 스타일링 */
.modal-container {
	display: none; /* 초기에는 모달을 숨김 */
	position: fixed;
	z-index: 9999;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

/* 모달 내용 스타일링 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
}

/* 닫기 버튼 스타일링 */
.modal-close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
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

.modal-stadium__wrapper {
	max-height: 70%;
	min-height: 70%;
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

.modal--header {
	padding: 16px 20px;
	text-align: left;
	display: flex;
	justify-content: space-between;
}

.modal--wrapper.isBottom .modal--header {
	box-shadow: none;
	padding: 16px 20px;
}

.modal--wrapper.isBottom .modal--title {
	width: 90%;
	text-align: left;
	font-weight: 700;
	font-size: 18px;
	color: #282B33;
}

.modal-stadium__header--facility {
	font-size: 14px;
	line-height: 22px;
	color: #4b5a64;
	font-weight: 400;
}

.modal-stadium__header--facility-option:first-child:before {
	content: "";
}

.modal-stadium__header--facility-option::before {
    content: "•";
}

.modal--wrapper .modal--close {
    content: '';
    position: absolute;
    right: 20px;
    background-image: url(/static/image/x-solid.svg);
    background-repeat: no-repeat;
    width: 18px;
    height: 18px;
}

.modal--header .modal--close {
    cursor: pointer;
    font-size: 14px;
}

#dateNav {
	display: inherit;
	background-color: white;
	z-index: 2;
	left: 0;
	position: sticky;
	top: 0;
	padding: 20px 0;
}
@media only screen and (min-width: 1024px){
#dateNav {
    padding: 20px 0;
}
}

#dateNav .slick-track {
   
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

.post {
    display: none;
    float: left;
    height: 100%;
    min-height: 1px;
   
    /* margin-right: 10px; */
}



.post-wrapper .post {
    border-radius: 38px;
    padding: 10px 0;
    margin-right: 10px;
    display: flex !important;
    flex-direction: column;
    width: 16px!important;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-slide p {
	font-size: 14px;
    line-height: 160%;
    font-weight: 400;
    white-space: nowrap;
}

.slick-slide span {
    font-size: 12px;
    line-height: 120%;
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

li.post {
	text-align: center; /* 내부 요소들을 가운데 정렬 */
}

.isSun {
	color: #ea3e42;
}

.isSat {
	color: #3534A5;
}

.field {
	width: 100%;
	display: block;
}

.field-header {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
}

.field-title {
	font-size: 14px;
	font-weight: 500;
	line-height: 1em;
}

.field-slot {
	margin-top: 8px;
}

.field-slot .grid-3 {
	display: grid;
	grid-gap: 8px;
	grid-template-columns: 1fr 1fr 1fr;
}

.gap {
	display: block;
	clear: both;
	width: 100%;
	height: 18px;
}

.text-field {
	display: block;
	width: 100%;
}

.text-field input {
	display: block;
	width: 100%;
	font-size: 14px;
	font-weight: 400;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	padding: 12px 8px;
	border: 1px solid #000;
	border-radius: 0;
	-webkit-appearance: none;
	-webkit-border-radius: 0;
}

.button {
	background-color: white;
	color: black;
	height: 30px;
}

.button:hover {
	background-color: black;
	color: white;
}

.button.selected {
	background-color: black;
	color: white;
}

@media ( min-width : 600px) {
	section {
		border: 1px solid #f7f7f7;
		border-top: none;
		max-height: 80vh;
		overflow-y: scroll;
	}
}

section {
	padding: 0px;
}

@media ( min-width : 600px) {
	.search-list {
		max-height: 400px;
		max-width: 400px;
	}
}

.search-list ul li {
	padding: 20px;
	display: flex;
	border-bottom: 1px solid #f2f5f7;
	cursor: pointer;
	align-items: center;
}

.search-list ul li i {
	margin-right: 10px;
}

i {
	width: 24px;
	height: 24px;
	padding: 0;
	display: inline-block;
	cursor: pointer;
}

.search-list ul li .info {
	display: inline-block;
	width: calc(100% - 40px);
}

.search-list.off {
	display: none;
}

p {
	margin: 0;
	padding: 0;
	word-break: break-all;
}

.search-list ul li p {
	font-size: 15px;
}

.search-list ul li p.address {
	font-size: 12px;
}

.search-container {
	position: relative;
}

.close-btn {
	position: absolute;
	top: 50%;
	right: 0;
	left: 10;
	transform: translateY(-50%) translateX(-10px);
	cursor: pointer;
}

.stadium-list__list-item {
    margin-bottom: 20px;
}

.stadium-list__time-block--wrapper {
	display: flex;
	margin-top: 10px;
	width: 100%;
}

.stadium-list__time-info--wrapper {
	margin-top: 4px;
	display: flex;
}

.stadium-list__time-info {
	font-size: 10px;
	line-height: 12px;
	color: #9EAAB3;
	width: 25%;
}

.stadium-list__time-block {
	width: 100%;
	height: 3px;
	background-color: #E6ECF1;
	margin-right: 1px;
}

.stadium-list__time-block--filled {
	background-color: #1570FF;
}

.stadium-list__legend--wrapper {
    display: flex;
    justify-content: end;
    margin-bottom: 20px;
}

.stadium-list__legend {
    font-weight: 500;
    font-size: 12px;
    line-height: 14px;
    color: #727F88;
    display: flex;
    margin-left: 20px;
}

.stadium-list__legend--available {
    width: 20px;
    height: 15px;
    background: #1570FF;
    border-radius: 4px;
    margin-right: 4px;
}

  .button-container {
    display: flex;
    flex-direction: column;
  }
  
  .button-container button {
    margin-bottom: 10px;
    margin-left: 5px;
    padding: 2px 7px;
  }
  
.stadium-list__list-item__name {
    font-weight: 700;
    font-size: 16px;
    line-height: 160%;
    margin-bottom: 4px;
}

.stadium-list__legend--soldout {
    width: 20px;
    height: 15px;
    background: #E6ECF1;
    border-radius: 4px;
    margin-right: 4px;
}

.modal--body {
    overflow-y: auto;
    padding: 0px 20px 16px 20px;
}

.stadium-product {
    margin-top: 8px;
    margin-bottom: 4px;
    cursor: pointer;
}

.stadium-product__wrapper {
    background: #E8F7FF;
    border-radius: 8px;
    padding: 12px 20px;
    display: flex;
    justify-content: space-between;
}

.stadium-product__time {
    font-size: 14px;
    line-height: 120%;
}

.stadium-product__price {
    color: #539CFF;
    font-size: 14px;
    line-height: 120%;
}

.res {
    display: block;
    width: 100%;
    font-size: 14px;
    font-weight: 400;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    color: #1570FF;
}
.post.isActive {
    background-color: #1570FF;
    color: white;
}

#regist {
    padding: 0 15px;
    width: auto !important;
    height: 30px !important;
    line-height: 30px;
    text-align: center;
    background: #fff !important;
    border: 1px solid #aaa !important;
    border-radius: 3px;
    color: #686868;
    transition: .2s;
    background: #444 !important;
    border: 1px solid #303030 !important;
    color: #fff;
    display: block;
    margin-left: auto;
}

</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#myText').summernote({
			toolbar: [
			      ['style', ['bold', 'italic', 'underline', 'clear']],
			],
			height: 300
		});
		const addressInput = document.getElementById('address-input');
		const searchResults = document.getElementById('search-results');
		addressInput.addEventListener('input', () => {
			const searchTerm = addressInput.value;
			 if (searchTerm.trim() !== '') { // 입력값이 비어있지 않은 경우에만 요청 보내기
		    /* const encodedSearchTerm = encodeURIComponent(searchTerm); */ // URL 인코딩
			// Ajax를 사용하여 서버로 주소 검색 요청 보내기
					const recentSearches = sessionStorage.getItem('recentSearches');
		    		let searchesArray = recentSearches ? JSON.parse(recentSearches) : [];
		    		searchesArray.push(searchTerm);
		    		sessionStorage.setItem('recentSearches', JSON.stringify(searchesArray));
		    		
		    		console.log(recentSearches);
		            $.ajax({
		                url: `/free/ground-search`,
		                type: 'GET',
		                data: { term: searchTerm },
		                dataType: 'json',
		                success: function(response) {
		                  console.log(searchTerm);
		                  const results = response;
		                  // 검색결과를 동적으로 표시
		                  console.log(results);
		                  updateList(results, searchTerm);
		                },
		                error: function(jqXHR, textStatus, errorThrown) {
		                  console.log('주소 검색 요청에 실패하였습니다:', errorThrown);
		                }
		              });
			 }
		});
		
		function updateList(data, searchTerm) {
			  var $listItems = [];
			  data.forEach(function(item) {
				var groundName = item.groundName;
				var groundBasicAddr = item.groundBasicAddr;
				var groundDetailAddr = item.groundDetailAddr;
				var groundAddr = item.groundAddr;
			    var $listItem = $('<li>', {
			      class: 'stadium',
			    }).append(
			      $('<i>', {
			        class: 'fa-solid fa-square',
			      }),
			      $('<div>', {
			        class: 'info',
			      }).append(
			        $('<p>').append($('<strong>').text(searchTerm),
					' ' + groundName,		
			        ),

			        $('<p>',{
			        	class: 'address',
			        }).text(groundBasicAddr + ' ' + groundDetailAddr + ' ' + groundAddr)
			      )
			    );
			    
			    $listItem.click(function() {
			    	$('.stadium-product-list').empty();
					$('.stadium-list__list-item__name').empty();
					$('.modal--title').empty();
					$('.modal-stadium__header--facility-option').empty();
					$('.post-li').empty();
					$('.post-li').empty();
					$('#post').attr('class', 'post-li');
			    	openModal(item);
			    })
			    
			    $listItems.push($listItem);
				
			  });
			  $('#searchList').empty().append($listItems);
			}
		
		$('.close-btn').click(function(){
			$('#address-input').val('');
			$('.search-list').toggleClass('off');
		})
		
		const $input = $('#address-input');
		const $button = $('.close-btn');
		
		$('#address-input').on('input', function(){
			if($.trim($input.val()) === ''){
				$button.hide();
				$('.search-list').toggleClass('off');
			}else{
				$button.show();
				$('.search-list').removeClass('off');
			}
		})
	
		
		//모달 창 열기
		function openModal(result, selectedDate) {
			
			$('.stadium-product-list').empty();
			$('.stadium-list__list-item__name').empty();
			$('.modal--title').empty();
			$('.modal-stadium__header--facility-option').empty();
			$('.post-li').empty();
			const modalContainer = document.querySelector('.modal-container');
			const modalContent = document.querySelector('.modal-content');
			//모달 내용 초기화
			const currentDate = new Date();
			const currentYear = currentDate.getFullYear();
			const currentDay = currentDate.getDate();
			console.log(result);
			
			//reserveDate 설정
			let reserveDate = selectedDate ? selectedDate : currentDate.toISOString().split('T')[0];
			console.log(selectedDate);
			console.log('abc' + reserveDate);
			$.ajax({
				url: `/free/schedule-search`,
				type: 'GET',
				data: { 
					groundNo: result.groundNo,
			        reserveDate: reserveDate,   
				},	
				dataType: 'json',
				success: function(response) {
					const results = response;	       
					dateNav();
					$('.post').filter(function(){
						return $(this).find('p').text() === reserveDate.split('-')[2];
					}).addClass('isActive');
					console.log(results);
					$('.modal--title').prepend(result.groundName);
					$('.modal-stadium__header--facility-option').eq(0).text(result.groundPark);
					$('.modal-stadium__header--facility-option').eq(1).text(result.groundShower);
					$('.stadium-list__list-item__name').prepend('다목적구장 ' + result.groundSize);
					
					const divElements = Array.from(document.querySelectorAll('.stadium-list__time-block'));
					divElements.forEach(function(element){
						element.classList.remove('stadium-list__time-block--filled');
					}); 
					response.forEach(function(element, index) {
						   const ss = element.scheduleStart;
						   const se = element.scheduleEnd;
						   const formattedNum = result.groundPrice.toLocaleString();
						   console.log(formattedNum);
						   const startTimeParts = ss.split(":");
						   const startHour = parseInt(startTimeParts[0]);
						   const startMinute = parseInt(startTimeParts[1])
						   const endTimeParts = se.split(":");
						   const endHour = parseInt(endTimeParts[0]);
						   const endMinute = parseInt(endTimeParts[1])

						   let hours = endHour - startHour;
						   console.log(hours);
						   
						   for(let i=0;i<hours;i++){
							   const targetElement = divElements[startHour-6+i];
							   targetElement.classList.add('stadium-list__time-block--filled');
							 }
						   
	
						   var $btn = $('<li>', {
							   class: 'stadium-product'
							 }).append(
							   $('<div>', {
							     class: 'stadium-product__wrapper'
							   }).append(
							     $('<span>', {
							       class: 'stadium-product__time'
							     }).append(
							       $('<b>').text(ss+'~'+se)
							     ).append('(' + hours + '시간)'), 
							     $('<span>', {
							       class: 'stadium-product__price'
							     }).text(formattedNum + '원')
							   )
							 );
						   $btn[0].setAttribute('data-scheduleNo', element.scheduleNo); 
						   $btn[0].setAttribute('data-groundNo', result.groundNo); 
						   
						   $('.stadium-product-list').append($btn);
						});

					
					
				   modalContainer.style.display = 'block';
				   
				   $('.stadium-product').click(function(){
					   const modalContainer = document.querySelector('.modal-container');
					   modalContainer.style.display = 'none';
					   $('#scheduleNoInput').val($(this).attr('data-scheduleNo'));
					   $('#freeDateInput').val(reserveDate);
					   $('#groundNoInput').val($(this).attr('data-groundNo'));
					   $('.search-list').addClass('off');
					   $('.res').children().remove();
					   const selectedDiv = $('<div>').text(reserveDate + ' ' + $(this).find('b').text() + ' ' + result.groundName);
					   $('.res').append(selectedDiv);
				   });
				   
				    $('.post').on('click', function(){
					   closeModal();
					   var clickedDate = $(this).attr('data-date');
					   
					   openModal(result, clickedDate);
					   
				   })
				      
				},
				error: function(jqXHR, textStatus, errorThrown) {
			          console.log('주소 검색 요청에 실패하였습니다:', errorThrown);
			        }
			});
			
			

			
	}
		
		$('.modal--close').click(function(){
			closeModal();
		})
		
		function closeModal() {
			  const modalContainer = document.querySelector('.modal-container');
			  modalContainer.style.display = 'none';
			  $('.post-li').empty();
			  $('#post').attr('class', 'post-li');
			}
	
		
		function dateNav(){
/* 		    //현재 날짜 가져오기
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
		    	slideItem.innerHTML= '<p>' + day.toString().padStart(2, '0') + '</p><span>' + weekday + '</span>';
		    	// 현재 날짜를 dataset 속성으로 추가
		    	var formattedDate = date.toISOString().split('T')[0];
  				slideItem.dataset.date = formattedDate;
		    	//슬라이드 항목을 ul 요소에 추가
		    	var postList = document.querySelector('.post-li');
		    	postList.appendChild(slideItem); */
			 //현재 날짜 가져오기
		    var currentDate = new Date();
		    //슬라이드 항목을 담을 배열
		    var slideItems = [];
		    //2주간 날짜 생성
		    for(var i=0;i<14;i++){
		        //날짜 계산
		        var date = new Date(currentDate.getTime() + i*24*60*60*1000);
		        //날짜와 요일 생성
		        var day = date.getDate();
		        var weekday = getWeekday(date.getDay());
		        //슬라이드 항목 생성
		        var slideItem = document.createElement('li');
		        slideItem.className='post';
		        if(weekday==='일'){
		            slideItem.classList.add('isSun');
		        }else if(weekday==='토'){
		            slideItem.classList.add('isSat');
		        }
		        slideItem.innerHTML= '<p>' + day.toString().padStart(2, '0') + '</p><span>' + weekday + '</span>';
		        // 현재 날짜를 dataset 속성으로 추가
		        var formattedDate = date.toISOString().split('T')[0];
		        slideItem.dataset.date = formattedDate;
		        //슬라이드 항목을 배열에 추가
		        slideItems.push(slideItem);
		    }
		    
		    //배열에 있는 슬라이드 항목을 순서대로 추가
		    var postList = document.querySelector('.post-li');
		    slideItems.forEach(function(slideItem){
		        postList.appendChild(slideItem);
		    });
		    
		    function getWeekday(dayIndex){
		    	var weekdays = ['일', '월', '화', '수', '목', '금', '토'];
		    	return weekdays[dayIndex];
		    }
		    
		    var slideWrapper = $('.post-wrapper .post-li');
		    
		    slideWrapper.slick({
		        slidesToShow: 5,
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
		const form = document.getElementById('myForm');		
		const levelButtons = document.querySelectorAll('#level');
		const freeLevelInput = document.getElementById('freeLevelInput');
		const genderButtons = document.querySelectorAll('#gender')
		const genderInput = document.getElementById('freeGenderInput');
		const sizeButtons = document.querySelectorAll('#size');
		const sizeInput = document.getElementById('freeSizeInput');
		const needButtons = document.querySelectorAll('#need');
		const needInput = document.getElementById('freeNeedInput');
		
		buttonSelect(levelButtons, freeLevelInput);
		buttonSelect(genderButtons, genderInput);
		buttonSelect(sizeButtons, sizeInput);
		buttonSelect(needButtons, needInput);
		
		function buttonSelect(buttons, selectedInput){
			buttons.forEach(button => {
				button.addEventListener('click', () => {
					buttons.forEach(btn => btn.classList.remove('selected'));
					button.classList.add('selected');
					selectedInput.value = button.value;
					console.log(selectedInput.value);
				})
			})
		}
		
		
	});
</script>
</head>
<body>
	<div class="content" style="padding-top: 120px; box-sizing: border-box">
		<form id="myForm" action="write" method="post" autocomplete="off">
			<div class="free-write-container">
				<div class="recruits-new">
					<div class="page-head">
						<div class="title">용병모집</div>
					</div>
					<div class="contents-box">
						<div class="field">
							<div class="field-header">
								<div class="field-title">제목</div>
							</div>
							<div class="field-slot">
								<div class="text-field">
									<input type="text" name="freeTitle" placeholder="제목을 입력해주세요"
										autocomplete autocorrect="off" autocapitalize="none"
										spellcheck="false">
								</div>
							</div>
						</div>
						<div class="gap"></div>
						<div class="field">
							<div class="field-header">
								<div class="field-title">실력</div>
							</div>
							<div class="field-slot">
								<div class="grid-3">
									<button type="button" id="level" class="button" value="일반">일반</button>
									<button type="button" id="level" class="button" value="상">상</button>
									<button type="button" id="level" class="button" value="중">중</button>
									<input type="hidden" name="freeLevel" id="freeLevelInput">
								</div>
							</div>
						</div>
						<div class="gap"></div>
						<div class="field">
							<div class="field-header">
								<div class="field-title">성별</div>
							</div>
							<div class="field-slot">
								<div class="grid-3">
									<button type="button" id="gender" class="button" value="남자">남자</button>
									<button type="button" id="gender" class="button" value="여자">여자</button>
									<button type="button" id="gender" class="button" value="남녀모두">남녀모두</button>
									<input type="hidden" name="freeGender" id="freeGenderInput">
								</div>
							</div>
						</div>
						<div class="gap"></div>
						<div class="field">
							<div class="field-header">
								<div class="field-title">매치규모</div>
							</div>
							<div class="field-slot">
								<div class="grid-3">
									<button type="button" id="size" class="button" value="3vs3">3vs3</button>
									<button type="button" id="size" class="button" value="4vs4">4vs4</button>
									<button type="button" id="size" class="button" value="5vs5">5vs5</button>
									<button type="button" id="size" class="button" value="6vs6">6vs6</button>
									<input type="hidden" name="freeSize" id="freeSizeInput">
								</div>
							</div>
						</div>
						<div class="gap"></div>
						<div class="field">
							<div class="field-header">
								<div class="field-title">필요인원</div>
							</div>
							<div class="field-slot">
								<div class="grid-3">
									<button type="button" id="need" class="button" value="1">1명</button>
									<button type="button" id="need" class="button" value="2">2명</button>
									<button type="button" id="need" class="button" value="3">3명</button>
									<input type="hidden" name="freeNeedNum" id="freeNeedInput">
								</div>
							</div>
						</div>
						<div class="gap"></div>
						<div class="field">
							<div class="field-header">
								<div class="field-title">참가비</div>
							</div>
							<div class="field-slot">
								<div class="text-field">
									<input type="text" name="freeFee" placeholder="참가비를 입력해주세요"
										autocomplete autocorrect="off" autocapitalize="none"
										spellcheck="false">
								</div>
							</div>
						</div>
						<div class="gap"></div>
						<div class="field">
							<div class="field-header">
								<div class="field-title">경기장</div>
							</div>
							<div class="field-slot">
								<div class="text-field">
									<div class="search-container">
										<input type="text" id="address-input" class="search-input"
											placeholder="지역, 구장이름으로 찾기"> <span class="close-btn">&times;</span>
									</div>
									<div class="res"></div>
									<div></div>
									<section>
										<div class="search-list off">
											<ul id="searchList"></ul>
										</div>
									</section>
								</div>
							</div>
						</div>
						<div class="gap"></div>
						<div class="field">
							<div class="field-header">
								<div class="field-title"></div>
							</div>
							<div class="field-slot">
								<textarea name="freeContent" class="form-input w-100" id="myText"
							style="min-height: 300px;"></textarea>
							</div>
						</div>
			
						<div class="field">
							<div class="field-header">
								<div class="field-title"></div>
							</div>
							<div class="field-slot">
								<button id="regist" type="submit" class="form-btn positive w-100">등록</button>
							</div>
						</div>

			
					</div>
					<div class="gap"></div>
					<!-- 모달 컨테이너 -->
					<div class="modal-container">
						<div class="modal--mask"></div>
						<!-- 모달 내용 -->
						<div class="modal--wrapper isBottom modal-stadium__wrapper">
							<div class="modal--header">
								<div class="modal--title">
									<div class="modal-stadium__header--facility">
										<span class="modal-stadium__header--facility-option"></span>
										<span class="modal-stadium__header--facility-option"></span>
									</div>
								</div>
								<p class="modal--close"></p>
							</div>
							<div class="modal--body modal-stadium_body">
								<div>
									<div class="stadium__info__container" style="padding: 0px">
										<div id="dateNav" class="sub-header"
											style="padding-bottom: 10px">
											<div class="post-slider">
												<div class="post-wrapper">
													<ul id="post" class="post-li">
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="stadium-list__container">
										<ul class="stadium-list__list">
											<li class="stadium-list__list-item">
												<div class="stadlim-list__list-item__info--wrapper">
													<div class="stadium-list__list-item__facility--wrapper">
														<span class="stadium-list__list-item__name"></span>
													</div>
													<!---->
												</div>
												<div>
													<div class="stadium-list__time-block--wrapper">
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
														<div class="stadium-list__time-block"></div>
													</div>
													<div class="stadium-list__time-info--wrapper">
														<div class="stadium-list__time-info">6시</div>
														<div class="stadium-list__time-info">12시</div>
														<div class="stadium-list__time-info">18시</div>
														<div class="stadium-list__time-info">24시</div>
													</div>
												</div>
											</li>
										</ul>
										<div class="stadium-list__legend--wrapper">
											<div class="stadium-list__legend">
												<div class="stadium-list__legend--available"></div>
												예약가능
											</div>
											<div class="stadium-list__legend">
												<div class="stadium-list__legend--soldout"></div>
												예약불가
											</div>
										</div>
										<ul class="stadium-product-list">
											
										</ul>
										<input type="hidden" id="scheduleNoInput" name="scheduleNo">
										<input type="hidden" id="freeDateInput" name="freeDate">
										<input type="hidden" id="groundNoInput" name="groundNo">
									</div>
								</div>
							</div>
						</div>

					</div>
					
				
						

					
				</div>
			</div>

	</form>
	</div>

</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>