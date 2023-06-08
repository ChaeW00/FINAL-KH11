<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<title>구장 목록</title>

<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-7" style="margin-top: 133px; background-color:#F8FAFB;">
		<div class="col-2 mt-2">
			<select class="form-select" v-model="selectedLocation">
				<option value="" selected>선택해주세요</option>
				<option v-for="location in locationList" :value="location">{{location}}</option>
			</select>
		</div>
		<div class="col-3 mt-2">
			<input type="date" v-model="selectedDate" @change="loadSchedules(reserveDate, groundNo)">
		</div>
    	<div class="mt-2" v-for="(ground, index) in filteredGroundList" v-bind:key="ground.groundNo" style="background-color:white;">
			<div class="mt-4">
				<img src="https://placeholder.com/100x100?example_img">
			</div>
			<div class="row mt-4">
				<a :href="'detail?groundNo=' + ground.groundNo">{{ground.groundName}}</a>
				<a :href="'edit/' + ground.groundNo">수정</a>
				<a :href="'delete/' + ground.groundNo">삭제</a>
			</div>
			<div class="mt-2">{{ground.groundPrice}} 원 / 시간</div>
			<div>{{ground.groundBasicAddr}} {{ground.groundDetailAddr}}</div>
			<div>{{ground.groundSize}} | {{ground.groundShower}} | {{ground.groundPark}}</div>
			<div class="mt-2">
				이용 가능한 시간
			</div>
			<hr>
			<span v-for="schedule in scheduleList" :key="schedule.scheduleNo">
				<div class="mb-2" v-if="schedule.groundNo == ground.groundNo">
					{{schedule.scheduleStart}} - {{schedule.scheduleEnd}}
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
                
                const response = await axios.get("http://localhost:8080/rest/ground/list/page/" + this.page);
                this.groundList.push(...response.data);
                this.page++;
				
                this.loading = false;
				
                if(response.data.length < 10) {//데이터가 10개 미만이면 종료
                    this.finish = true;
                }
            },
            async loadSchedules(){
            	this.scheduleList = [];
				
				const groundNos = this.groundNos;
				const selectedDate = this.selectedDate;

				groundNos.forEach(async (groundNo) => {
					const url = "http://localhost:8080/rest/ground/list/" + this.selectedDate + "/" + groundNo;
					
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
					const url = "http://localhost:8080/rest/ground/list/" + currentDate + "/" + groundNo;

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
            this.loadFirstSchedules();
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>