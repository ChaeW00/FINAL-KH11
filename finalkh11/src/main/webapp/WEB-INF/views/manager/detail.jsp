<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-7" style="margin-top: 133px; background-color:#F8FAFB;">
	
		<div class="d-flex w-100 justify-content-between">
             <h1>{{match.matchBoardTitle}}</h1>
             <small>{{match.matchCity}}</small>
             <small>{{match.matchLocation}}</small>
             <small>{{match.matchDate}}</small>
         </div>
         
         <div class="row mt-4">
         	<div class="col">
         	<h3 style="color:red;">HOME : {{match.homeName}}</h3>
         	</div>
         </div>
         
         <div class="d-flex w-100 justify-content-between">
        	<div v-for="(entry,idx) in homeTeamList">
        		<h5>{{entry.memberName}} ({{entry.memberId}})</h5>
        	
        	</div>
         </div>
         
         <div class="row">
         	<div class="col">
         	<h3 style="color:blue;">AWAY : {{match.awayName}}</h3>
         	</div>
         </div>
         
         <div class="d-flex w-100 justify-content-between">
        	<div v-for="(entry,idx) in awayTeamList">
        		<h5>{{entry.memberName}} ({{entry.memberId}})</h5>
        	
        	</div>
         </div>
         
	</div>
</div>

<script>
    Vue.createApp({
        data(){
            return {
            	matchNo : 0,
            	match : {},
            	homeTeamList : [],
            	awayTeamList : [],
            };
        },
        
        computed:{
        },
        
        methods:{
        	async loadEntry(){
        		const url = contextPath + "/rest/manager/entry/" + this.matchNo;
        		const resp = await axios.get(url);
        		for(let i = 0; i < resp.data.length; i++){
        			if(resp.data[i].teamType == "home"){
        				this.homeTeamList.push(resp.data[i]);
        			}
        			else{
        				this.awayTeamList.push(resp.data[i]);
        			}
        		}
        	},
        	
        	async loadMatch(){
        		const url = contextPath + "/rest/manager/detail/" + this.matchNo;
        		const resp = await axios.get(url);
        		this.match = resp.data;
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
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>