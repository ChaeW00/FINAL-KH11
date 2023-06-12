<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-7" style="margin-top: 133px; background-color:#F8FAFB;">
		
          
		<!-- 날짜 -->
		<div class="row mt-4">
			<div class="col text-start">
				<button type="button" class="btn btn-secondary" :disabled="currentPage === 1" @click="previousPage" transition="fade">이전</button>
			</div>
			<div class="col-10 text-center">
				<span class="me-2 animate__animated animate__bounceIn" v-for="(date, index) in displayedDateList" :key="date">
				<button type="button" :class="getButtonClass(date)" :value="date" v-model="matchDate" @click="selectDate(index); clickDate(matchDate)"/>
				{{ formatDate(date) }}
				</span>
			</div>
			<div class="col text-end">
				<button type="button" class="btn btn-secondary" :disabled="currentPage === totalPages" @click="nextPage">다음</button>
			</div>
		</div>
		
		<div class="row mt-4">
           <div class="col">
             <div class="list-group" v-for="(match, idx) in matchList">
               <a :href="'/manager/detail?matchNo=' + match.matchNo" class="list-group-item list-group-item-action mb-3">
                 <div class="d-flex w-100 justify-content-between">
                   <h4 class="mb-1">{{match.matchBoardTitle}}</h4>
                   <small>{{match.matchDate}} {{match.matchTime}}</small>
                 </div>
                 <div class="d-flex w-100 justify-content-between">
                   <small>{{match.matchSize}}vs{{match.matchSize}}</small>
                   <small>{{match.matchCity}} {{match.matchLocation}}</small>
                   <small style="color : red;">HOME:{{match.homeName}}</small>
                   <small style="color : blue;">AWAY:{{match.awayName}}</small>
                   <small>{{match.matchStatus}}</small>
                 </div>
               </a>
             </div>
           </div>
         </div>			
	</div>

      
      
</div>

<script>
    Vue.createApp({
        data(){
            return {
                startDate : null,
                endDate: null,
                dateList: [],
                itemsPerPage: 7,
                currentPage: 1,
                matchDate : null,
            	matchList:[]
            };
        },
        
        computed:{
        	totalPages() {
                return Math.ceil(this.dateList.length / this.itemsPerPage);
            }
        },
        
        methods:{
        	 generateDateList() {
                 const start = new Date(this.startDate);
                 const end = new Date(this.endDate);

                 while (start <= end) {
                   this.dateList.push(start.toISOString().split('T')[0]);
                   start.setDate(start.getDate() + 1);
                 }
             },
             updateDisplayedDateList() {
                 const startIndex = (this.currentPage - 1) * this.itemsPerPage;
                 const endIndex = startIndex + this.itemsPerPage;
                 this.displayedDateList = this.dateList.slice(startIndex, endIndex);
             },
             formatDate(date) {
                 const options = {day: 'numeric', weekday: 'short'};
                 const formattedDate = new Date(date).toLocaleDateString('ko-KR', options);
                 return formattedDate;
             },
             selectDate(index) {
                 const date = this.displayedDateList[index];
                 this.matchDate = date;
             },
             getButtonClass(date) {
                 const day = new Date(date).getDay();
                 if (day === 0) {
                     return 'btn btn-outline-danger';
                 } else if (day === 6) {
                     return 'btn btn-outline-primary';
                 } else {
                     return 'btn btn-outline-dark';
                 }
             },
             previousPage() {
                 if (this.currentPage > 1) {
                     this.currentPage--;
                     this.updateDisplayedDateList();
                     }
                 },
            nextPage() {
                const totalPages = Math.ceil(this.dateList.length / this.itemsPerPage);
                if (this.currentPage < totalPages) {
                    this.currentPage++;
                    this.updateDisplayedDateList();
                }
            },
        	async loadMatchList(){
        		const url = contextPath+"/rest/manager/list";
        		const resp = await axios.get(url);
        		resp.data.forEach(match => {
        			if(match.matchStatus == "경기종료") this.matchList.push(match);
        		});
        	},
        	async clickDate(matchDate){
        		this.matchList = [];
        		const url = contextPath+"/rest/manager/list/" + matchDate;
        		const resp = await axios.get(url);
        		resp.data.forEach(match => {
        			if(match.matchStatus == "경기종료") this.matchList.push(match);
        		});
			}
        },
        
        watch:{
        	
        },
        
        mounted(){
        	this.loadMatchList();
        	this.startDate = new Date(new Date().getTime() - 20 * 24 * 60 * 60 * 1000);
        	this.endDate = new Date;
            this.generateDateList();
            this.updateDisplayedDateList();
        },
        
        created(){
        	
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>