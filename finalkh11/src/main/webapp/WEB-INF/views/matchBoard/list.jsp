<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

   <!-- 슬라이드 (slide) -->
   <div id="app" class="main-content d-flex container-fluid mt-4 justify-content-center">
      <div class="row col-7">
         <div class="d-flex container-fluid mt-4 justify-content-center">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
               <div class="carousel-indicators" >
                  <c:forEach var="mainImg" items="${mainImgList}" varStatus="status">
                     <button type="button" data-bs-target="#carouselExampleIndicators" 
                     data-bs-slide-to="${status.index}"<c:if test="${status.index == 0}"> class="active" aria-current="true"</c:if> 
                     aria-label="Slide ${status.index + 1}">
                     </button>
                  </c:forEach>
               </div>
               <div class="carousel-inner">
                  <c:choose>
                     <c:when test="${imgList.size() == 0}">
                        <div class="carousel-item active">
                           <img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy01.png" width="600" height="250">
                        </div>
                        <div class="carousel-item">
                              <img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy02.png" width="600" height="250">
                           </div>
                        <div class="carousel-item">
                           <img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy03.png" width="600" height="250">
                        </div>
                     </c:when>
                     <c:otherwise>
                        <c:forEach var="mainImg" items="${mainImgList}" varStatus="status">
                           <div class="carousel-item<c:if test="${status.index == 0}"> active</c:if>">
                              <img src="/img/download/${mainImg.imgDto.imgNo}" class="slide-img" 
                              alt="메인 슬라이드 이미지" width="800" height="250">
                           </div>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               </div>
               <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
               </button>
               <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
               </button>
            </div>
         </div>

    <div class="row mt-4">
      <div class="offset-md-1 col-md-10">
      <!-- 날짜 -->
      <div class=" d-flex row mt-4 justify-content-center">
         <div class="col-auto">
            <button type="button" class="btn btn-secondary"  @click="loadList" transition="fade">전체 날짜 보기</button>
         </div>
         <div class="col-auto text-start">
            <button type="button" class="btn btn-secondary" :disabled="currentPage === 1" @click="previousPage" transition="fade">이전</button>
         </div>
         <div class="col-auto text-center">
            <span class="me-2 animate__animated animate__bounceIn" v-for="(date, index) in displayedDateList" :key="date">
            <button type="button" :class="getButtonClass(date)" :value="date" v-model="matchDate" @click="selectDate(index)"/>
            {{ formatDate2(date) }}
            </span>
         </div>
         <div class="col-auto text-end">
            <button type="button" class="btn btn-secondary" :disabled="currentPage === totalPages" @click="nextPage">다음</button>
         </div>
      </div>
      <div class="row mt-5">
         <div class="col">
            <select class="form-select float-start me-3" v-model="city" style="width:8em;">
               <option v-for="city in cityList">{{city}}</option>
            </select>
            
            <select class="form-select float-start me-3" v-model="location" style="width:8em;">
               <option v-for="location in locationList">{{location}}</option>
            </select>
            
            <select class="form-select float-start" v-model="size" style="width:8em;">
               <option value="인원수 전체">인원수 전체</option>
               <option value="3">3 vs 3</option>
                    <option value="4">4 vs 4</option>
                    <option value="5">5 vs 5</option>
                    <option value="6">6 vs 6</option>
            </select>
            
              <a href="write" v-if="memberId != null" class="btn btn-primary mt-2 float-end">글쓰기</a>
         </div>
      </div>
        <div class="row mt-4">
          <div class="col">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th><p class="boardInfo2" style="text-align: center;">모집현황</p></th>
                  <th><p class="boardInfo2" style="text-align: center;">제목</p></th>
                  <th><p class="boardInfo2" style="text-align: center;">작성자</p></th>
                  <th><p class="boardInfo2" style="text-align: center;">조회수</p></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="match in list">
                   <td class="text-center">
                       <div v-if="match.matchBoardStatus === '모집중'">
                           <p class="boardInfo bg-primary text-white" style="font-weight: bold; text-align: center;">{{ match.matchBoardStatus }}</p>
                       </div>
                       <div v-else-if="match.matchBoardStatus === '모집마감'">
                           <p class="boardInfo bg-danger text-white" style="font-weight: bold; text-align: center;">{{ match.matchBoardStatus }}</p>
                       </div>
                       <div v-else-if="match.matchBoardStatus === '경기종료'">
                           <p class="boardInfo bg-dark text-white" style="font-weight: bold; text-align: center;">{{ match.matchBoardStatus }}</p>
                       </div>
                   </td>
                   <td class="text-center">
                       <p class="boardInfo text-center">
                       <a :href="'detail?matchBoardNo=' + match.matchBoardNo" style="text-decoration: none; color: black; font-weight: bold; text-align: center;">
                           {{ match.matchBoardTitle }} <br>
                           <span style="font-size: 14px;">
                              ({{ match.matchBoardCity }} {{ match.matchBoardLocation }} {{ formatDate(match.matchBoardDate) }} 
                              {{ match.matchBoardTime2 }} {{ match.matchBoardAge }}대 {{ match.matchBoardSize }}vs{{ match.matchBoardSize }})
                           </span> <!-- ({{ match.matchBoardReply }}) -->
                       </a></p>
                   </td>
                   <td>
                       <p class="boardInfo" style="text-align: center;">{{ match.memberName }}</p>
                   </td>
                   <td>
                       <p class="boardInfo" style="text-align: center;">{{ match.matchBoardRead }}</p>
                   </td>
               </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <a :href="'rate'" style="text-decoration: none; color: black; font-weight: bold; text-align: center;">팀 순위 보러 가기</a>
    </div>
  </div>
