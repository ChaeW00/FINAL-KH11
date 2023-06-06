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
	<div class="row col-7" style="margin-top:133px;">
		<form action="insert" method="post">
			<div class="mt-4">
				<input type="text" name="groundName" placeholder="이름을 입력하세요">
			</div>
			<div class="mt-4">
				<select name="groundBasicAddr">
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
				<input type="text" name="groundDetailAddr" placeholder="상세 주소">
			</div>
			<div>
				<input type="text" name="groundAddr" placeholder="전체 주소">
			</div>
			<div class="mt-4">
				<input type="text" name="groundShower" placeholder="샤워장 여부">
				<input type="text" name="groundPark" placeholder="주차 가능 여부">
			</div>
			<div class="mt-4">
				<input type="text" name="groundSize" placeholder="구장 크기">
			</div>
			<div class="mt-4">
				<input type="number" name="groundPrice" placeholder="대여 가격">
			</div>
			<div class="mt-4">
				<div v-for="(schedule, index) in schedules" :key="index">
					<input type="text" v-model="schedule.start" :name="'schedules[' + index + '][scheduleStart]'" placeholder="시작 시간">
					<input type="text" v-model="schedule.end" :name="'schedules[' + index + '][scheduleEnd]'" placeholder="종료 시간">
				</div>
				<button type="button" @click="addSchedule">스케쥴 추가</button>
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>
</div>

<script>
    Vue.createApp({
        data(){
            return {
           	schedules: [
           	      { start: "", end: "" }
           	    ]
            };
        },
        computed:{
            
        },
        methods:{
        	addSchedule() {
        	      this.schedules.push({ start: "", end: "" });
			}
        },
        watch:{
        	
        },
        computed: {
        	
        },
        mounted(){
        	
        },
        created(){
        	
        }
    }).mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>