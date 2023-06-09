<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/cosmo/bootstrap.min.css">
 
<style>
	.center-align{
		text-align: center;
	}
	
	.custom-container {
		width:66.67%;
		margin: 0 auto;
	}
	
	.row {
		margin: 0 auto;
		mt: 2px;
	}
	
	.reply-item {
		font-size:20px;
		padding:1em;
	}
	
	.ms-20 {
    	margin-left: 20px;
    	cursor: pointer;
	}

	.ms-10 {
    	margin-left: 10px;
    	cursor: pointer;
	}
	
	.author {
		display: inline-block;
    	padding: 2px 6px;
    	border: 1px solid red;
    	border-radius: 4px;
    	color: red;
	}
	
	.box {
    	border: 1px solid;
    	min-height : 5em;
    }
    	
    .panel {
    	text-align: center;
    }
    
    .profile {
    	width : 80px;
    	height : 80px;
    }
</style>


<div id="app" class="container-fluid mt-4 custom-container">
	<div class="row mt-5">
		<h1 class="center-align">모집글 게시판</h1>
	</div>
	<hr>
	<div class="row">
		<h2>[{{matchBoardData.matchBoardStatus}}]{{matchBoardData.matchBoardTitle}}</h2>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-11">
			<h4>{{matchBoardData.memberName}} {{matchBoardData.matchBoardTime}} 조회수 : {{matchBoardData.matchBoardRead}}</h4>
		</div>
		<div class="col-md-1">
			<a class="btn btn-light mt-2" href="/matchBoard/list">목록</a>
		</div>
	</div>
	<hr>
	<div class="row" style="min-height:200px;">
		<div class="row">
			{{matchBoardData.matchBoardContent}}
		</div>
	</div>
	<div class="row">
	<h3 class="panel">Home Team</h3>
	<div class="box">
		<div class="row align-items-center mt-4">
			<h3>팀 이름 : {{matchData.homeName}} (전적 : {{homeWin}}승 {{homeLose}}패)</h3>
			<div class="col-md-3" v-for="entry in entryList">
				<div><img :src="entry.profile" class="profile"></div>
				<h4>{{entry.memberName}}</h4>
				<h6>({{entry.memberId}})</h6>
				<h5>{{entry.memberManner}}</h5>
   			</div>
		</div>
	</div>
	</div>
	<hr>
	<div class="row mt-4">
		<p>매치 정보 : {{matchBoardData.matchBoardCity}} {{matchBoardData.matchBoardLocation}} {{matchBoardData.matchBoardDate}} {{matchBoardData.matchBoardTime2}} {{matchBoardData.matchBoardAge}}대 {{matchBoardData.matchBoardSize}}vs{{matchBoardData.matchBoardSize}}</p>
	</div>
	<hr>
    		<div class="row">
      			<div class="col-md-6">
      				<h3 class="panel rest">참가 대기</h3>
      				<div class="box">
      					<div class="row" v-for="waitTeam in waitList">
      						<p> 팀 이름 : {{waitTeam[0].teamName}} (전적 : {{waitTeam[0].teamWin}}승 {{waitTeam[0].teamLose}}패)</p>
      						<div class="col-md-3" v-for="waitEntry in waitTeam">
      								<div><img :src="waitEntry.profile" class="profile"></div>
									<h4>{{waitEntry.memberName}}</h4>
									<h6>({{waitEntry.memberId}})</h6>
									<h5>{{waitEntry.memberManner}}</h5>
      						</div>
      						<div class="row justify-content-end mb-2" >
      							<button class="btn btn-primary col-auto me-2" v-on:click="showConfirmModal(waitTeam[0].teamNo)" v-if="owner">수락</button>
      							<button class="btn btn-primary col-auto me-2" v-on:click="showChangeModal(waitTeam[0].teamNo)" v-if="memberId == waitTeam[0].memberId">변경</button>
      							<button class="btn btn-danger col-auto me-2" v-on:click="showCancelModal(waitTeam[0].teamNo)" v-if="memberId == waitTeam[0].memberId">삭제</button>
      						</div>
      						<hr>
      					</div>
      				</div>
      			</div>
      		
      			<div class="col-md-6">
        			<h3 class="panel away">Away Team</h3>
        			<div class="box">
        				<div class="row" >
        					<p v-if="awayList.length > 0"> 팀 이름 : {{awayList[0].teamName}} (전적 : {{awayList[0].teamWin}}승 {{awayList[0].teamLose}}패)</p>
      						<div class="col-md-3" v-for="(awayEntry,idx) in awayList">
      							<div><img :src="awayEntry.profile" class="profile"></div>
								<h4>{{awayEntry.memberName}}</h4>
								<h6>({{awayEntry.memberId}})</h6>
								<h5>{{awayEntry.memberManner}}</h5>
      						</div>
      						<div class="row justify-content-end mb-2" v-if="awayList.length > 0">
      							<button class="btn btn-primary col-auto me-2" v-on:click="showChangeModal(awayList[0].teamNo)" v-if="memberId == awayList[0].memberId">변경</button>
      						</div>
      					</div>
        			</div>
      			</div>
    		</div>
    		
    		
    		<div class="row mt-4" v-if="!owner && matchBoardData.matchBoardStatus =='모집중' && !isInclude">
      			<div class="col-md-6">
        			<button class="btn btn-primary w-100" v-on:click="showJoinModal">참가신청</button>
        		</div>
    		</div>
	<hr>
	
	<div class="row justify-content-end">
		<div class="col-auto" v-if="owner">
			<a class="btn btn-secondary" :href="'edit?matchBoardNo='+matchBoardNo">수정</a>
		</div>
		<div class="col-auto" v-if="owner || memberLevel == '관리자'">
			<button class="btn btn-danger" v-on:click="showDeleteModal" >삭제</button>
		</div>
		<div class="col-auto">
			<a class="btn btn-light" href="/matchBoard/list">목록보기</a>
		</div>
	</div>

	<div class="modal" tabindex="-1" role="dialog" id="joinModal"
                         data-bs-backdrop="static"
                         ref="joinModal" style="z-index:9999;">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">참가 신청</h5>
                 </div>
                 <div class="modal-body">
                     <div class="row align-items-center mt-5">
		    			<div class="col-md-3">
		        			<span>팀 이름 : </span>
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
		    					<option v-for="member in memberList" :value="member.memberId" :disabled="selectedList.includes(member.memberId) || homeMember.includes(member.memberId)">{{member.memberName}} ({{member.memberId}})</option>
		    				</select>
		    			</div>
					</div>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="clickJoin">신청하기</button>
                     <button type="button" class="btn btn-secondary"
                             data-bs-dismiss="modal">닫기</button>
                 </div>
             </div>      
         </div>
     </div>
     
	<div class="modal" tabindex="-1" role="dialog" id="changeModal"
                         data-bs-backdrop="static"
                         ref="changeModal" style="z-index:9999;">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">참가 인원 변경</h5>
                 </div>
                 <div class="modal-body">
                     <div class="row align-items-center mt-5">
		    			<div class="col-md-3">
		        			<span>팀 이름 : </span>
		    			</div>
		    			<div class="col-md-7">
		        			<select name="teamNo" class="form-select" v-model="teamNo">
		        				<option v-for="team in teamList" :value="team.teamNo" :disabled="existTeam.includes(team.teamNo)&&team.teamNo!=curTeamNo">{{team.teamName}}</option>
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
		    					<option v-for="member in memberList" :value="member.memberId" :disabled="selectedList.includes(member.memberId) || (existMember.includes(member.memberId)&& curMember.includes(member.memberId) == false)">{{member.memberName}} ({{member.memberId}})</option>
		    				</select>
		    			</div>
					</div>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="clickChange">신청하기</button>
                     <button type="button" class="btn btn-secondary"
                             data-bs-dismiss="modal">닫기</button>
                 </div>
             </div>      
         </div>
     </div>
     
     <div class="modal" tabindex="-1" role="dialog" id="confirmModal"
                         data-bs-backdrop="static"
                         ref="confirmModal" style="z-index:9999;">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">수락 확인</h5>
                 </div>
                 <div class="modal-body">
                     <p>해당 팀의 신청을 수락하시겠습니까?</p>
                     <p>※신청을 수락하시면 다른 팀들의 신청은 자동으로 삭제됩니다※</p>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="clickConfirm">신청 수락</button>
                     <button type="button" class="btn btn-secondary"
                             data-bs-dismiss="modal">닫기</button>
                 </div>
             </div>      
         </div>
     </div>
     
     <div class="modal" tabindex="-1" role="dialog" id="cancelModal"
                         data-bs-backdrop="static"
                         ref="cancelModal" style="z-index:9999;">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">취소 확인</h5>
                 </div>
                 <div class="modal-body">
                     <p>매칭 신청을 취소 하시겠습니까?</p>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="clickCancel">신청 취소</button>
                     <button type="button" class="btn btn-secondary"
                             data-bs-dismiss="modal">닫기</button>
                 </div>
             </div>      
         </div>
     </div>
     
     <div class="modal" tabindex="-1" role="dialog" id="deleteModal"
                         data-bs-backdrop="static"
                         ref="deleteModal" style="z-index:9999;">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">삭제 확인</h5>
                 </div>
                 <div class="modal-body">
                     <p>해당 글을 삭제 하시겠습니까?</p>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="clickDelete">삭제</button>
                     <button type="button" class="btn btn-secondary"
                             data-bs-dismiss="modal">닫기</button>
                 </div>
             </div>      
         </div>
     </div>
     
