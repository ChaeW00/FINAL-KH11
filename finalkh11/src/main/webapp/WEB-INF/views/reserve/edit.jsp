<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${groundDto.groundName} 구장 수정</title>
	
<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-7" style="margin-top:133px;">
<!-- 		<div class="d-flex container-fluid mt-4 justify-content-center"> -->
<!-- 			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true" style="margin-top:133px;"> -->
<!-- 				<div class="carousel-indicators" > -->
<%-- 					<c:forEach var="groundImg" items="${imgList}" varStatus="status"> --%>
<!-- 						<button type="button" data-bs-target="#carouselExampleIndicators"  -->
<%-- 							data-bs-slide-to="${status.index}"<c:if test="${status.index == 0}"> class="active" aria-current="true"</c:if>  --%>
<%-- 							aria-label="Slide ${status.index + 1}"> --%>
<!-- 						</button> -->
<%-- 					</c:forEach> --%>
<!-- 				</div> -->
<!-- 				<div class="carousel-inner"> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${imgList.size() == 0}"> --%>
<!-- 							<div class="carousel-item active"> -->
<!-- 			       				<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy01.png" width="600" height="250"> -->
<!-- 			       			</div> -->
<!-- 				   			<div class="carousel-item"> -->
<!-- 				       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy02.png" width="600" height="250"> -->
<!-- 				       		</div> -->
<!-- 							<div class="carousel-item"> -->
<!-- 				       			<img alt="메인 슬라이드 이미지" class="slide-img" src="/static/image/dummy03.png" width="600" height="250"> -->
<!-- 				       		</div> -->
<%-- 			   			</c:when> --%>
<%-- 				   		<c:otherwise> --%>
<%-- 							<c:forEach var="groundImg" items="${imgList}" varStatus="status"> --%>
<%-- 								<div class="carousel-item<c:if test="${status.index == 0}"> active</c:if>"> --%>
<%-- 									<img src="/img/download/${groundImg.imgNo}" class="slide-img" alt="메인 슬라이드 이미지" width="800" height="250"> --%>
<!-- 							    </div> -->
<%-- 							</c:forEach> --%>
<%-- 				   		</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 				</div> -->
		  
<!-- 				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev"> -->
<!-- 					<span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
<!-- 					<span class="visually-hidden">Previous</span> -->
<!-- 				</button> -->
<!-- 				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next"> -->
<!-- 					<span class="carousel-control-next-icon" aria-hidden="true"></span> -->
<!-- 					<span class="visually-hidden">Next</span> -->
<!-- 				</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<div class="mt-4">
			<input type="text" name="groundName" placeholder="이름을 입력하세요" v-model="groundName">
		</div>
		<div class="mt-4">
			<select name="groundBasicAddr" v-model="groundBasicAddr">
				<option value="">선택하세요</option>
				<option>서울</option>
				<option>인천</option>
				<option>경기</option>
				<option>충북</option>
				<option>충남</option>
				<option>대구</option>
				<option>부산</option>
				<option>제주</option>
				<option>전북</option>
				<option>전남</option>
				<option>강원</option>
			</select>				
		</div>
		<div class="mt-4">
			<input type="text" name="groundDetailAddr" placeholder="상세 주소" v-model="groundDetailAddr">
		</div>
		<div>
			<input type="text" name="groundAddr" placeholder="전체 주소" v-model="groundAddr">
		</div>
		<div class="mt-4">
			<input type="text" name="groundShower" placeholder="샤워장 여부" v-model="groundShower">
			<input type="text" name="groundPark" placeholder="주차 가능 여부" v-model="groundPark">
		</div>
		<div class="mt-4">
			<input type="text" name="groundSize" placeholder="구장 크기" v-model="groundSize">
		</div>
		<div class="mt-4">
			<input type="number" name="groundPrice" placeholder="대여 가격" v-model="groundPrice">
		</div>
		<div class="mt-4">
			<div v-for="(schedule, index) in schedules" :key="index">
				<input type="hidden" v-model="scheduleNo[index]" name="scheduleNo">
				<input type="text" v-model="scheduleStart[index]" name="scheduleStart" placeholder="시작 시간">
				<input type="text" v-model="scheduleEnd[index]" name="scheduleEnd" placeholder="종료 시간">
			</div>
<!-- 			<button type="button" @click="addSchedule">스케쥴 추가</button> -->
		</div>
