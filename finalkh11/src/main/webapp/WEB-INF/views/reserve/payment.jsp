<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="d-flex container-fluid mt-4 justify-content-center">
	<div class="row col-6" style="margin-top: 133px;">
		<form action="payment" method="post" autocomplete="off">
			<div class="p-2 fs-5 fw-bold bg-primary text-light rounded mb-4">
				<div class="mt-2 ms-3 mb-2">
					{{formatDate(date)}}
				</div>
				<div class="mt-2 ms-3 mb-2">
					{{startTime}} ~ {{endTime}}
				</div>
				<div class="mt-2 ms-3 mb-2">
					<input type="hidden" :value="name" name="item_name">
      				<span>{{name}}</span>
				</div>
			</div>
			
			<h3 class="mt-5">이용 금액</h3>
			<div class="mt-4 d-flex justify-content-end">
				<input type="hidden" :value="price" name="total_amount">
				<span class="fs-3">{{formatPrice}} 원</span>
			</div>
			
			<hr>
			
			<input type="hidden" value="${groundDto.groundNo}" name="groundNo">
			<input type="hidden" value="${scheduleDto.scheduleNo}" name="scheduleNo">
			<input type="hidden" value="${reserveDate}" name="reserveDate">
			
			<div class="mt-4">
				<h3>결제 수단</h3>
				<div class="form-check mt-4  fs-4">
					<input class="form-check-input" type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
					<label class="form-check-label" for="optionsRadios2">
						카카오페이
						<img class="ms-2" alt="카카오페이" src="/static/image/ic_kakaopay.png" width="75" height="30">
					</label>
				</div>
			</div>
			
			<div class="accordion mt-4" id="accordionExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        안내 사항
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
			      <div class="accordion-body">
			      	<div>
						<p>제시간에 경기를 마쳐 주세요. 예약 시간을 초과하지 않도록 3~5분 전에 마무리 하는 게 좋습니다.</p>
			            <p>다른 사용자나 인근 주민에게 피해를 끼치는 행동을 삼가주세요. 음식 조리, 배달 취식, 음주는 할 수 없습니다.</p>
			            <p>너무 크게 소리 지르면, 민원으로 시설 사용을 중단할 수 있습니다.</p>
			            <p>풋살화(TF)를 신고 플레이 해주세요. 풋살장에서 축구화(FG, HG, AG, MG) 착용은 나와 상대방의 부상을 유발합니다.</p>
			            <p>이용자 부주의로 시설을 파손하면, 손해배상을 청구할 수 있습니다. 이 점 유의해 주세요.</p>
			        </div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingTwo">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			        부상과 보험
			      </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
			      <div class="accordion-body">
					<div>
						<p>매치업은 상대를 배려하고, 나를 지키는 안전한 플레이를 권장합니다. 다른 사람에게 피해를 끼치는 경우 이용이 정지될 수 있습니다.</p>
						<p>경기 규칙 안에서 발생한 부상 대부분은 책임을 묻기 어렵다는 판결 사례가 많습니다.</p>
						<p>과도한 힘을 사용해 일부러 상대를 다치게 할 경우 법원이 배상을 결정한 판례가 있습니다.</p>
						<p>매치업에서 직접 운용하는 보험 상품은 없습니다. 소셜 매치 참여 전 실손의료보험 가입 여부를 확인해 주세요.</p>
						<p>실비 보험이 없다면, 스포츠 안전재단의 스포츠여행자공제(국내)와 다른 민간 보험사의 상품도 가입 가능함을 알립니다.</p>
						<p>*자주 묻는 질문에서 '부상'을 검색해 법적 보상에 대한 자세한 내용을 확인해 보세요.</p>
						<p>'보험' 키워드로 찾으면, 스포츠 동호인에게 적합한 상품 목록을 볼 수 있습니다.</p>
					</div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingThree">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
			        환불 안내
			      </button>
			    </h2>
			    <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
			      <div class="accordion-body">
			      	<div>
			            <img src="/static/image/refund.png" alt="환불 안내" class="w-100">
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			
			<div class="mt-4">
				<div class="col">
					<input type="checkbox" class="form-check-input me-2" v-model="checked"/>
					네, 위 내용을 보고 동의해요.
				</div>
			</div>
			
			<!-- 결제 버튼-->
			<div class="row mt-4 mb-4">
				<div class="col">
					<button class="btn btn-primary btn-lg w-100 rounded" :disabled="!checked" style="height:75px;">
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
            	checked: false,
            	showGuide: {
                    notice: false,
                    injury: false,
                    refund: false
                },
            };
        },
        computed:{
			formatPrice() {
				return this.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
        },
        methods:{
        	toggleGuide(section) {
                this.showGuide[section] = !this.showGuide[section];
            },
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