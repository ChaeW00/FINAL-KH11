<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
<div id="app" class="container mt-5">
	<div class="row">
            <div class="offset-md-2 col-md-8">
            <!-- 문서 제목 (Jumbotron) -->
            <div class="row text-center">
                <div class="col bg-dark text-light p-4 rounded" style="margin-top:25%;">
                <h1>매칭 수정</h1>
                </div>
            </div>
            
            <div class="row align-items-center mt-5">
                <div class="col-md-2">
                    <span class="form-span">제목 : </span>
                </div>
                <div class="col-md-8">   
                    <input type="text" class="form-control" v-model="matchTitle">
                </div>
            </div>
            
            <div class="row align-items-center mt-5">
                <div class="col-md-5">
                    <span>도시 선택 : </span>
                </div>
                <div class="col-md-5">
                    <select name="matchBoardCity" class="form-select" v-model="city">
                        <option v-for="city in cityList" :value="city">{{city}}</option>
                    </select>
                </div>

            </div>
            <div class="row align-items-center mt-5">
                <div class="col-md-5">
                    <span>상세지역 선택 : </span>
                </div>
                <div class="col-md-5">
                    <select name="matchBoardLocation" class="form-select" v-model="location">
						<option v-for="location in locationList" :value="location">{{location}}</option>
                    </select>
                </div>
            </div>
            <div class="row align-items-center mt-5">
                <div class="col-md-3">
                    <span>매치 날짜 : </span>
                </div>
                <div class="col-md-7">
                    <input type="Date" class="form-control" v-model="matchDate">
                </div>
            </div>
            <div class="row align-items-center mt-5">
                <div class="col-md-3">
                    <span>매치 시간 : </span>
                </div>
                <div class="col-md-7">
                    <select class="form-select" v-model="matchTime">
                        <option value="06:00">06:00</option>
                        <option value="08:00">08:00</option>
                        <option value="10:00">10:00</option>
                        <option value="12:00">12:00</option>
                        <option value="14:00">14:00</option>
                        <option value="16:00">16:00</option>
                        <option value="18:00">18:00</option>
                        <option value="20:00">20:00</option>
                        <option value="22:00">22:00</option>
                    </select>
                </div>
            </div>
            <div class="row align-items-center mt-5">
                <div class="col-md-3">
                    <span>매치 연령대 : </span>
                </div>
                <div class="col-md-7">
                    <select class="form-select" v-model="matchAge">
                        <option value="10">10대</option>
                        <option value="20">20대</option>
                        <option value="30">30대</option>
                        <option value="40">40대</option>
                        <option value="50">50대</option>
                        <option value="60">60대</option>
                    </select>
                </div>
            </div>
			<div class="row align-items-center mt-5">
				<div class="col-md-3">
					<span>내용<i class="fa-solid fa-asterisk"></i></span>
				</div>
				<div class="col-md-7">
					<textarea v-model="matchContent" required class="form-control w-100" style="min-height: 300px;"></textarea>
				</div>
			</div>
            
            <div class="row align-items-center mt-5">
                <button class="btn btn-primary" v-on:click="edit">완료</button>
            </div>
            <div class="row align-items-center mt-2 mb-5">
                <a href="/matchBoard/list" class="btn btn-secondary">목록으로</a>
            </div>

           </div>
	</div>
</div>
    
    <script>
    Vue.createApp({
        data(){
            return {
            	matchBoardNo : '${matchBoardDto.matchBoardNo}',
            	memberId : memberId,
            	matchTitle : '${matchBoardDto.matchBoardTitle}',
            	matchDate : '${matchBoardDto.matchBoardDate}',
            	city:'${matchBoardDto.matchBoardCity}',
            	location:'${matchBoardDto.matchBoardLocation}',
            	matchTime : '${matchBoardDto.matchBoardTime2}',
            	matchAge : '${matchBoardDto.matchBoardAge}',
            	matchContent : '${matchBoardDto.matchBoardContent}',
            	cityList : ['서울','부산','대구','인천','광주','대전','울산','세종','경기','강원','충북','충남','전북','전남','경북','경남','제주'],
            };
        },
        
        computed:{
       		locationList() {
       			if(this.city == '서울')
       				return ['종로구','중구','용산구'];
       			else if(this.city == '부산')
       				return ['중구','서구','동구'];
       			else if(this.city == '대구')
       				return ['중구','서구','동구'];
       			else if(this.city == '인천')
       				return ['중구','서구','동구'];
       			else if(this.city == '광주')
       				return ['중구','서구','동구'];
       			else if(this.city == '대전')
       				return ['중구','서구','동구'];
       			else if(this.city == '울산')
       				return ['중구','서구','동구'];
       			else if(this.city == '세종')
       				return ['중구','서구','동구'];
       			else if(this.city == '경기')
       				return ['중구','서구','동구'];
       			else if(this.city == '강원')
       				return ['중구','서구','동구'];
       			else if(this.city == '충북')
       				return ['중구','서구','동구'];
       			else if(this.city == '충남')
       				return ['중구','서구','동구'];
       			else if(this.city == '전북')
       				return ['중구','서구','동구'];
       			else if(this.city == '전남')
       				return ['중구','서구','동구'];
       			else if(this.city == '경북')
       				return ['중구','서구','동구'];
       			else if(this.city == '경남')
       				return ['중구','서구','동구'];
       			else
       				return['제주시','서귀포시'];
       		},
       		size() {
       			return Number(this.matchSize);
       		},
        },
        
        methods:{
        	async edit(){
        		
        	}
        },
        
        watch:{
        	city : function(){
        		this.location = this.locationList[0];
        	},
        	
        	matchDate : function(){
        		if(this.matchDate < this.today || this.matchDate > this.oneMonthLater){	
        			this.matchDate = '';
        			alert("현재 날짜보다 이전이거나, 한 달 이외의 날짜는 선택이 불가능합니다.");
        		}
        	},
        	
        },
        
        mounted(){
        	
        },
        
        created(){
        	
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>