</div>
    <script>
    Vue.createApp({
        data(){
            return {
               memberId : memberId,
               list: [],
               city : '도시 전체',
               cityList : ['도시 전체','서울','부산','대구','인천','광주','대전','울산','세종','경기','강원','충북','충남','전북','전남','경북','경남','제주'],
               location : '지역 전체',
               size : '인원수 전체',
               startDate : null,
                endDate: null,
                dateList: [],
                itemsPerPage: 7,
                currentPage: 1,
                matchDate : null,
            };
        },
        
        computed:{
           locationList() {
              if(this.city == '도시 전체')
                 return ['지역 전체']
              else if(this.city == '서울')
                   return ['지역 전체','종로구','중구','용산구'];
                else if(this.city == '부산')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '대구')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '인천')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '광주')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '대전')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '울산')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '세종')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '경기')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '강원')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '충북')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '충남')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '전북')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '전남')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '경북')
                   return ['지역 전체','중구','서구','동구'];
                else if(this.city == '경남')
                   return ['지역 전체','중구','서구','동구'];
                else
                   return['지역 전체','제주시','서귀포시'];
             },
           totalPages() {
                return Math.ceil(this.dateList.length / this.itemsPerPage);
            }
        },
        
        methods: {
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
                const options = { year: 'numeric', month: 'long', day: 'numeric' };
                return new Date(date).toLocaleDateString('ko-KR', options);
            },
            
            formatDate2(date) {
               const options = {day: 'numeric', weekday: 'short'};
                return new Date(date).toLocaleDateString('ko-KR', options);
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
            async loadList(){
                 this.list=[];
                 this.matchDate = null;
               const url = contextPath + "/rest/matchBoard/selectList";
               const resp = await axios.get(url);
               this.list.push(...resp.data);
            },
            
         async reloadList(){
            this.list = [];
            const url = contextPath + "/rest/matchBoard/selectList";
               const resp = await axios.get(url);
               resp.data.forEach(match => {
                 if(this.matchDate != null && match.matchBoardDate != this.matchDate) return;
                 else if (this.city != '도시 전체' && match.matchBoardCity != this.city) return;
                 else if (this.location != '지역 전체' && match.matchBoardLocation != this.location) return;
                 else if (this.size != '인원수 전체' && match.matchBoardSize != this.size) return;
                   this.list.push(match);
              });
         }

        },
        
        watch:{
           city : function(){
              this.location = this.locationList[0];
              this.reloadList();
           },
           
           location : function(){
              this.reloadList();
           },
           
           size : function(){
              this.reloadList();
           },
           
           matchDate : function(){
              if(this.matchDate != null)
                 this.reloadList();
           }
           
        },
        
        mounted(){
           this.loadList();
           this.startDate = new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000);
           this.endDate = new Date(new Date().getTime() + 30 * 24 * 60 * 60 * 1000);
            this.generateDateList();
            this.updateDisplayedDateList();
        },
        
        created(){
           
        }
    }).mount("#app");
</script>
 
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>