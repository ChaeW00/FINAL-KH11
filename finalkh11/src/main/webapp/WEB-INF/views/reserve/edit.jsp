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
		<button type="button" class="btn btn-primary" v-on:click="edit">수정</button>
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
        },
        created(){
        	
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>