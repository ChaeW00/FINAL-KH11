<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구장 등록</title>

	<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="margin-top: 133px;">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			   	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			   	<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div v-for="(image, index) in uploadedImages" :key="index" class="carousel-item" :class="{ 'active': index === 0 }">
    				<img :src="image" style="width:400px; height:200px;" class="d-block mx-auto">
  				</div>
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
	
	<div class="row" style="margin-top:133px;">
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
			<div v-for="(schedule, index) in schedules" :key="index" class="me-2">
			    <input type="text" v-model="schedule.start" name="scheduleStart" placeholder="시작 시간">
           		<input type="text" v-model="schedule.end" name="scheduleEnd" placeholder="종료 시간">
			</div>
			<button type="button" @click="addSchedule">스케쥴 추가</button>
		</div>
		<div class="mt-4">
			<img id="preview" :src="previewImage">
    		<input class="form-control" type="file" name="file" id="formFile" accept=".png,.jpg">
		</div>
		<button type="submit" class="btn btn-primary" v-on:click="write">등록</button>
	</div>
</div>

<script>
    Vue.createApp({
        data(){
            return {
            	groundName : "",
            	groundAddr : "",
            	groundBasicAddr : "",
            	groundDetailAddr : "",
            	groundShower : "",
            	groundPark : "",
            	groundSize : "",
            	groundPrice : "",
           		schedules: [],
           		scheduleNo: [],
           		uploadedImages: [],
            };
        },
        computed:{
            
        },
        methods:{
        	async getGroundNo(){
        		const url = contextPath + "/rest/ground/groundNo";
        		const resp = await axios.get(url);
        		this.groundNo = resp.data;
        	},
        	async getScheduleNo(){
	       		const url = contextPath + "/rest/ground/scheduleNo";
	       		const resp = await axios.get(url);
	       		this.scheduleNo.push(resp.data);
        	},
        	async insertGround(){
        		await this.getGroundNo();
        		const url = contextPath + "/rest/ground/insertGround";
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
        		await axios.post(url, data);
        	},
        	async insertSchedule() {
        	    const url = contextPath + "/rest/ground/insertSchedule";
        	    for (let i = 0; i < this.schedules.length; i++) {
        	    	await this.getScheduleNo();
        	    	const schedule = this.schedules[i];
        	        const data = {
        	            scheduleNo: this.scheduleNo[i],
        	            groundNo: this.groundNo,
        	            scheduleStart: schedule.start,
        	            scheduleEnd: schedule.end
        	        }
        	        await axios.post(url, data);
        	    }
        	},
        	async insertGroundImage() {
        	    const url = contextPath + "/rest/ground/insertGroundImage";
        	    for (let i = 0; i < this.schedules.length; i++) {
        	    	await this.getScheduleNo();
        	    	const schedule = this.schedules[i];
        	        const data = {
        	            scheduleNo: this.scheduleNo[i],
        	            groundNo: this.groundNo,
        	            scheduleStart: schedule.start,
        	            scheduleEnd: schedule.end
        	        }
        	        await axios.post(url, data);
        	    }
        	},
        	addSchedule() {
				this.schedules.push({ start: "", end: "" });
			},
			updatePreview(event) {
			    const file = event.target.files[0];
			    this.previewImage = URL.createObjectURL(file);
			},
			async write(){
        		await this.insertGround();
        		await this.insertSchedule();
        		window.location.href = '/ground/detail?groundNo=' + this.groundNo;
        	},
        },
        watch:{
			
        },
        mounted(){
			const fileInput = document.getElementById('formFile');
			fileInput.addEventListener('change', this.updatePreview);
        },
        created(){
        	
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>