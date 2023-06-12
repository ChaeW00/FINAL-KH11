<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-7 p-4" style="margin-top: 133px; background-color:#F8FAFB;">
	
		<div class="d-flex w-100 justify-content-between">
             <h1>{{match.matchBoardTitle}}</h1>
             <h5>{{match.matchCity}} {{match.matchLocation}} {{match.matchDate}}</h5>
         </div>
        <div class="row" v-if="videoNo != 0">
			<div class="col">
				<video class="w-100" controls :src="'/img/download/'+videoNo"></video>
			</div>
		</div>
        <div class="row mt-4">
			<div class="col-md-6">
		    	<h3 style="color: red;">HOME : {{match.homeName}}</h3>
		  	</div>
			<div class="col-md-6 d-flex justify-content-end align-items-center">
				<h3>점수 : </h3>
			    <input type="number" id="home-score" class="form-control" style="max-width: 60px;"
			    	v-model="record.homeScore" min="0">
			</div>
		</div>
         
         <div class="card-group mb-4 mt-4" style="max-width:800px; margin:auto;">
		  <div class="card" v-for="(entry,idx) in homeTeamList">
		    <img :src="entry.profile" class="card-img-top">
		    <div class="card-body">
		      <h6 class="text-center">{{entry.memberName}}</h6>
		      <h6 class="text-center">({{entry.memberId}})</h6>
		    </div>
		    <div class="card-footer d-flex w-100 justify-content-center">
		      <input class="form-control text-center ps-0 pe-0" type="number" v-model="entry.memberManner" step="0.5" min="0" max="100">
		    </div>
		  </div>
         </div>
         
         
         <hr>
         
         <div class="row mt-4">
			<div class="col-md-6">
		    	<h3 style="color: blue;">AWAY : {{match.awayName}}</h3>
		  	</div>
			<div class="col-md-6 d-flex justify-content-end align-items-center">
				<h3>점수 : </h3>
			    <input type="number" id="away-score" class="form-control" style="max-width: 60px;"
			    	v-model="record.awayScore" min="0">
			</div>
		</div>
         
         <div class="card-group mt-4" style="max-width:800px; margin:auto;">
		  <div class="card" v-for="(entry,idx) in awayTeamList">
		    <img :src="entry.profile" class="card-img-top">
		    <div class="card-body">
		      <h6 class="text-center">{{entry.memberName}}</h6>
		      <h6 class="text-center">({{entry.memberId}})</h6>
		    </div>
		    <div class="card-footer d-flex w-100 justify-content-center">
		      <input class="form-control text-center ps-0 pe-0" type="number" v-model="entry.memberManner" step="0.5" min="0" max="100">
		    </div>
		  </div>
         </div>
         
         <div class="d-flex justify-content-end mt-4">
		 	<div>
		 		<a href="list" class="btn btn-secondary m-2">목록으로</a>
		    	<button class="btn btn-primary m-2" v-on:click="showModal">저장하기</button>
		  	</div>
		</div>
	</div>
	<div class="modal" tabindex="-1" role="dialog" id="noticeModal"
                         data-bs-backdrop="static"
                         ref="noticeModal" style="z-index:9999;">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">경기 결과 저장</h5>
                 </div>
                 <div class="modal-body">
                     <p>변경 값을 저장 하시겠습니까?</p>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="clickSave()">저장하기</button>
                     <button type="button" class="btn btn-secondary"
                             data-bs-dismiss="modal">취소</button>
                 </div>
             </div>      
         </div>
     </div>
</div>

