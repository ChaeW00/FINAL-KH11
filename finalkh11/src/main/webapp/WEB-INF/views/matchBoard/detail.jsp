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
	
	.fa-check {
    	border: 2px solid lime;
    	background-color: lime;
    	color: green;
    	padding: 5px;
    	border-radius: 5px;
	}
	
	.box {
    	border: 1px solid;
    	min-height : 5em;
    }
    	
    .panel {
    	text-align: center;
    }
</style>


<div id="app" class="container-fluid mt-4 custom-container">
	<div class="row mt-5">
		<h1 class="center-align">모집글 게시판</h1>
	</div>
	<hr>
	<div class="row">
		<h2>{{matchBoardData.matchBoardTitle}}</h2>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-11">
			<h4>{{matchBoardData.memberId}} {{matchBoardData.matchBoardTime}} 조회수 : {{matchBoardData.matchBoardRead}}</h4>
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
		<div class="row align-items-center">
			<div class="col-md-6" v-for="entry in entryList">
				<img :src="entry.profile">
   			</div>
			<div class="col-md-6" v-for="entry in entryList">
				{{entry.memberName}}
   			</div>
			<div class="col-md-6" v-for="entry in entryList">
				{{entry.memberManner}}
   			</div>
		</div>
	</div>
	<div class="row">
		<p>매치 정보 : {{matchBoardData.matchBoardCity}} {{matchBoardData.matchBoardLocation}} {{matchBoardData.matchBoardDate}} {{matchBoardData.matchBoardTime2}} {{matchBoardData.matchBoardAge}}대 {{matchBoardData.matchBoardSize}}vs{{matchBoardData.matchBoardSize}}</p>
	</div>
	<hr>
    		<div class="row">
      			<div class="col-md-6">
      				<h3 class="panel rest">대기실</h3>
      				<div class="box">
      				
      				</div>
      			</div>
      		
      			<div class="col-md-6">
        			<h3 class="panel away">Away Team</h3>
        			<div class="box">
        			
        			</div>
      			</div>
    		</div>
    		
    		
    		<div class="row mt-4">
      			<div class="col-md-6">
        			<button class="btn btn-primary w-100" v-on:click="showModal">참가신청</button>
        		</div>
    		</div>
	<hr>
	
		
<!-- 	<div class="row"> -->
<!-- 		댓글 -->
<%-- 		<span class="reply-count">${matchBoardData.matchBoardReply}</span> --%>
<!-- 	</div> -->
<!-- 	<hr> -->
<!-- 	<div class="row reply-list"> -->
<!-- 		댓글 목록 -->
<!-- 	</div> -->
<!-- 	<hr> -->
	
<!-- 	<div class="row"> -->
		
<!-- 		<div class="row"> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${sessionScope.memberId != null}"> --%>
<!-- 					<textarea name="matchReplyContent" class="form-control w-100" -->
<!-- 							placeholder="댓글 내용을 작성하세요"></textarea>	 -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<textarea name="matchReplyContent" class="form-control w-100" -->
<!-- 							placeholder="로그인 후에 댓글 작성이 가능합니다" disabled></textarea>	 -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
			
<!-- 		</div> -->
<%-- 		<c:if test="${sessionScope.memberId != null}">		 --%>
<!-- 		<div class="row"> -->
<!-- 			<button type="button" class="btn btn-dark mt-2 reply-insert-btn">댓글 작성</button> -->
<!-- 		</div> -->
<%-- 		</c:if> --%>

<!-- 	</div> -->
	
	<hr>
	
<!-- 	<div class="row"> -->
<%-- 		<c:if test="${owner}"> --%>
<%-- 		<a class="btn btn-secondary mt-2" href="/matchBoard/edit?matchBoardNo=${matchBoardData.matchBoardNo}">수정</a> --%>
<%-- 		</c:if> --%>
		
<%-- 		<c:if test="${owner || admin}"> --%>
<%-- 		<a class="btn btn-danger mt-2" href="/matchBoard/delete?matchBoardNo=${matchBoardData.matchBoardNo}">삭제</a> --%>
<%-- 		</c:if> --%>
<!-- 		<a class="btn btn-light mt-2" href="/matchBoard/list">목록보기</a> -->
<!-- 	</div> -->

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
		        			<span>팀 번호 : </span>
		    			</div>
		    			<div class="col-md-7">
		        			<select name="teamNo" class="form-select" v-model="teamNo">
		        				<option v-for="team in teamList" :value="team">{{team}}</option>
							</select>
		    			</div>
					</div>
					<div id="inputContainer" class="row align-items-center mt-5">
		    			<div class="col-md-6 mt-4" v-for="n in size">
		    				<span>참가자{{n}}</span>
		    				<select class="form-select" v-model="selectedList[n-1]">
		    					<option v-for="member in memberList" :value="member.memberId">{{member.memberId}}</option>
		    				</select>
		    			</div>
					</div>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary"
                             data-bs-dismiss="modal" v-on:click="clickJoin()">신청하기</button>
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
            	size : 0,
            	matchBoardNo : null,
            	matchBoardData : {},
            	entryList : [],
            	waitingList : [],
            	awayList : [],
            	matchData : {},
            	modal:null,
            	teamNo : '',
            	teamList : [],
            	memberList:[],
            	selectedList:[],
            	entryNo : [],
            };
        },
        
        computed:{
        },
        
        methods:{
        	async loadTeamList(){
        		const url = contextPath + "/rest/team/teamList/" + memberId;
        		const resp = await axios.get(url);
        		this.teamList.push(...resp.data);
        		this.teamNo = this.teamList[0];
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
        	},
        	
        	async loadMatchData(){
        		const url = contextPath + "/rest/matchBoard/match/" + this.matchBoardNo;
        		const resp = await axios.get(url);
        		this.matchData = resp.data;
        		this.loadEntryList(resp.data.matchNo);
        	},
        	
        	async loadEntryList(matchNo){
        		const url = contextPath+ "/rest/matchBoard/entry/" + matchNo;
        		const resp = await axios.get(url);
        		
      		  	resp.data.forEach(entry => {
      		    	entry.profile = this.loadProfile(entry.imgNo);
	      		    	if(entry.teamType === "home"){
			      		    this.entryList.push(entry);
	      		    	}
	      		    	else if(entry.teamType === "wait"){
	      		    		this.waitingList.push(entry);
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
            
            async clickJoin(){
            	this.insertEntry();
            	this.loadEntryList();
            },
            
        },
        
        watch:{
        	teamNo : function(){
        		this.loadMemberList();
        		this.selectedList = new Array(this.size);
        	},
        },
        
        mounted(){
        	this.modal = new bootstrap.Modal(this.$refs.joinModal);
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