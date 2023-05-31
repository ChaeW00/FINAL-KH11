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
<style>
<style>
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

@media (min-width: 1024px){
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

#dateNav {
	    display: inherit;
    background-color: white;
    z-index: 2;
    left: 0;
    position: sticky;
    top: 0;
    padding: 20px 0;
}
.post-slider {
	padding: 10px 30px;
	max-width: 1024px;
    margin: 0 auto;
}

.post-slider .post-wrapper {
	height: 130px;
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
	height: 100px;
	display: inline-block;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.post-li .dateWrap{
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
</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	$(function() {
		const addressInput = document.getElementById('address-input');
		const searchResults = document.getElementById('search-results');
		
		addressInput.addEventListener('input', () => {
			const searchTerm = addressInput.value;
			 if (searchTerm.trim() !== '') { // 입력값이 비어있지 않은 경우에만 요청 보내기
		            /* const encodedSearchTerm = encodeURIComponent(searchTerm); */ // URL 인코딩
			// Ajax를 사용하여 서버로 주소 검색 요청 보내기
		            $.ajax({
		                url: `/free/ground-search`,
		                type: 'GET',
		                data: { term: searchTerm },
		                dataType: 'json',
		                success: function(response) {
		                  const results = response;
		                  // 검색결과를 동적으로 표시
		                  showSearchResults(results);
		                },
		                error: function(jqXHR, textStatus, errorThrown) {
		                  console.log('주소 검색 요청에 실패하였습니다:', errorThrown);
		                }
		              });
			 }
		});
		
		function showSearchResults(results) {
			searchResults.innerHTML = '';
			
			if(results.length === 0){
				const noResults = document.createElement('p');
				noResults.textContent = '검색 결과가 없습니다';
				searchResults.appendChild(noResults);
			}else{
				results.forEach(result => {
					const searchResult = document.createElement('p');
					searchResult.textContent = 'No: ' + result.groundNo + ', Name: ' + result.groundName;
					searchResult.classList.add('search-result');
					searchResults.appendChild(searchResult);
					//클릭 이벤트 리스너 추가
					searchResult.addEventListener('click', (event) => {
						openModal(result);
					});
				});
			}
		}
		
		//모달 창 열기
		function openModal(result) {
			const modalContainer = document.querySelector('.modal-container');
			const modalContent = document.querySelector('.modal-content');
			//모달 내용 초기화

			$.ajax({
				url: `/free/schedule-search`,
				type: 'GET',
				data: { groundNo: result.groundNo },
				dataType: 'json',
				success: function(response) {
					const results = response;
				      console.log(results);
				      console.log(results[0].scheduleStart);
				       
					dateNav();
	
				   //닫기 버튼 추가
/* 				   const closeButton = document.createElement('span');
				   closeButton.classList.add('modal-close');
				   closeButton.textContent = '×';
				   closeButton.addEventListener('click', closeModal);
				   
				   modalContent.appendChild(closeButton); */
				   
				   modalContainer.style.display = 'block';
				},
				error: function(jqXHR, textStatus, errorThrown) {
			          console.log('주소 검색 요청에 실패하였습니다:', errorThrown);
			        }
			});
			//modalContainer.style.display = 'block';
		}
		
		function closeModal() {
			  const modalContainer = document.querySelector('.modal-container');
			  modalContainer.style.display = 'none';
			}
		
	
		
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
	});
</script>
</head>
<body>
	<div class="content" style="padding-top: 120px; box-sizing: border-box ">
		<form action="write" method="post" autocomplete="off">
			<div class="container-800">
				<div class="row">
					<label>제목<i class="fa-solid fa-asterisk"></i></label> <input
						type="text" name="freeTitle" required class="form-input w-100">
				</div>
				<div class="row">
					<label>경기 날짜<i class="fa-solid fa-asterisk"></i></label> <input
						type="date" name="freeDate" required class="form-input w-100">
				</div>

				<div class="search-container">
					<input type="text" id="address-input" class="search-input"
						placeholder="주소를 입력하세요">
					<div id="search-results" class="search-results"></div>
				</div>
				<!-- 모달 컨테이너 -->
				<div class="modal-container">
					<div class="modal--mask"></div>
					<!-- 모달 내용 -->
					<div class="modal--wrapper isBottom modal-stadium__wrapper">
						<div class="modal--header">
							<div class="modal-title">
								<div class="modal-stadium__header--facility"></div>
							</div>
							<p class="modal--close"></p>
						</div>
						<div class="modal--body modal-stadium_body">
							<div>
								<div class="stadium_info_container" style="padding: 0px">
									<div id="dateNav" class="sub-header"
										style="padding-bottom: 10px">
										<div class="post-slider">
											<div class="post-wrapper">
												<ul class="post-li">
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="row">
					<label>경기장번호<i class="fa-solid fa-asterisk"></i></label> <select
						name="groundNo" class="form-input">
						<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
						<option value="3">3</option>
						<option value="21">21</option>
					</select>
				</div>
				<div class="row">
					<label>일정<i class="fa-solid fa-asterisk"></i></label> <select
						name="scheduleNo" class="form-input">
						<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
						<option value="46">46</option>
					</select>
				</div>
				<div class="row">
					<label>성별<i class="fa-solid fa-asterisk"></i></label> <select
						name="freeGender" class="form-input">
						<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
						<option value="남자">남자</option>
						<option value="여자">여자</option>
						<option value="남녀모두">남녀모두</option>
					</select>
				</div>
				<div class="row">
					<label>매치규모<i class="fa-solid fa-asterisk"></i></label> <select
						name="freeSize" class="form-input">
						<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
						<option value="1vs1">1vs1</option>
						<option value="2vs2">2vs2</option>
						<option value="3vs3">3vs3</option>
					</select>
				</div>
				<div class="row">
					<label>요금<i class="fa-solid fa-asterisk"></i></label> <select
						name="freeFee" class="form-input">
						<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
						<option value="1000">1000원</option>
					</select>
				</div>
				<div class="row">
					<label>실력<i class="fa-solid fa-asterisk"></i></label> <select
						name="freeLevel" class="form-input">
						<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
						<option value="상">중 이상</option>
						<option value="중">하 이하</option>
						<option value="일반">일반</option>
					</select>
				</div>
				<div class="row">
					<label>필요인원<i class="fa-solid fa-asterisk"></i></label> <select
						name="freeNeedNum" class="form-input">
						<!-- 없음을 선택하면 값이 비어서 전송되므로 DB에 null로 들어감 -->
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
					</select>
				</div>
				<div class="row">
					<label>내용<i class="fa-solid fa-asterisk"></i></label>
					<textarea name="freeContent" required class="form-input w-100"
						style="min-height: 300px;"></textarea>
				</div>

				<div class="row">
					<button type="submit" class="form-btn positive w-100">등록</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>