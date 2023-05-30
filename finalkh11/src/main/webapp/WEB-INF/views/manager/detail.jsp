<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-7 p-4" style="margin-top: 133px; background-color:#F8FAFB;">
	
		<div class="d-flex w-100 justify-content-between">
             <h1>{{match.matchBoardTitle}}</h1>
             <h5>{{match.matchCity}} {{match.matchLocation}} {{match.matchDate}}</h5>
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
		    	<button class="btn btn-primary m-2" data-toggle="modal" data-target="#exampleModal">저장하기</button>
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
            	homeTeamList : [],
            	awayTeamList : [],
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
        	},
        	
        	async loadRecord(){
        		const url = contextPath + "/rest/manager/record/" + this.matchNo;
        		const resp = await axios.get(url);
        		this.record = resp.data;
        	},
        	
        	async updateRecord(){
        		const url = contextPath + "/rest/manager/record";
        		this.record.mvpId = "testuser14";
        		await axios.put(url, this.record);
        	},
        	
        	async updateManner(memberId, manner){
        		const url = contextPath + "/rest/member/update/manner/" + memberId;
        		const data = {memberManner : manner};
        		await axios.patch(url, data);
        		
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
        	}
        	
        	
        },
        
        watch:{
        	
        },
        
        mounted(){
        	
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