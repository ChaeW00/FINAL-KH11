<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 카카오맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=30793f867a8e7d238c5db229c3254f87&libraries=services"></script>
<script>
	$(function(){ 
	    var mapContainer = document.querySelector('.map');
	    
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		map.setDraggable(false);
		map.setZoomable(false);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($("[name=groundAddr]").val(), function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		    	var lat = result[0].y;
		    	var lng = result[0].x;
		        coords = new kakao.maps.LatLng(lat, lng);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            clickable:true
		        });
				
		        var mLabel = new kakao.maps.InfoWindow({
		            map: map,
		            position: coords,
		            content: '마커를 클릭하여 길찾기'
		        });
		        
		        mLabel.open(map, marker);
		        
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
		        kakao.maps.event.addListener(marker, 'click', function(mouseEvent){
		    		window.open("https://map.kakao.com/link/to/" + "도착지," + lat + "," + lng);
		    	});
		        
		    } 
		});
	});
</script>

<title>${groundDto.groundName} 시설 정보</title>

<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-7">
		<div style="background-color:#F8FAFB;">
			<div class="d-flex container-fluid mt-4 justify-content-center">
				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true" style="margin-top:100px;">
				
					<div class="carousel-indicators" >
						<c:forEach var="groundImg" items="${imgList}" varStatus="status">
							<button type="button" data-bs-target="#carouselExampleIndicators" 
								data-bs-slide-to="${status.index}"<c:if test="${status.index == 0}"> class="active" aria-current="true"</c:if> 
								aria-label="Slide ${status.index + 1}">
							</button>
						</c:forEach>
					</div>
					
					<div class="carousel-inner">
						<c:choose>
							<c:when test="${imgList.size() == 0}">
								<div class="carousel-item active">
				       				<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy01.png" width="600" height="250">
				       			</div>
					   			<div class="carousel-item">
					       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy02.png" width="600" height="250">
					       		</div>
								<div class="carousel-item">
					       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy03.png" width="600" height="250">
					       		</div>
				   			</c:when>
					   		<c:otherwise>
								<c:forEach var="groundImg" items="${imgList}" varStatus="status">
									<div class="carousel-item<c:if test="${status.index == 0}"> active</c:if>">
										<img src="/img/download/${groundImg.imgNo}" class="slide-img" alt="메인 슬라이드 이미지" width="800" height="350">
								    </div>
								</c:forEach>
					   		</c:otherwise>
						</c:choose>
					</div>
					
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
					
				</div>
			</div>
			
			<form action="order" method="post">
				<div class="ms-4">
				<input type="hidden" value="${groundDto.groundNo}" name="groundNo">
				<div class="row mt-4">
				  <div class="col">
				    <h4 class="mb-0">${groundDto.groundName}</h4>
					<!-- 관리자 기능 -->
					<c:if test="${memberLevel == '관리자'}">
						<div class="d-flex justify-content-end">
							<div class="text-right">
								<a :href="'edit/' + groundNo" class="btn btn-info btn-lg me-3"><i class="fa-solid fa-pen-to-square me-2"></i>수정</a>
								<a :href="'delete/' + groundNo" onclick="return confirm('정말 삭제하시겠습니까?')" class="btn btn-lg btn-danger me-5"><i class="fa-solid fa-trash me-2"></i>삭제</a>
							</div>
						</div>
					</c:if>
				  </div>
				</div>
				<div class="row mt-4">
				  <div class="col">
				    <p class="mb-0">${groundDto.groundBasicAddr} / ${groundDto.groundDetailAddr}</p>
				    <p class="mb-0">${groundDto.groundAddr}</p>
				  </div>
				</div>
				<div class="row mt-4">
				  <div class="col">
				    <p class="mb-0">${groundDto.groundSize}</p>
				  </div>
				</div>
				<div class="row mt-4">
				  <div class="col">
				    <i class="fa-solid fa-shower me-2"></i>
				    <span id="groundShowerText">${groundDto.groundShower}</span>
				  </div>
				</div>
				<div class="row mt-4 mb-5 me-3">
				  <div class="col">
				    <i class="fa-solid fa-car me-2"></i>
				    <span id="groundParkText">${groundDto.groundPark}</span>
					<hr class="mt-5">		
				  </div>
				</div>
				</div>
				<h2 class="mt-4 ms-4 mb-4">시설 예약</h2>
				
				<!-- 날짜 -->
				<div class="row mt-5">
					<div class="col ms-5 text-start">
						<button type="button" class="btn btn-secondary btn-lg" :disabled="currentPage === 1" @click="previousPage" transition="fade">이전</button>
					</div>
					<div class="col-md-8 text-center">
						<span class="me-2 animate__animated animate__bounceIn" v-for="(date, index) in displayedDateList" :key="date">
						<button type="button" :class="getButtonClass(date)" :value="date" v-model="reserveDate" @click="selectDate(index); clickDate(reserveDate)"/>
						{{formatDate(date)}}
						</span>
					</div>
					<div class="col me-5 text-end">
						<button type="button" class="btn btn-secondary btn-lg" :disabled="currentPage === totalPages" @click="nextPage">다음</button>
					</div>
				</div>
				
				<input type="hidden" name="reserveDate" :value="reserveDate"/>
				<div class="form-check mt-4">
					<div v-for="(schedule, index) in scheduleList" :key="schedule.scheduleNo">
						<div class="row">
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-outline-dark w-50 mt-1" :disabled="reserveDate === null" name="scheduleNo" :value="schedule.scheduleNo">
									{{ schedule.scheduleStart }} - {{ schedule.scheduleEnd }} (${groundDto.groundPrice} 원)
								</button>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="reserveDate" value="${reserveDate}" />
				<input type="hidden" name="scheduleNo" value="${scheduleNo}" />
			</form>
			
			<hr class="mt-5 ms-4 me-4 mb-5">
			
			<h2 class="mt-4 ms-4 mb-5">위치</h2>
				
			<input type="hidden" name="groundAddr" value="${groundDto.groundAddr}">
			<div class="row mt-4 p-5">
	        	<div class="map" style="width:100%; height:250px;"></div>
				<span class="mt-3 mb-2">${groundDto.groundAddr}</span>
	        </div>
		    <hr class="mt-5 ms-4 me-4 mb-5">
			<h2 class="ms-4 mt-4">예약 취소 및 환불 규정</h2>
			
			<div class="row mt-4 ms-4">
				<div class="stadium-section__body">
					<div class="stadium-terms">
						<div class="stadium-terms__title">일반</div>
						<ul class="stadium-terms__list">
			          		<li>7일 전 취소 시 100% 환불</li>
			          		<li>5일 전 취소 시 80% 환불</li>
			          		<li>3일 전 취소 시 50% 환불</li>
			          		<li>2일 전 ~ 예약 당일 환불 불가</li>
							<li>캐시는 규정에 따라 자동 환급되며 잔액 환불 희망 시 나의 충전 내역에서 신청바랍니다</li>
			        	</ul>
					</div>
					<div class="stadium-terms">
						<div class="stadium-terms__title">천재지변</div>
							<ul class="stadium-terms__list">
								<li>당일 천재지변으로 인해 구장 이용이 불가한 경우 100% 환불</li>
								<li>적용기준: 호우경보, 대설경보, 태풍주의보, 태풍경보</li>
							</ul>
				    </div>
				    <div class="stadium-terms">
			      	<div class="stadium-terms__title">우천시 변경 기준</div>
				        <ul class="stadium-terms__list">
				          	<li>시간 당 5mm 이상 시 날짜 변경 가능</li>
				          	<li>기준: 당일 이용 2시간 전 기상청 날씨누리 해당 주소지 기준</li>
							<li>단순 변심에 의한 날짜 변경은 불가</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		const groundShowerText = document.getElementById('groundShowerText');
		if (groundShowerText.innerText.trim() === "null" || groundShowerText.innerText.trim() === "") {
			groundShowerText.innerHTML = '<del>샤워장 없음</del>';
		}
	});
	
	document.addEventListener("DOMContentLoaded", function() {
		const groundShowerText = document.getElementById('groundParkText');
		if (groundParkText.innerText.trim() === "null" || groundShowerText.innerText.trim() === "") {
			groundParkText.innerHTML = '<del>주차장 없음</del>';
		}
	});