<!-- 		<div class="mt-4"> -->
<%-- 			<c:forEach var="groundImg" items="${imgList}" varStatus="status"> --%>
<%-- 				<input type="text" value="${groundImg.imgNo}"> --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
		<div class="mt-4">
			<div v-for="groundImg in imgList" :key="groundImg.imgNo">
				<img class="thumbnail" :src="'/img/download/' + groundImg.imgDto.imgNo" alt="이미지 섬네일" width="150" hegiht="150">
				<input class="mt-4" type="hidden" :value="groundImg.imgDto.imgNo">
				<input class="mt-4" type="text" :value="groundImg.imgDto.imgName">
				<button @click="deleteGroundImage(groundImg.imgDto.imgNo)">삭제</button>
			</div>
		</div>
		<div class="mt-4">
			<input class="form-control" type="file" name="file" id="formFile" accept=".png, .jpg" multiple @change="handleFileUpload">
		</div>
		<div class="row mt-3">
			<button type="button" class="btn btn-primary" v-on:click="edit">수정</button>
		</div>
	</div>
</div>

<script>
var schedules = [
	<c:forEach items="${schedules}" var="schedule" varStatus="status">
		{
		  "scheduleNo": "${schedule.scheduleNo}",
		  "scheduleStart": "${schedule.scheduleStart}",
		  "scheduleEnd": "${schedule.scheduleEnd}"
		}<c:if test="${not status.last}">,</c:if>
	</c:forEach>
  ];

    Vue.createApp({
        data(){
            return {
            	groundNo : "${groundDto.groundNo}",
            	groundName : "${groundDto.groundName}",
            	groundAddr : "${groundDto.groundAddr}",
            	groundBasicAddr : "${groundDto.groundBasicAddr}",
            	groundDetailAddr : "${groundDto.groundDetailAddr}",
            	groundShower : "${groundDto.groundShower}",
            	groundPark : "${groundDto.groundPark}",
            	groundSize : "${groundDto.groundSize}",
            	groundPrice : "${groundDto.groundPrice}",
            	schedules: schedules,
            	scheduleNo: [],
            	scheduleStart: [],
                scheduleEnd: [],
                imgList: [],
            };
        },
        computed:{
            
        },
        methods:{
//         	async getGroundNo(){
//         		const url = contextPath + "/rest/ground/groundNo";
//         		const resp = await axios.get(url);
//         		this.groundNo = resp.data;
//         	},
//         	async getScheduleNo(){
// 	       		const url = contextPath + "/rest/ground/scheduleNo";
// 	       		const resp = await axios.get(url);
// 	       		this.scheduleNo.push(resp.data);
//         	},
			async groundImageList() {
			    const url = contextPath + "/rest/ground/groundImageList/" + this.groundNo;
			    
			    const response = await axios.get(url);
			    this.imgList.push(...response.data);
			},
        	async editGround(){
        		const url = contextPath + "/rest/ground/editGround";
        		const data = {
					groundNo : this.groundNo,
					groundName : this.groundName,
					groundAddr : this.groundAddr,
					groundBasicAddr : this.groundBasicAddr,
					groundDetailAddr : this.groundDetailAddr,
					groundShower : this.groundShower,
					groundPark : this.groundPark,
					groundSize : this.groundSize,
					groundPrice : this.groundPrice
				}
        		await axios.put(url, data);
        	},
			async uploadImage() {
				  const url = contextPath + "/rest/ground/insertGroundImage/" + this.groundNo;
				  const formData = new FormData();

				  for (let i = 0; i < this.selectedFiles.length; i++) {
				    const file = this.selectedFiles[i];
				    formData.append('files', file);
				  }

				  formData.append('groundNo', this.groundNo);

				  await axios.post(url, formData, {
				    headers: {
				      'Content-Type': 'multipart/form-data'
				    }
				});
			},
        	async deleteGroundImage(imgNo){
        		const choice= window.confirm("정말 삭제하시겠습니까?");
        		
        		if(choice == false) return;
        		
        		const url = contextPath + "/rest/ground/deleteGroundImage/" + imgNo;
        		
        		const reponse = await axios.delete(url);
        		
        		this.imgList = this.imgList.filter((img) => img.imgNo !== imgNo);
        	},
        	async editSchedule() {
				const url = contextPath + "/rest/ground/editSchedule";

				for (let i = 0; i < this.schedules.length; i++) {
					const schedule = this.schedules[i];
        		    
        		    const data = {
						scheduleNo: schedule.scheduleNo,
						groundNo: this.groundNo,
						scheduleStart: this.scheduleStart[i],
						scheduleEnd: this.scheduleEnd[i]
        		    };
					await axios.put(url, data);
				}
			},
        	addSchedule() {
				this.schedules.push({ start: "", end: "" });
			},
			async edit(){
        		await this.editGround();
        		await this.editSchedule();
        		window.location.href = '/ground/detail?groundNo=' + this.groundNo;
        	},
            initScheduleData() {
					this.schedules.forEach((schedule) => {
					this.scheduleNo.push(schedule.scheduleNo);
					this.scheduleStart.push(schedule.scheduleStart);
					this.scheduleEnd.push(schedule.scheduleEnd);
				});
			},
        },
        watch:{
        	
        },
        mounted(){
        	this.initScheduleData();
        	this.groundImageList();
        },
        created(){
        	
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>