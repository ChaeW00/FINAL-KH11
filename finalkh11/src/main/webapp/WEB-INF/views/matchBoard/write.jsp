<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
<div id="app" class="container mt-5 main-content">
	<div class="row">
            <div class="offset-md-2 col-md-8">
            <div class="row text-center">
                <div class="col bg-light p-4 rounded" style="margin-top:100px;">
                <h1>매칭 생성</h1>
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
                        <option value="07:00">07:00</option>
                        <option value="08:00">08:00</option>
                        <option value="09:00">09:00</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                        <option value="19:00">19:00</option>
                        <option value="20:00">20:00</option>
                        <option value="21:00">21:00</option>
                        <option value="22:00">22:00</option>
                        <option value="23:00">23:00</option>
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
        			<span>매치 인원 : </span>
    			</div>
    			<div class="col-md-7">
        			<select name="matchBoardSize" id="selectSize" class="form-select" v-model="matchSize">
            			<option value="3">3 vs 3</option>
            			<option value="4">4 vs 4</option>
            			<option value="5">5 vs 5</option>
            			<option value="6">6 vs 6</option>
        			</select>
    			</div>
			</div>
			<div class="row align-items-center mt-5">
    			<div class="col-md-3">
        			<span>팀명 : </span>
    			</div>
    			<div class="col-md-7">
        			<select name="teamNo" class="form-select" v-model="teamNo">
        				<option v-for="team in teamList" :value="team.teamNo">{{team.teamName}}</option>
					</select>
    			</div>
			</div>
			<div id="inputContainer" class="row align-items-center mt-5">
    			<div class="col-md-6 mt-4" v-for="n in size">
    				<span>참가자{{n}}</span>
    				<select class="form-select" v-model="selectedList[n-1]" v-if="n == 1">
    					<option :value="memberId">{{memberName}} ({{memberId}})</option>
    				</select>
    				<select class="form-select" v-model="selectedList[n-1]" v-else>
    					<option v-for="member in memberList" :value="member.memberId" :disabled="selectedList.includes(member.memberId)">{{member.memberName}} ({{member.memberId}})</option>
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
                <button class="btn btn-primary" v-on:click="write">완료</button>
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
            	memberId : memberId,
            	memberName : memberName,
            	matchTitle : '',
            	matchDate : '',
            	city:'서울',
            	location:'종로구',
            	matchTime : '',
            	matchAge : '',
            	matchSize : 1,
            	matchTime : '',
            	matchContent : '',
            	teamNo : '',
            	teamList : [],
            	cityList : ['서울','부산','대구','인천','광주','대전','울산','세종','경기','강원','충북','충남','전북','전남','경북','경남','제주'],
            	memberList : [],
            	selectedList : [],
            	boardNo : '',
            	matchNo : '',
            	entryNo : [],
            	today: new Date().toISOString().slice(0, 10),
            	oneMonthLater: new Date(new Date().setMonth(new Date().getMonth() + 1)).toISOString().slice(0, 10),
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
        	async loadTeamList(){
        		const url = contextPath + "/rest/team/teamList/" + memberId;
        		const resp = await axios.get(url);
        		this.teamList.push(...resp.data);
        		this.teamNo = this.teamList[0].teamNo;
        	},
        	
        	async loadMemberList(){
        		this.memberList = [];
        		const url = contextPath + "/rest/team/memberList/" + this.teamNo;
        		const resp = await axios.get(url);
        		this.memberList.push(...resp.data);
        	},
        	
        	async getMatchBoardSeq(){
        		const url = contextPath+"/rest/matchBoard/seq";
        		const resp = await axios.get(url);
        		this.boardNo = resp.data;
        	},
        	
        	async getMatchSeq(){
        		const url = contextPath+"/rest/matchBoard/match/seq";
        		const resp = await axios.get(url);
        		this.matchNo = resp.data;
        	},
        	
        	async getEntrySeq(){
        		for(let i = 0; i < this.size; i++){
	        		const url = contextPath+"/rest/matchBoard/entry/seq";
	        		const resp = await axios.get(url);
	        		this.entryNo.push(resp.data);
        		}
        	},
        	
        	async insertMatchBoard(){
        		await this.getMatchBoardSeq();
        		const url = contextPath+"/rest/matchBoard/";
        		const data = {
        				matchBoardNo : this.boardNo,
        				memberId : memberId,
        				matchBoardTitle : this.matchTitle,
        				matchBoardContent : this.matchContent,
        				matchBoardCity : this.city,
        				matchBoardLocation : this.location,
        				matchBoardDate : this.matchDate,
        				matchBoardTime2 : this.matchTime,
        				matchBoardAge : this.matchAge,
        				matchBoardSize : this.matchSize
        				}
        		await axios.post(url,data);
        		
        	},
        	
        	async insertMatch(){
        		await this.getMatchSeq();
        		const url = contextPath+"/rest/matchBoard/match";
        		const data = {
        				matchNo : this.matchNo,
        				matchCity : this.city,
        				matchLocation : this.location,
        				matchDate : this.matchDate,
        				matchTime : this.matchTime,
        				matchAge : this.matchAge,
        				matchSize : this.matchSize,
        				teamNo : this.teamNo,
        				matchBoardNo : this.boardNo
        				}
        		await axios.post(url,data);
        	},
        	
        	async insertEntry(){
        		await this.getEntrySeq();
        		const url = contextPath+"/rest/matchBoard/entry"
        		for(let i = 0; i<this.size; i++){
        			let entryNo = this.entryNo[i];
        			let selectMember = this.selectedList[i];
	       			const data = {
	       					entryNo : entryNo,
	       					matchNo : this.matchNo,
	       					teamNo : this.teamNo,
	       					memberId : selectMember,
	       					teamType : 'home'
	       				}
	       			await axios.post(url,data);
        			
        		}
        			
        	},
        	
        	async write(){
        		await this.insertMatchBoard();
        		await this.insertMatch();
        		await this.insertEntry();
        		window.location.href = contextPath + '/matchBoard/list';
        	},
        },
        
        watch:{
        	city : function(){
        		this.location = this.locationList[0];
        	},
        	
        	teamNo : function(){
        		this.loadMemberList();
        		this.selectedList = new Array(this.size);
        		this.selectedList[0] = memberId;
        	},
        	
        	matchSize : function(){
        		this.selectedList = new Array(this.size);
        		this.selectedList[0] = memberId;
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
        	this.loadTeamList();
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>