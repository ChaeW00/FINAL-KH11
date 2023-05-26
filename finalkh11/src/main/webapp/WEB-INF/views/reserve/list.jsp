<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<title>구장 목록</title>

<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-7" style="margin-top: 133px; background-color:#F8FAFB;">
		<div class="col-7 mt-2">
			<select v-model="selectedLocation">
				<option value="" selected>선택해주세요</option>
				<option v-for="location in locationList" :value="location">{{location}}</option>
			</select>
		</div>
		
		<div v-for="ground in filteredGrounds" :key="ground.id">
			{{ ground.groundBasicAddr }}, {{ ground.groundDetailAddr }}
		</div>
		
    	<div class="mt-2" v-for="(ground, index) in groundList" v-bind:key="ground.groundNo" style="background-color:white;">
			<div class="mt-4">
				<img src="https://placeholder.com/100x100?example_img">
			</div>
			<div class="row mt-4">
			  <a :href="'detail?groundNo=' + ground.groundNo">{{ground.groundName}}</a>
			</div>
			<div class="mt-3">{{ground.groundPrice}} 원 / 시간</div>
			<div>{{ground.groundBasicAddr}} {{ground.groundDetailAddr}}</div>
			<div>{{ground.groundSize}} | {{ground.groundShower}} | {{ground.groundPark}}</div>
        </div>
    </div>
</div>

<script>
    Vue.createApp({
        data(){
            return {
            	locationList: ["서울", "경기", "인천", "충북", "충남", "대구", "부산", "제주", "전북", "전남", "강원"],
            	selectedLocation: "",
            	
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
                
                const response = await axios.get("http://localhost:8080/ground/list/page/" + this.page);
                console.log(response);
                this.groundList.push(...response.data);
                this.page++;
				
                this.loading = false;
				
                if(response.data.length < 10) {//데이터가 10개 미만이면 종료
                    this.finish = true;
                }
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
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>