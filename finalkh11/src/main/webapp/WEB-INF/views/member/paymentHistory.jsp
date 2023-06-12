<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	a {
		text-decoration-line: none;
	}
</style>

<div id="app">
	<div class="main-content container">
		<div class="row mt-4">
			<div class="col text-start">
				<h5>${memberId} 님의 결제 내역</h5>
			</div>
			<div class="col text-end">
				<a href="/member/mypage">마이 페이지로</a>
			</div>		
			<table class="table table-striped table-hover">
				<thead>
					<tr class="bg-dark text-light">
						<th>구장 이름</th>
						<th>가격</th>
						<th>결제 일자</th>
						<th>예약 날짜</th>
						<th>결제 방식</th>
						<th>기타</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(payment, index) in paymentList" :key="payment.paymentNo">
						<td>
							<a :href="'/ground/detail?groundNo=' + payment.reserveDto.groundNo">
							{{payment.paymentDto.paymentName}}
						</td>
						<td>{{payment.paymentDto.paymentTotal}} 원</td>
						<td>{{payment.paymentDto.paymentTime}}</td>
						<td>{{payment.reserveDto.reserveDate}}</td>
						<td>
							<span v-if="payment.paymentDto.methodType == 'CARD'">카드</span>
							<span v-else-if="payment.paymentDto.methodType == 'MONEY'">현금</span>
						</td>
						<td>
							<!-- 결제 취소 버튼 : 잔여 금액이 존재하고 결제 일자가 현재 시각보다 과거인 경우에만 표시 -->
							<a v-if="payment.paymentDto.paymentRemain > 0" 
								@click="cancelPayment(payment, $event)" 
								:href="'cancel?paymentNo=' + payment.paymentDto.paymentNo" 
								onclick="return confirm('정말 취소하시겠습니까?')">
								<i class="fa-solid fa-ban me-2"></i>결제 취소
							</a>
						</td>
	               </tr>
	           </tbody>
	       </table>
		</div>
	</div>
</div>

<script>
    Vue.createApp({
        data(){
            return {
            	memberId: memberId,
                paymentList:[],
                reserveDate: "",
            };
        },
        computed:{
            
        },
        methods:{
            async loadList(){
                const response = await axios.get(contextPath + "/rest/member/paymentHistory/member/" + this.memberId);
                this.paymentList.push(...response.data);
            },
			cancelPayment(payment, event) {
            	const paymentTime = new Date(payment.paymentTime);
            	
				if (paymentTime < new Date()) {
					alert("이미 지난 결제 일자는 결제를 취소할 수 없습니다.");
					event.preventDefault();
					return;
				}
            }
        },
        watch:{
        	
        },
        computed: {
            formattedReserveDate() {
                const reserveDate = new Date(this.payment.reserveDto.reserveDate);
                const options = {month: 'long', day: 'numeric', weekday: 'long', hour: 'numeric', minute: 'numeric'};
                return reserveDate.toLocaleDateString('ko-KR', options);
			},
        },
        mounted(){
			
        },
        created(){
            this.loadList();
        }
    }).mount("#app");
</script>