<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 
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


<div id="app" class="container-fluid mt-4 custom-container main-content">
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
	<div class="row" style="min-height:100px;">
		<div class="row">
			{{matchBoardData.matchBoardContent}}
		</div>
		<div class="video-box" v-if="status == '경기종료' && owner">
			<div class="row" v-if="matchBoardData.matchBoardVideo != 0">
				<div class="col">
					<video class="w-100" controls :src="'/img/download/'+matchBoardData.matchBoardVideo"></video>
				</div>
			</div>
			<div class="row justify-content-end">
				<div class="col-auto">
					<button class="btn btn-primary" v-on:click="showVideoModal">경기영상 업로드</button>
				</div>
			</div>
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
				<h5>매너 : {{entry.memberManner}}</h5>
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
      			<div class="col" v-if="status == '모집중'">
      				<h3 class="panel rest">참가 대기</h3>
      				<div class="box">
      					<div class="row" v-for="waitTeam in waitList">
      						<p> 팀 이름 : {{waitTeam[0].teamName}} (전적 : {{waitTeam[0].teamWin}}승 {{waitTeam[0].teamLose}}패)</p>
      						<div class="col-md-3" v-for="waitEntry in waitTeam">
      								<div><img :src="waitEntry.profile" class="profile"></div>
									<h4>{{waitEntry.memberName}}</h4>
									<h6>({{waitEntry.memberId}})</h6>
									<h5>매너 : {{waitEntry.memberManner}}</h5>
      						</div>
      						<div class="row justify-content-end mb-2" >
      							<button class="btn btn-primary col-auto me-2" v-on:click="showConfirmModal(waitTeam[0].teamNo)" v-if="owner">수락</button>
      							<button class="btn btn-primary col-auto me-2" v-on:click="showChangeModal(waitTeam[0].teamNo,'wait')" v-if="memberId == waitTeam[0].memberId">변경</button>
      							<button class="btn btn-danger col-auto me-2" v-on:click="showCancelModal(waitTeam[0].teamNo)" v-if="memberId == waitTeam[0].memberId">삭제</button>
      						</div>
      						<hr>
      					</div>
      				</div>
      			</div>
      		
      			<div class="col" v-else>
        			<h3 class="panel away">Away Team</h3>
        			<div class="box">
        				<div class="row" >
        					<p v-if="awayList.length > 0"> 팀 이름 : {{awayList[0].teamName}} (전적 : {{awayList[0].teamWin}}승 {{awayList[0].teamLose}}패)</p>
      						<div class="col-md-3" v-for="(awayEntry,idx) in awayList">
      							<div><img :src="awayEntry.profile" class="profile"></div>
								<h4>{{awayEntry.memberName}}</h4>
								<h6>({{awayEntry.memberId}})</h6>
								<h5>매너 : {{awayEntry.memberManner}}</h5>
      						</div>
      						<div class="row justify-content-end mb-2" v-if="awayList.length > 0">
      							<button class="btn btn-primary col-auto me-2" v-on:click="showChangeModal(awayList[0].teamNo,'away')" v-if="memberId == awayList[0].memberId && status !='경기종료'">변경</button>
      						</div>
      					</div>
        			</div>
      			</div>
    		</div>
    		
    		
    		<div class="row mt-4 justify-content-end" v-if="!owner && status =='모집중' && !isInclude">
      			<div class="col-auto">
        			<button class="btn btn-primary" v-on:click="showJoinModal">참가신청</button>
        		</div>
    		</div>
	<hr>
	
	<div class="row justify-content-end">
		<div class="col-auto" v-if="owner && status != '경기종료'">
			<a class="btn btn-secondary" :href="'edit?matchBoardNo='+matchBoardNo">수정</a>
		</div>
		<div class="col-auto" v-if="(owner || memberLevel == '관리자') && status != '경기종료'">
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
		    					<option v-for="member in memberList" :value="member.memberId" :disabled="selectedList.includes(member.memberId) || (existMember.includes(member.memberId)&& curEntry.some((el) => el.memberId === member.memberId) == false)">{{member.memberName}} ({{member.memberId}})</option>
		    				</select>
		    			</div>
					</div>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="clickChange">변경하기</button>
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
                     <p>※경기가 끝난뒤 전체경기 영상을 업로드 하시면 경기 결과를 기록해드립니다.※</p>
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
     
     <div class="modal" tabindex="-1" role="dialog" id="videoModal"
                         data-bs-backdrop="static"
                         ref="videoModal" style="z-index:9999;">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">경기영상 업로드</h5>
                 </div>
                 <div class="modal-body">
                     <div class="row" style="min-height:100px;">
	                     <video controls :src="videoUrl" ref="videoElement"></video>
                     </div>
                     <div class="mt-4 row justify-content-end">
						<div class="col-auto">
							<input class="form-control" type="file" accept=".mp4" @change="onVideoChange">
						</div>                     
                     </div>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="videoUpload" v-if="matchBoardData.matchBoardVideo == 0">업로드</button>
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="videoChange" v-if="matchBoardData.matchBoardVideo != 0">변경</button>
                     <button type="button" class="btn btn-danger"
                             data-bs-dismiss="modal" v-on:click="videoDelete" v-if="matchBoardData.matchBoardVideo != 0">삭제</button>
                     <button type="button" class="btn btn-secondary"
                             data-bs-dismiss="modal" v-on:click="videoCancel">닫기</button>
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
            	memberName : memberName,
            	size : 0,
            	matchBoardNo : null,
            	matchNo : null,
            	matchBoardData : {},
            	matchData : {},
            	teamList : [],
            	homeMember : [],
            	
            	joinModal:null,
            	confirmModal:null,
            	cancelModal:null,
            	deleteModal:null,
            	changeModal:null,
            	videoModal:null,
            	
            	status : null,
            	homeWin : null,
            	homeLose : null,
            	
            	entryList : [],
            	waitList : {},
            	awayList : [],
            	
            	teamNo : '',
            	memberList:[],
            	selectedList:[],
            	entryNo : [],
            	
            	acceptTeam : null,
            	cancelTeam : null,
            	
            	owner : null,
            	isInclude : null,
            	
            	
            	existTeam : [],
            	existMember: [],
            	
            	curTeamNo : null,
            	curEntry : [],
            	curType : null,
            	
            	videoFile: null,
                videoUrl: null,
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
        		this.status = resp.data.matchBoardStatus;
        		this.videoUrl = contextPath + "/img/download/" + resp.data.matchBoardVideo;
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
        	
        	async updateEntry(){
        		const url = contextPath + "/rest/matchBoard/entry";
        		for(let i = 0; i < this.size; i++){
        			let entryNo = this.curEntry[i].entryNo;
        			let selectMember = this.selectedList[i];
	        		const data = {
	        				entryNo : entryNo,
	        				matchNo : this.matchNo,
	        				teamNo : this.teamNo,
	        				memberId : selectMember,
	        				teamType : this.curType
	        		};
    	    		await axios.put(url,data);
        		}
        	},
        	
        	async updateAway(){
        		const url = contextPath + "/rest/matchBoard/entry/away";
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
            
        	showDeleteModal(){
                if(this.deleteModal == null) return;
                this.deleteModal.show();
            },
            
        	showChangeModal(teamNo,teamType){
                if(this.changeModal == null) return;
                this.changeModal.show();
                this.teamNo = teamNo;
                this.curTeamNo = teamNo;
                this.curType = teamType;
            },
            
        	showCancelModal(teamNo){
                if(this.cancelModal == null) return;
                this.cancelModal.show();
                this.cancelTeam = teamNo;
            },
            
        	showConfirmModal(teamNo){
                if(this.confirmModal == null) return;
                this.confirmModal.show();
                this.acceptTeam = teamNo;
            },
            
        	showVideoModal(){
                if(this.videoModal == null) return;
                this.videoModal.show();
            },
            
            async clickJoin(){
            	await this.insertEntry();
            	await this.initMethod();
            	this.loadEntryList(this.matchNo);
            },
            
            async clickConfirm(){
            	await this.updateAway();
            	await this.deleteAllWait();
            	await this.updateBoardStatus();
            	await this.updateMatchStatus();
            	await this.initMethod();
            	this.loadEntryList(this.matchNo);
            	this.loadMatchBoardData();
            },
            
            async clickCancel(){
            	await this.deleteWait();
            	await this.initMethod();
            	this.loadEntryList(this.matchNo);
            },
            
            async clickChange(){
            	await this.updateEntry();
            	await this.initMethod();
            	this.loadEntryList(this.matchNo);
            },
            
            async clickDelete(){
            	window.location.href = contextPath + '/matchBoard/delete?matchBoardNo=' + this.matchBoardNo;
            },
        	
        	onVideoChange(event) {
                let videoElement = this.$refs.videoElement;
                let videoFile = event.target.files[0];
                let videoUrl = URL.createObjectURL(videoFile);
                videoElement.pause();
                videoElement.setAttribute('src', videoUrl);
                videoElement.load();

                this.videoFile = videoFile;
                this.videoUrl = videoUrl;
            },
            
            async videoUpload(){
            	const url = contextPath + "/img/upload";
            	if (this.videoFile) {
                    let formData = new FormData();
                    formData.append("attach", this.videoFile);
                    const resp = await axios.post(url, formData, {
                        headers: {
                            'Content-Type':'multipart/form-data'
                        },
                        transformRequest: [(data, headers) => data]
                    });
                    
                    const url2 = contextPath + "/rest/matchBoard/video";
                    let data = this.matchBoardData;
                    data.matchBoardVideo = resp.data.imgNo;
                    await axios.put(url2, data);
                    
                    this.matchBoardData.matchBoardVideo = resp.data.imgNo;
            	}
            },
            
            async videoDelete(){
            	const url = contextPath + "/img/delete/" + this.matchBoardData.matchBoardVideo;
            	await axios.delete(url);
            	
            	this.videoFile = null;
                this.videoUrl = null;
            },
            
            async videoChange(){
            	if (this.videoFile) {
            		const url = contextPath + "/img/delete/" + this.matchBoardData.matchBoardVideo;
                	await axios.delete(url);
                	
                	const url2 = contextPath + "/img/upload";
                    let formData = new FormData();
                    formData.append("attach", this.videoFile);
                    const resp = await axios.post(url2, formData, {
                        headers: {
                            'Content-Type':'multipart/form-data'
                        },
                        transformRequest: [(data, headers) => data]
                    });
                    
                    const url3 = contextPath + "/rest/matchBoard/video";
                    let data = this.matchBoardData;
                    data.matchBoardVideo = resp.data.imgNo;
                    await axios.put(url3, data);
                    
                    this.matchBoardData.matchBoardVideo = resp.data.imgNo;
            	}
            },
        	
        	initMethod(){
        		this.entryList = [];
            	this.waitList = {};
            	this.awayList = [];
            	
            	this.entryNo = [];
            	
            	this.acceptTeam = null;
            	this.cancelTeam = null;
            	
            	this.owner = null;
            	this.isInclude = null;
            	
            	
            	this.existTeam = [];
            	this.existMember= [];
            	
            	this.curTeamNo = null;
            	this.curEntry = [];
            	this.curType = null;
        	}
        	
        },
        
        watch:{
        	teamNo : function(){
        		this.loadMemberList();
        		this.selectedList = new Array(this.size);
        		this.selectedList[0] = memberId;
        	},
        	
        	curTeamNo : function(){
        		if(this.curType == 'wait'){
	        		for(key in this.waitList){
	        			if(key == this.curTeamNo) {
	        				this.waitList[key].forEach((el,idx) => {
		        				this.curEntry.push(el);
		        				this.selectedList[idx] = el.memberId;
	        				});
	        			}
	       			}        			
        		}
        		else{
        			this.curEntry = this.awayList;
        			this.awayList.forEach((el,idx) =>{
        				this.selectedList[idx] = el.memberId;
        			});
        		}
       		}
        },
        
        mounted(){
        	this.joinModal = new bootstrap.Modal(this.$refs.joinModal);
        	this.videoModal = new bootstrap.Modal(this.$refs.videoModal);
        	this.cancelModal = new bootstrap.Modal(this.$refs.cancelModal);
        	this.deleteModal = new bootstrap.Modal(this.$refs.deleteModal);
        	this.changeModal = new bootstrap.Modal(this.$refs.changeModal);
        	this.confirmModal = new bootstrap.Modal(this.$refs.confirmModal);
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