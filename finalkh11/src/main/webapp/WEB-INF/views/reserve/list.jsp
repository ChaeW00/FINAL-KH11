<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	a {
		text-decoration-line: none;
	}
	.price {
	  font-size: 30px;
	  font-weight: bold;
	  color: #333;
	}
	
	.address {
	  margin-top: 10px;
	  font-size: 24px;
	  color: #555;
	}
	
	.details {
	  margin-top: 4px;
	  font-size: 20px;
	  color: #888;
	}
	
	.details span {
	  margin-right: 10px;
	}
	.ground-link {
	  font-size: 24px;
	  color: #0366d6;
	  text-decoration: none;
	  transition: color 0.3s ease-in-out;
	}
	.ground-link:hover {
	  color: #044289;
	}
</style>
    
<title>구장 목록</title>

<div id="app" class="main-content d-flex container-fluid mt-4 justify-content-center" style="margin-bottom:120px;">
	<div class="row col-7">
		<div class="row">
			<div class="col-3 mt-3">
				<select class="form-select" v-model="selectedLocation">
					<option value="" selected>지역을 선택해주세요</option>
					<option v-for="location in locationList" :value="location">{{location}}</option>
				</select>
			</div>
			<div class="col-2 mt-3">
				<input type="date" class="form-control" v-model="selectedDate" @change="loadSchedules(reserveDate, groundNo)">
			</div>
			<!-- 관리자 기능 -->
			<c:if test="${memberLevel == '관리자'}">
				<div class="col-7 mt-3 d-flex justify-content-end">
					<a href="/ground/insert" class="btn btn-lg btn-primary"><i class="fa-solid fa-plus me-2"></i>등록</a>
				</div>
			</c:if>
		</div>
    	<div class="mt-4" v-for="(ground, index) in filteredGroundList" v-bind:key="ground.groundNo" style="background-color:white;">
    		<div id="carouselExampleSlidesOnly" class="carousel slide mt-4" data-bs-interval="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" v-for="(groundImg, index) in imgList" v-bind:key="ground.groundNo">
						<img v-if="groundImg.groundDto.groundNo === ground.groundNo" 
						:src="'/img/download/' + groundImg.imgDto.imgNo" width="400" height="300">
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<a :href="'detail?groundNo=' + ground.groundNo" class="ground-link">{{ground.groundName}}</a>
			</div>
			<!-- 관리자 기능 -->
			<c:if test="${memberLevel == '관리자'}">
			<div class="d-flex justify-content-end">
				<div class="text-right">
					<a :href="'edit/' + ground.groundNo" class="btn btn-lg btn-info me-3"><i class="fa-solid fa-pen-to-square me-2"></i>수정</a>
					<a :href="'delete/' + ground.groundNo" onclick="return confirm('정말 삭제하시겠습니까?')" class="btn btn-lg btn-danger"><i class="fa-solid fa-trash me-2"></i>삭제</a>
				</div>
			</div>
			</c:if>
			<div>
				<span class="price">{{ground.groundPrice}} 원 / 시간</span>
			</div>
			<div class="address">
				<span class="me-2">{{ground.groundBasicAddr}}</span>
				<span>{{ground.groundDetailAddr}}</span>
			</div>
			<div class="details mb-3">
				<span>{{ground.groundSize}}</span>
				<span v-if="ground.groundShower != null">
				{{ground.groundShower}}</span>
				<span>{{ground.groundPark}}</span>
			</div>
			<div class="mt-5">
				<h5>이용 가능한 시간</h5>
			</div>
			<hr>
			<span v-for="schedule in scheduleList" :key="schedule.scheduleNo">
				<div class="mb-2" v-if="schedule.groundNo == ground.groundNo">
					<div class="schedule-info">
						<div class="schedule-time">
							<i class="fas fa-clock me-1"></i> {{schedule.scheduleStart}} - {{schedule.scheduleEnd}}
						</div>
					</div>
				</div>
			</span>
        </div>
    </div>
</div>

<script>
    Vue.createApp({
        data(){
            return {
            	locationList: ["서울", "경기", "인천", "충북", "충남", "대구", "부산", "제주", "전북", "전남", "강원"],
            	selectedLocation: "",
            	scheduleList: [],
            	imgList: [],
            	selectedDate: "",
            	groundNos: [<c:forEach var="groundDto" items="${list}" varStatus="status">
            				${groundDto.groundNo}${not status.last ? ',' : ''}</c:forEach>],
            	
                percent: 0,

                //목록을 위한 데이터
                page:1,
                groundList:[],
                finish:false,

                //안전장치
                loading:false
            };
        },
        computed:{
            
        },
        methods:{
            async loadList(){
                if(this.loading == true) return;//로딩중이면
                if(this.finish == true) return;//다 불러왔으면

                this.loading = true;
                
                const response = await axios.get(contextPath+"/rest/ground/list/page/" + this.page);
                this.groundList.push(...response.data);
                this.page++;
				
                this.loading = false;
				
                if(response.data.length < 10) {//데이터가 10개 미만이면 종료
                    this.finish = true;
                }
            },
            async groundImageList() {
			    const groundNos = this.groundNos;
			    groundNos.forEach(async (groundNo) => {
					const url = contextPath + "/rest/ground/groundImageList/" + groundNo;
					
					try {
						const response = await axios.get(url);
						this.imgList.push(...response.data);
					}
					catch (error) {
					    console.error(error);
					}
				});
			},
            async loadSchedules(){
            	this.scheduleList = [];
				
				const groundNos = this.groundNos;
				const selectedDate = this.selectedDate;

				groundNos.forEach(async (groundNo) => {
					const url = contextPath + "/rest/ground/list/" + this.selectedDate + "/" + groundNo;
					
					try {
						const response = await axios.get(url);
						this.scheduleList.push(...response.data);
					}
					catch (error) {
					    console.error(error);
					}
				});
            },
            async loadFirstSchedules(){
				this.scheduleList = [];
				
				const groundNos = this.groundNos;

				groundNos.forEach(async (groundNo) => {
					const currentDate = new Date().toISOString().split('T')[0];
					const url = contextPath+"/rest/ground/list/" + currentDate + "/" + groundNo;

					try {
						const response = await axios.get(url);
						this.scheduleList.push(...response.data);
					}
					catch (error) {
						console.error(error);
					}
				});
            },
        },
        watch:{
            //percent가 변하면 percent의 값을 읽어와서 80% 이상인지 판정
            percent(){
                if(this.percent >= 80) {
                    this.loadList();
                }
            }
        },
        computed: {
			filteredGroundList() {
				if (this.selectedLocation === "") {
					return this.groundList; // 선택된 지역이 없을 때 모든 리스트를 반환
				} 
				else {
					return this.groundList.filter(ground => ground.groundBasicAddr.includes(this.selectedLocation));
				}
			},
        },
        mounted(){
            window.addEventListener("scroll", _.throttle(()=>{
                const height = document.body.clientHeight - window.innerHeight;
                const current = window.scrollY;
                const percent = (current / height) * 100;

                //data의 percent를 계산된 값으로 갱신
                this.percent = Math.round(percent);
            }, 250));
        },
        created(){
            this.loadList();
            this.groundImageList();
            this.loadFirstSchedules();
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>