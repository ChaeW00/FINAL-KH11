<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
<!--      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/cosmo/bootstrap.min.css"> -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

	<style>
		.carousel-control-prev-icon,
		.carousel-control-next-icon {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		}
		
		.carousel-control-prev {
		  left: 50%;
		  transform: translate(-1120%, -260%);
		}

		.carousel-control-next {
		  right: 50%;
		  transform: translate(1120%, -260%);
		}
		
		.contain {
  			border: 2px solid red;
  			background-color: white;
  			color: red;
  			padding: 10px;
		}
		
		.contain2 {
			border : 2px solid red;
			background-color: red;
			color: white;
			padding: 10px;
		}
      </style>
      
            <!-- 슬라이드 (slide) -->
    <div id="app">
  <div class="container-fluid mt-4">
    	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true" style="margin-top:133px;">
	  <div class="carousel-indicators" >
		<c:forEach var="mainImg" items="${mainImgList}" varStatus="status">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}"<c:if test="${status.index == 0}"> class="active" aria-current="true"</c:if> aria-label="Slide ${status.index + 1}"></button>
		</c:forEach>
	  </div>
	  <div class="carousel-inner">
	  	<c:choose>
	   		<c:when test="${mainImgList.size() == 0}">
	   			<div class="carousel-item active">
	       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy01.png" width="800" height="250">
	       		</div>
	   			<div class="carousel-item">
	       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy02.png" width="800" height="250">
	       		</div>
				<div class="carousel-item">
	       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy03.png" width="800" height="250">
	       		</div>
	   		</c:when>
	   		<c:otherwise>
				<c:forEach var="mainImg" items="${mainImgList}" varStatus="status">
				    <div class="carousel-item<c:if test="${status.index == 0}"> active</c:if>">
				        <img src="/img/download/${mainImg.imgDto.imgNo}" class="slide-img" alt="메인 슬라이드 이미지" width="800" height="250">
				        <!-- 경로를 저렇게 쓴 이유는 imgRestController에 내가 //다운로드 (이미지 미리보기를 하고싶으면 작성해야하는 코드)
				@GetMapping("/download/{imgNo}") 이렇게 적었기 때문 -->
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

    <div class="row mt-4">
      <div class="offset-md-2 col-md-8">
        <button v-if="memberId" class="btn btn-primary mt-2" style="float: right;">글쓰기</button>
        <div class="slider"></div>
        <div class="row mt-4">
          <div class="col">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th><p class="boardInfo2" style="text-align: center;">모집현황</p></th>
                  <th><p class="boardInfo2" style="text-align: center;">제목</p></th>
                  <th><p class="boardInfo2" style="text-align: center;">작성 시각</p></th>
                  <th><p class="boardInfo2" style="text-align: center;">작성자</p></th>
                  <th><p class="boardInfo2" style="text-align: center;">조회수</p></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="matchWithMember in list" :key="matchWithMember.matchBoardDto.matchBoardNo" v-on:click="goToDetail(matchWithMember.matchBoardNo)">
    					<td>
        					<div v-if="matchWithMember.matchBoardDto.matchBoardStatus === '모집중'">
            					<p class="boardInfo contain" style="font-weight: bold; text-align: center;">{{ matchWithMember.matchBoardDto.matchBoardStatus }}</p>
        					</div>
        					<div v-else-if="matchWithMember.matchBoardDto.matchBoardStatus === '모집마감'">
            					<p class="boardInfo contain2" style="font-weight: bold; text-align: center;">{{ matchWithMember.matchBoardDto.matchBoardStatus }}</p>
        					</div>
    					</td>
    					<td>
        					<p class="boardInfo">
        					<a :href="'detail?matchBoardNo=' + matchWithMember.matchBoardDto.matchBoardNo" style="text-decoration: none; color: black; font-weight: bold; text-align: center;">
            					{{ matchWithMember.matchBoardDto.matchBoardTitle }} ({{ matchWithMember.matchBoardDto.matchBoardCity }} {{ matchWithMember.matchBoardDto.matchBoardLocation }} {{ formatDate(matchWithMember.matchBoardDto.matchBoardDate) }} 
            					{{ matchWithMember.matchBoardDto.matchBoardTime2 }} {{ matchWithMember.matchBoardDto.matchBoardAge }}대 {{ matchWithMember.matchBoardDto.matchBoardSize }}vs{{ matchWithMember.matchBoardDto.matchBoardSize }}) <!-- ({{ matchWithMember.matchBoardDto.matchBoardReply }}) -->
        					</a></p>
    					</td>
    					<td>
        					<p class="boardInfo" style="text-align: center;">{{ getMatchBoardTimeAuto(matchWithMember.matchBoardDto.matchBoardTime) }}</p>
    					</td>
    					<td>
        					<p class="boardInfo" style="text-align: center;">{{ matchWithMember.memberDto.memberName }}</p>
    					</td>
    					<td>
        					<p class="boardInfo" style="text-align: center;">{{ matchWithMember.matchBoardDto.matchBoardRead }}</p>
    					</td>
					</tr>
              </tbody>
            </table>
          </div>
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
            	list: [],
            };
        },
        
        computed:{
       		
        },
        
        methods: {
            getMatchBoardTimeAuto(time) {
                const now = new Date();
                const write = new Date(time);
                const f = new Intl.DateTimeFormat("ko", { hour: "numeric", minute: "numeric" });

                if (now.toDateString() === write.toDateString()) {
                    return f.format(write); // "HH:mm"
                } else {
                    return write.toLocaleDateString("ko-KR", { year: "numeric", month: "2-digit", day: "2-digit" }); // "yy-MM-dd"
                }
            },
            
            formatDate(date) {
                const options = { year: 'numeric', month: 'long', day: 'numeric' };
                return new Date(date).toLocaleDateString('ko-KR', options);
            },
            
            async loadList(){
            	const url = contextPath + "/rest/matchBoard/selectList";
            	const resp = await axios.get(url);
            	this.list.push(...resp.data);
            },

        },
        
        watch:{
        	
        },
        
        mounted(){
        	this.loadList();
        },
        
        created(){
        	
        }
    }).mount("#app");
</script>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>