<script>
    Vue.createApp({
        data(){
            return {
            	matchNo : 0,
            	record : {},
            	match : {},
            	videoNo : 0,
            	homeTeamList : [],
            	awayTeamList : [],
            	winTeam:null,
            	modal:null,
            };
        },
        
        computed:{
        },
        
        methods:{
        	async loadEntry() {
        		  const url = contextPath + "/rest/manager/entry/" + this.matchNo;
        		  const resp = await axios.get(url);
        		  
        		  resp.data.forEach(entry => {
        		    entry.profile = this.loadProfile(entry.imgNo);
        		    
        		    if (entry.teamType === "home") {
        		      this.homeTeamList.push(entry);
        		    } 
        		    else {
        		      this.awayTeamList.push(entry);
       		    	}
       		  });
       		},
        	
        	async loadMatch(){
        		const url = contextPath + "/rest/manager/detail/" + this.matchNo;
        		const resp = await axios.get(url);
        		this.match = resp.data;
        		
        		const url2 = contextPath + "/rest/matchBoard/" + resp.data.matchBoardNo;
        		const resp2 = await axios.get(url2);
        		this.videoNo = resp2.data.matchBoardVideo;
        		
        	},
        	
        	async loadRecord(){
        		const url = contextPath + "/rest/manager/record/" + this.matchNo;
        		const resp = await axios.get(url);
        		this.record = resp.data;
        		this.initWin();
        	},
        	
        	async updateRecord(){
        		const url = contextPath + "/rest/manager/record";
        		await axios.put(url, this.record);
        	},
        	
        	async updateManner(memberId, manner){
        		const url = contextPath + "/rest/member/update/manner/" + memberId;
        		const data = {memberManner : manner};
        		await axios.patch(url, data);
        		
        	},
        	
        	async plusWin(teamNo){
        		const url = contextPath + "/rest/team/plusWin/" + teamNo;
        		await axios.patch(url);
        	},
        	
        	async minusWin(teamNo){
        		const url = contextPath + "/rest/team/minusWin/" + teamNo;
        		await axios.patch(url);
        	},
        	
        	async plusLose(teamNo){
        		const url = contextPath + "/rest/team/plusLose/" + teamNo;
        		await axios.patch(url);
        	},
        	
        	async minusLose(teamNo){
        		const url = contextPath + "/rest/team/minusLose/" + teamNo;
        		await axios.patch(url);
        	},
        	
        	updateMember(){
        		for(let i = 0; i < this.homeTeamList.length; i++){
        			this.updateManner(this.homeTeamList[i].memberId, this.homeTeamList[i].memberManner);
        		}
        		for(let i = 0; i < this.awayTeamList.length; i++){
        			this.updateManner(this.awayTeamList[i].memberId, this.awayTeamList[i].memberManner);
        		}
        	},
        	
        	loadProfile(imgNo){
        		if(imgNo == 0){
        			return contextPath+"/static/image/profile.png";
        		}
        		else{
        			return contextPath+"/img/download/"+imgNo;
        		}
        	},
        	
        	showModal(){
                if(this.modal == null) return;
                this.modal.show();
            },
            
            hideModal(){
                if(this.modal == null) return;
                this.modal.hide();
            },
            
            initWin(){
            	if(this.record.homeScore > this.record.awayScore){
            		this.winTeam = "home";
            	}
            	else if(this.record.homeScore < this.record.awayScore){
            		this.winTeam = "away";
            	}
            },
        	
            calcRecord(){
            	if (this.winTeam == null){
            		if(this.record.homeScore > this.record.awayScore){
                		this.plusWin(this.record.homeNo);
                		this.plusLose(this.record.awayNo);
                	}
            		else{
            			this.plusWin(this.record.awayNo);
            			this.plusLose(this.record.homeNo);
            		}
            	}
            	else if (this.winTeam == "home"){
            		if(this.record.homeScore < this.record.awayScore){
            			this.minusWin(this.record.homeNo);
                		this.plusLose(this.record.homeNo);
                		this.plusWin(this.record.awayNo);
                		this.minusLose(this.record.awayNo);
                	}
            	}
            	else{
            		if(this.record.homeScore > this.record.awayScore){
            			this.minusWin(this.record.awayNo);
                		this.plusLose(this.record.awayNo);
                		this.plusWin(this.record.homeNo);
                		this.minusLose(this.record.homeNo);
                	}
            	}
            },
            
            
            clickSave(){
            	this.updateRecord();
            	this.updateMember();
            	this.calcRecord();
            }
        	
        },
        
        watch:{
        	
        },
        
        mounted(){
        	this.modal = new bootstrap.Modal(this.$refs.noticeModal);
        },
        
        created(){
        	let uri = window.location.search.substring(1); 
            let params = new URLSearchParams(uri);
            this.matchNo = params.get("matchNo");
            this.loadEntry();
        	this.loadMatch();
        	this.loadRecord();
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>