</div>
<script>
    Vue.createApp({
        data(){
            return {
            	memberId : memberId,
            	memberLevel : memberLevel,
            	memberName : null,
            	size : 0,
            	matchBoardNo : null,
            	matchNo : null,
            	matchBoardData : {},
            	
            	entryList : [],
            	waitList : {},
            	awayList : [],
            	
            	matchData : {},
            	teamNo : '',
            	teamList : [],
            	memberList:[],
            	selectedList:[],
            	entryNo : [],
            	
            	acceptTeam : null,
            	cancelTeam : null,
            	
            	owner : null,
            	isInclude : null,
            	
            	joinModal:null,
            	confirmModal:null,
            	cancelModal:null,
            	deleteModal:null,
            	changeModal:null,
            	
            	homeWin : null,
            	homeLose : null,
            	
            	homeMember : [],
            	existTeam : [],
            	existMember: [],
            	
            	curTeamNo : null,
            	curMember : [],
            };
        },
        
        computed:{
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
        		this.matchBoardData = resp.data;
        		this.size = Number(resp.data.matchBoardSize);
        		
        		if(this.memberId == resp.data.memberId) this.owner = true;
        		else this.owner = false;
        	},
        	
        	async loadMatchData(){
        		const url = contextPath + "/rest/matchBoard/match/" + this.matchBoardNo;
        		const resp = await axios.get(url);
        		this.matchData = resp.data;
        		this.matchNo = resp.data.matchNo;
        		this.loadEntryList(resp.data.matchNo);
        		
        	},
        	
        	async loadEntryList(matchNo){
        		const url = contextPath+ "/rest/matchBoard/entry/" + matchNo;
        		const resp = await axios.get(url);
        		
      		  	resp.data.forEach(entry => {
      		    	entry.profile = this.loadProfile(entry.imgNo);
		      		    if(entry.memberId == memberId) this.isInclude = true;
		      		    if(!this.existMember.includes(entry.memberId)) this.existMember.push(entry.memberId);
		      		    if(!this.existTeam.includes(entry.teamNo)) this.existTeam.push(entry.teamNo);
	      		    	if(entry.teamType === "home"){
			      		    this.entryList.push(entry);
			      		    this.homeMember.push(entry.memberId);
			      		    if(this.homeWin == null) this.homeWin = entry.teamWin;
			      		    if(this.homeLose == null) this.homeLose = entry.teamLose;
	      		    	}
	      		    	else if(entry.teamType === "wait"){
	      		    		if(!this.waitList[entry.teamNo]){
	      		    			this.waitList[entry.teamNo] = [];
	      		    		}
	      		    		this.waitList[entry.teamNo].push(entry)
	      		    	}
	      		    	else{
	      		    		this.awayList.push(entry);
	      		    	}
     		 		});
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
	       					teamType : 'wait'
	       				}
	       			await axios.post(url,data);
        			
        		}
        			
        	},
        	
        	async updateAway(){
        		const url = contextPath + "/rest/matchBoard/entry";
        		const data = {matchNo : this.matchNo, teamNo : this.acceptTeam};
        		await axios.put(url,data);
        	},
        	
        	async deleteAllWait(){
        		const url = contextPath + "/rest/matchBoard/entry/" + this.matchNo;
        		await axios.delete(url);
        	},

        	async deleteWait(){
        		const url = contextPath + "/rest/matchBoard/entry/" + this.matchNo + "/" + this.cancelTeam + "/wait";
        		await axios.delete(url);
        	},
        	
        	async updateBoardStatus(){
        		const url = contextPath + "/rest/matchBoard/status";
        		const data = {matchBoardNo : this.matchBoardNo};
        		await axios.put(url, data);
        	},
        	
        	async updateMatchStatus(){
        		const url = contextPath + "/rest/matchBoard/match/status";
        		const data = {opposingNo : this.acceptTeam, matchBoardNo : this.matchBoardNo};
        		await axios.put(url, data);
        	},
        	
        	loadProfile(imgNo){
        		if(imgNo == 0){
        			return contextPath+"/static/image/profile.png";
        		}
        		else{
        			return contextPath+"/img/download/"+imgNo;
        		}
        	},
        	
        	showJoinModal(){
        		if (!this.memberId) {
            	    alert("로그인 후에 이용하여 주십시오.");
            	    return;
            	}
                if(this.joinModal == null) return;
                this.joinModal.show();
            },
            
            hideJoinModal(){
                if(this.joinModal == null) return;
                this.joinModal.hide();
            },
            
        	showDeleteModal(){
                if(this.deleteModal == null) return;
                this.deleteModal.show();
            },
            
            hideDeleteModal(){
                if(this.deleteModal == null) return;
                this.deleteModal.hide();
            },
            
        	showChangeModal(teamNo){
                if(this.changeModal == null) return;
                this.changeModal.show();
                this.curTeamNo = teamNo;
            },
            
            hideChangeModal(){
                if(this.changeModal == null) return;
                this.changeModal.hide();
            },
            
        	showCancelModal(teamNo){
                if(this.cancelModal == null) return;
                this.cancelModal.show();
                this.cancelTeam = teamNo;
            },
            
            hideCanelModal(){
                if(this.cancelModal == null) return;
                this.cancelModal.hide();
            },
            
        	showConfirmModal(teamNo){
                if(this.confirmModal == null) return;
                this.confirmModal.show();
                this.acceptTeam = teamNo;
            },
            
            hideConfirmModal(){
                if(this.confirmModal == null) return;
                this.confirmModal.hide();
            },
            
            async clickJoin(){
            	await this.insertEntry();
            	this.entryList = [];
            	this.waitList = {},
            	this.awayList = [];
            	this.loadEntryList(this.matchNo);
            },
            
            async clickConfirm(){
            	await this.updateAway();
            	await this.deleteAllWait();
            	await this.updateBoardStatus();
            	await this.updateMatchStatus();
            	this.entryList = [];
            	this.waitList = {},
            	this.awayList = [];
            	this.loadEntryList(this.matchNo);
            	this.loadMatchBoardData();
            },
            
            async clickCancel(){
            	await this.deleteWait();
            	this.isInclude = null;
            	this.entryList = [];
            	this.waitList = {},
            	this.awayList = [];
            	this.loadEntryList(this.matchNo);
            },
            
            clickChange(){
            	
            },
            
            async clickDelete(){
            	window.location.href = contextPath + '/matchBoard/delete?matchBoardNo=' + this.matchBoardNo;
            },
            
            async loadName(){
        		const url = contextPath + "/rest/matchBoard/member/" + memberId;
        		const resp = await axios.get(url);
        		this.memberName = resp.data.memberName;
        	},
        	
        	loadCurMember(){
        	}
        },
        
        watch:{
        	teamNo : function(){
        		this.loadMemberList();
        		this.selectedList = new Array(this.size);
        		this.selectedList[0] = memberId;
        	},
        	
        	curTeamNo : function(){
        		for(key in this.waitList){
        			if(key == this.curTeamNo) this.waitList[key].forEach(el => this.curMember.push(el.memberId));
        		} 
        	}
        },
        
        mounted(){
        	this.joinModal = new bootstrap.Modal(this.$refs.joinModal);
        	this.cancelModal = new bootstrap.Modal(this.$refs.cancelModal);
        	this.deleteModal = new bootstrap.Modal(this.$refs.deleteModal);
        	this.changeModal = new bootstrap.Modal(this.$refs.changeModal);
        	this.confirmModal = new bootstrap.Modal(this.$refs.confirmModal);
        },
        
        created(){
        	let uri = window.location.search.substring(1); 
            let params = new URLSearchParams(uri);
            this.matchBoardNo = params.get("matchBoardNo");
            this.loadName();
            this.loadTeamList();
            this.loadMatchBoardData();
            this.loadMatchData();
        }
    }).mount("#app");
</script>