</script>

<script>
    Vue.createApp({
        data(){
            return {
                currentDate: new Date(),
                endDate: null,
                dateList: [],
                reserveDate: null,
                scheduleNo: null,
                itemsPerPage: 7,
                currentPage: 1,
                scheduleList: [],
                groundNo: ${groundDto.groundNo},
            };
        },
        mounted() {
            this.endDate = new Date(this.currentDate.getTime() + 30 * 24 * 60 * 60 * 1000);
            this.generateDateList();
            this.updateDisplayedDateList();
        },
        methods:{
            generateDateList() {
                const start = new Date(this.currentDate);
                const end = new Date(this.endDate);

                while (start <= end) {
                  this.dateList.push(start.toISOString().split('T')[0]);
                  start.setDate(start.getDate() + 1);
                }
            },
            updateDisplayedDateList() {
                const startIndex = (this.currentPage - 1) * this.itemsPerPage;
                const endIndex = startIndex + this.itemsPerPage;
                this.displayedDateList = this.dateList.slice(startIndex, endIndex);
            },
            formatDate(date) {
                const options = {day: 'numeric', weekday: 'short'};
                const formattedDate = new Date(date).toLocaleDateString('ko-KR', options);
                return formattedDate;
            },
            selectDate(index) {
                const date = this.displayedDateList[index];
                this.reserveDate = date;
            },
            getButtonClass(date) {
                const day = new Date(date).getDay();
                if (day === 0) {
                    return 'btn btn-outline-danger';
                } else if (day === 6) {
                    return 'btn btn-outline-primary';
                } else {
                    return 'btn btn-outline-dark';
                }
            },
            returnScheduleNo(scheduleNo) {
                this.scheduleNo = scheduleNo;
                console.log(scheduleNo);
			},
            previousPage() {
            if (this.currentPage > 1) {
                this.currentPage--;
                this.updateDisplayedDateList();
                }
            },
            nextPage() {
                const totalPages = Math.ceil(this.dateList.length / this.itemsPerPage);
                if (this.currentPage < totalPages) {
                    this.currentPage++;
                    this.updateDisplayedDateList();
                }
            },
            async clickDate(reserveDate, groundNo){
            	this.scheduleList = [];
                const response = await axios.get(contextPath + "/rest/ground/detail/" + this.reserveDate + "/" + this.groundNo);
				this.scheduleList.push(...response.data);
			}
        },
        computed: {
            totalPages() {
                return Math.ceil(this.dateList.length / this.itemsPerPage);
            }
        },
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>