<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-6" style="margin-top: 133px;">
		<form action="payment" method="post" autocomplete="off">
			<div class="p-2 fs-5 fw-bold bg-primary text-light rounded mb-4">
				<div class="mt-2">
					{{formatDate(date)}}
				</div>
				<div class="mt-2">
					{{startTime}} ~ {{endTime}}
				</div>
				<div class="mt-2">
					<input type="hidden" :value="name" name="item_name">
      				<span>{{name}}</span>
				</div>
			</div>
			
			<h5 class="mt-4">이용 금액</h5>
			<div class="mt-4 d-flex justify-content-end">
				<input type="hidden" :value="price" name="total_amount">
				<span class="fs-5">{{formatPrice}} 원</span>
			</div>
			<input type="hidden" value="${groundDto.groundNo}" name="groundNo">
<%-- 			<input type="hidden" value="${reserveNo}" name="item_code"> --%>
			<input type="hidden" value="${scheduleDto.scheduleNo}" name="scheduleNo">
			<input type="hidden" value="${reserveDate}" name="reserveDate">
			<h5 class="mt-4">환불 안내</h5>
			
			<p>니어리ㅏㅓㄴ이ㅏ러ㅣ나더ㅣㅏ너라ㅣ</p>
			
			<div class="mt-2">
				<div class="col">
					<input type="checkbox" class="form-check-input" v-model="checked"/>
					네, 위 내용을 보고 동의해요.
				</div>
			</div>
			
			<!-- 결제 버튼-->
			<div class="row mt-4">
				<div class="col">
					<button class="btn btn-primary w-100 rounded" :disabled="!checked">
						<span class="fs-5">{{formatPrice}} 원 결제하기</span>
					</button>
				</div>
			</div>
			
		</form>
	</div>
</div>

<script>
    Vue.createApp({
        data(){
            return {
            	reserveDate: "${reserveDate}",
            	name: "${groundDto.groundName}",
            	startTime : "${scheduleDto.scheduleStart}",
            	endTime : "${scheduleDto.scheduleEnd}",
            	price : "${groundDto.groundPrice}",
            	checked: false
            };
        },
        computed:{
			formatPrice() {
				return this.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
        },
        methods:{
            formatDate(date) {
                const options = {month: 'long', day: 'numeric', weekday: 'long'};
                const formattedDate = new Date(this.reserveDate).toLocaleDateString('ko-KR', options);
                return formattedDate;
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