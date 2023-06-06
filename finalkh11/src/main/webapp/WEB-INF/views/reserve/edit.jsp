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
		<form action="edit" method="post">
			<input type="hidden" name="groundNo" value="${groundDto.groundNo}">
			<div class="mt-4">
				<input type="text" name="groundName" value="${groundDto.groundName}" placeholder="이름을 입력하세요">
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
				<input type="text" name="groundDetailAddr" value="${groundDto.groundDetailAddr}" placeholder="상세 주소">
			</div>
			<div>
				<input type="text" name="groundAddr" value="${groundDto.groundAddr}" placeholder="전체 주소">
			</div>
			<div class="mt-4">
				<input type="text" name="groundShower" value="${groundDto.groundShower}" placeholder="샤워장 여부">
				<input type="text" name="groundPark" value="${groundDto.groundPark}" placeholder="주차 가능 여부">
			</div>
			<div class="mt-4">
				<input type="text" name="groundSize" value="${groundDto.groundSize}" placeholder="구장 크기">
			</div>
			<div class="mt-4">
				<input type="number" name="groundPrice" value="${groundDto.groundPrice}" placeholder="대여 가격">
			</div>
<!-- 			<div class="mt-4"> -->
<%-- 				<c:forEach items="${list}" var="schedule" varStatus="status"> --%>
<%-- 					<input type="hidden" name="schedules[${status.index}].scheduleNo" value="${schedule.scheduleNo}"> --%>
<%-- 					<input type="text" name="schedules[${status.index}].scheduleStart" value="${schedule.scheduleStart}" placeholder="시작 시간"> --%>
<%-- 					<input type="text" name="schedules[${status.index}].scheduleEnd" value="${schedule.scheduleEnd}" placeholder="종료 시간"> --%>
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
			<button type="submit" class="btn btn-primary">수정</button>
		</form>
	</div>
</div>

<script>
    Vue.createApp({
        data(){
            return {
				groundShower: false,
				groundPark: false
            };
        },
        computed:{
            
        },
        methods:{
			checkboxes() {
				if (this.groundShower) {
					
			    }
			    if (this.groundPark) {
			    	
			    }
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