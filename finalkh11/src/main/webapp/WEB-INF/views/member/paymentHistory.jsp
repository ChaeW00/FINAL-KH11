<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<h1>결제 내역</h1>

<a href="/member/mypage">마이 페이지로</a>

<div id="app">
	<div v-for="(payment, index) in paymentList" :key="payment.paymentNo">
		<div class="row mt-2">
			<div class="mt-2">
				이름 : {{payment.paymentDto.paymentName}}
			</div>
			<div>
				가격 : {{payment.paymentDto.paymentTotal}}
			</div>
			<div>
				결제 일자 : {{payment.paymentDto.paymentTime}}
			</div>
			<div>
				예약 날짜 : {{payment.reserveDto.reserveDate}}
			</div>
			<div>
				결제 방식: 
					<span v-if="payment.paymentDto.methodType == 'CARD'">카드</span>
					<span v-else-if="payment.paymentDto.methodType == 'MONEY'">현금</span>
			</div>
			<div>
				<!-- 결제 취소 버튼 : 잔여 금액이 존재하고 결제 일자가 현재 시각보다 과거인 경우에만 표시 -->
				<a v-if="payment.paymentDto.paymentRemain > 0" @click="cancelPayment(payment, $event)" 
				:href="'cancel?paymentNo=' + payment.paymentDto.paymentNo">결제 취소</a>
			</div>
		</div>
	</div>
</div>

<!-- VueJS CDN -->
<script src="https://unpkg.com/vue@3.2.36"></script>

<!-- Axios CDN -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<!-- Lodash CDN -->
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>

<script>
	const contextPath = "${pageContext.request.contextPath}";
	const memberId = "${sessionScope.memberId}";
	const memberLevel = "${sessionScope.memberLevel}";
</script>

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
                const response = await axios.get("http://localhost:8080/rest/member/paymentHistory/member/" + this.memberId);
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