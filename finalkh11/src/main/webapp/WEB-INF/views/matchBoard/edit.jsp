<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="container mt-5">
	<div class="row">
            <div class="offset-md-2 col-md-8">
            <!-- 문서 제목 (Jumbotron) -->
            <div class="row text-center  main-content">
                <div class="col bg-dark text-light p-4 rounded">
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
                        <option value="11:00">10:00</option>
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
        			<select name="matchBoardSize" id="selectSize" class="form-select" v-model="matchSize" :disabled="waitExist">
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
        				<option v-for="team in teamList" :value="team.teamNo" :disabled="existTeam.includes(team.teamNo)">{{team.teamName}}</option>
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
    					<option v-for="member in memberList" :value="member.memberId" :disabled="selectedList.includes(member.memberId) || existMember.includes(member.memberId)">{{member.memberName}} ({{member.memberId}})</option>
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
                <button class="btn btn-primary" v-on:click="change">변경</button>
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
            	teamNoName : null,
            	teamList : [],
            	cityList : ['서울','부산','대구','인천','광주','대전','울산','세종','경기','강원','충북','충남','전북','전남','경북','경남','제주'],
            	memberList:[],
            	selectedList:[],
            	matchBoardNo : null,
            	matchNo : null,
            	entryNo : [],
            	homeNo : null,
            	waitExist : null,
            	existTeam: [],
            	existMember : [],
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
        	
        	async loadMatchBoardData(){
        		const url = contextPath + "/rest/matchBoard/" + this.matchBoardNo;
        		const resp = await axios.get(url);
        		
        		this.matchTitle = resp.data.matchBoardTitle;
				this.matchContent = resp.data.matchBoardContent;
				this.city = resp.data.matchBoardCity;
				this.location = resp.data.matchBoardLocation;
				this.matchDate = resp.data.matchBoardDate;
				this.matchTime = resp.data.matchBoardTime2;
				this.matchAge = resp.data.matchBoardAge;
				this.matchSize = resp.data.matchBoardSize;
        	},
        	
        	async loadMatchData(){
        		const url = contextPath + "/rest/matchBoard/match/" + this.matchBoardNo;
        		const resp = await axios.get(url);
        		this.homeNo = resp.data.teamNo;
        		this.teamNo = resp.data.teamNo;
        		this.matchNo = resp.data.matchNo;
        		this.loadEntryList(resp.data.matchNo);
        	},
        	
        	async loadEntryList(matchNo){
        		const url = contextPath + "/rest/matchBoard/entry/" + this.matchNo;
        		const resp = await axios.get(url);
        		let cnt = 0;
      		  	resp.data.forEach(entry => {
      		    	if(entry.teamType === "home"){
		      		    this.selectedList[cnt] = entry.memberId;
		      		    cnt++;
      		    	}
      		    	else{
      		    		if(!this.existTeam.includes(entry.teamNo)) this.existTeam.push(entry.teamNo);
          		  		if(!this.existMember.includes(entry.memberId)) this.existMember.push(entry.memberId);
          		  		
      		    		this.waitExist = true;
      		    	} 
      		    		
   		 		});
        	},
        	
        	async updateMatchBoard(){
        		const url = contextPath+"/rest/matchBoard/";
        		const data = {
        				matchBoardNo : this.matchBoardNo,
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
        		await axios.put(url, data);
        	},
        	
        	async updateMatch(){
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
        				matchBoardNo : this.matchBoardNo
        				}
        		await axios.put(url,data);
        	},
        	
        	async deleteHome(){
        		const url = contextPath + "/rest/matchBoard/entry/" + this.matchNo + "/" + this.homeNo + "/home";
        		await axios.delete(url);
        	},

        	async getEntrySeq(){
        		for(let i = 0; i < this.size; i++){
	        		const url = contextPath+"/rest/matchBoard/entry/seq";
	        		const resp = await axios.get(url);
	        		this.entryNo.push(resp.data);
        		}
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
        	
        	async change(){
        		await this.updateMatchBoard();
        		await this.updateMatch();
        		await this.deleteHome();
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
        	}
        },
        
        mounted(){
        },
        
        created(){
        	let uri = window.location.search.substring(1); 
            let params = new URLSearchParams(uri);
            this.matchBoardNo = params.get("matchBoardNo");
        	this.loadTeamList();
            this.loadMatchBoardData();
            this.loadMatchData();
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>