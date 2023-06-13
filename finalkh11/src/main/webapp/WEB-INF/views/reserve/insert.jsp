<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.custom-input {
  		width: 300px;
	}
</style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구장 등록</title>

	<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
		<div class="col-4" style="margin-top:133px;">
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
						<input type="text" class="form-control rounded" name="groundName" placeholder="#" v-model="groundName">
						<label>구장 이름 *</label>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
						<select class="form-select" name="groundBasicAddr" v-model="groundBasicAddr">
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
						<label>도시 *</label>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
						<input type="text" class="form-control rounded" name="groundDetailAddr" placeholder="#" v-model="groundDetailAddr">
						<label>지역 *</label>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
						<input type="text" class="form-control rounded" name="groundAddr" placeholder="#" v-model="groundAddr">
						<label>전체 주소 *</label>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
						<input type="text" class="form-control rounded" name="groundShower" class="me-2" placeholder="#" v-model="groundShower">
						<label>샤워장 여부</label>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
						<input type="text" class="form-control rounded" name="groundPark" placeholder="#" v-model="groundPark">
						<label>주차장 여부</label>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
						<input type="text" class="form-control rounded" name="groundSize" placeholder="#" v-model="groundSize">
						<label>크기</label>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
						<input type="number" class="form-control rounded" name="groundPrice" placeholder="대여 가격" v-model="groundPrice">
						<label>대여 가격 *</label>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<label>스케쥴 *</label>
				<div v-for="(schedule, index) in schedules" :key="index">
					<div class="mt-4">
					    <input type="text" class="me-2" v-model="schedule.start" name="scheduleStart" placeholder="시작 시간">
					    -				
		           		<input type="text" class="ms-2 me-4" v-model="schedule.end" name="scheduleEnd" placeholder="종료 시간">
		           		<button type="button" class="btn btn-danger" @click="deleteSchedule(index)" v-if="index > 0">
		           			<i class="fa-solid fa-delete-left me-2"></i>제거
		           		</button>
					</div>
				</div>
				<div class="mt-4">
					<button type="button" class="me-3 btn btn-primary" @click="addSchedule"><i class="fa-solid fa-plus me-2"></i>추가</button>
				</div>
			</div>
			<div class="mt-4">
				<div class="mt-3" v-for="(file, index) in selectedFiles" :key="index" class="preview-image">
					<img class="me-4" :src="getFileUrl(file)" alt="미리보기" width="100" hegiht="100">
					<span class="me-4">{{file.name}}</span>
					<button type="button" class="btn btn-danger" @click="removeFile(index)"><i class="fa-solid fa-delete-left me-2"></i>제거</button>
				</div>
			</div>
			<div class="row mt-4">
		   		<input class="form-control" type="file" name="file" id="formFile" accept=".png, .jpg, .jpeg" multiple @input="handleFileUpload">
			</div>
			<div class="mt-4">
				<button type="submit" class="btn btn-primary w-100" v-on:click="write"><i class="fa-solid fa-plus me-2"></i>등록</button>
			</div>
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
           		schedules: [{ start: "", end: "" }],
           		scheduleNo: [],
           		selectedFiles : [],
            };
        },
        computed: {
        	
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
        	updatePreview(event) {
        		const files = event.target.files; // 선택한 모든 파일들

        	    for (let i = 0; i < files.length; i++) {
        	      const file = files[i];
        	      const imageURL = URL.createObjectURL(file);
        	      const item = {
        	        id: Date.now(),
        	        url: imageURL,
        	      };
        	      this.uploadedItems.push(item);
        	    }
			},
        	addSchedule() {
				this.schedules.push({ start: "", end: "" });
			},
			deleteSchedule(index) {
				if (index >= 0 && index < this.schedules.length) {
				  this.schedules.splice(index, 1);
				}
			},
			handleFileUpload(event) {
				const files = event.target.files;
				for (let i = 0; i < files.length; i++) {
				      this.selectedFiles.push(files[i]);
				}
			},
			getFileUrl(file) {
			    return URL.createObjectURL(file);
			},
			removeFile(index) {
			    this.selectedFiles.splice(index, 1);
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
			async write(){
				if (!this.groundName || !this.groundBasicAddr || !this.groundDetailAddr || !this.groundAddr || !this.groundPrice) {
					alert("필수 항목을 입력하세요.");
                    return;
                }
        		await this.insertGround();
        		await this.insertSchedule();
				if (this.selectedFiles.length > 0) {
	        		await this.uploadImage();
				}
        		window.location.href = '/ground/detail?groundNo=' + this.groundNo;
        	},
        },
        watch:{
			
        },
        mounted(){
        	
        },
        created(){
        	
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>