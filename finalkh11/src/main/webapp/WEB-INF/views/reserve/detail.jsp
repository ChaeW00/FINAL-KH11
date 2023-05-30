<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

<!-- bootswatch CDN -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet">

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
			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="margin-top: 133px;">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  	</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/static/image/리아코.png" style="width:400px; height:200px;" class="d-block mx-auto">
				    </div>
				    <div class="carousel-item">
				      	<img src="/static/image/어니부기.png" style="width:400px; height:200px;" class="d-block mx-auto">
				    </div>
				    <div class="carousel-item">
				      	<img src="https://via.placeholder.com/400x200" style="width:400px; height:200px;" class="d-block mx-auto">
				    </div>
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
			
			<form action="order" method="post">
				<input type="hidden" value="${groundDto.groundNo}" name="groundNo">
				<div class="row mt-4">
					${groundDto.groundName}
				</div>
				<div class="row mt-4">
					${groundDto.groundBasicAddr} / 
					${groundDto.groundDetailAddr}				
				</div>
				<div class="row mt-4">
					${groundDto.groundSize}
				</div>
				<div class="mt-4">
					<i class="fa-solid fa-shower me-2"></i>${groundDto.groundShower}
				</div>
				<div class="mt-4">
					<i class="fa-solid fa-car me-2"></i>${groundDto.groundPark}
				</div>
				
				<h5 class="mt-4">시설 예약</h5>
				
				<!-- 날짜 -->
				<div class="row mt-4">
					<div class="col text-start">
						<button type="button" class="btn btn-secondary" :disabled="currentPage === 1" @click="previousPage" transition="fade">이전</button>
					</div>
					<div class="col-10 text-center">
						<span class="me-2 animate__animated animate__bounceIn" v-for="(date, index) in displayedDateList" :key="date">
						<button type="button" :class="getButtonClass(date)" :value="date" v-model="reserveDate" @click="selectDate(index); clickDate(reserveDate)"/>
						{{ formatDate(date) }}
						</span>
					</div>
					<div class="col text-end">
						<button type="button" class="btn btn-secondary" :disabled="currentPage === totalPages" @click="nextPage">다음</button>
					</div>
				</div>
				
				<input type="hidden" name="reserveDate" :value="reserveDate"/>
				<div class="form-check mt-4">
<%-- 					<c:forEach var="schedule" items="${scheduleList}"> --%>
<!-- 						<div class="row"> -->
<!-- 							<div class="text-center mt-2"> -->
<%-- 								<button type="submit" class="btn btn-outline-primary w-75 mt-1" value="${schedule.scheduleNo}" name="scheduleNo" :disabled="reserveDate === null">${schedule.scheduleStart} - ${schedule.scheduleEnd} (${groundDto.groundPrice} 원)</button> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
					<div v-for="(schedule, index) in scheduleList" :key="schedule.scheduleNo">
						<div class="row">
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-outline-dark w-75 mt-1" :disabled="reserveDate === null" name="scheduleNo" :value="schedule.scheduleNo">
									{{ schedule.scheduleStart }} - {{ schedule.scheduleEnd }} (${groundDto.groundPrice} 원)
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			
			<h5 class="mt-4">위치</h5>
				
			<input type="hidden" name="groundAddr" value="${groundDto.groundAddr}">
			<div class="row mt-4">
	        	<div class="map" style="width:100%; height:250px;"></div>
				<span>${groundDto.groundAddr}</span>
	        </div>
		        
			<h5 class="mt-4">예약 취소 및 환불 규정</h5>
		        
			<div class="row mt-4">
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
                console.log(scheduleNo); // 예시로 콘솔에 출력하도록 설정했습니다.
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
                const response = await axios.get("http://localhost:8080/ground/detail/" + this.reserveDate + "/" + this.groundNo);
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