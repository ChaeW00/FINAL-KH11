<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/static/css/commons.css">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<header>
<style>
body {
	padding-top: 120px;
}
.content__wrap {
    margin: 0 auto;
    background-color: #F2F5F7;
}
@media (min-width: 720px){
.content__body {
    display: flex;
    max-width: 1024px;
    margin: 0 auto;
}
}
@media (min-width: 720px){
.content-body__wrap {
    width: 100%;
}
}
.content-body__wrap {
    background-color: white;
}
@media (min-width: 1024px){
.content-body__wrap .section {
    border-bottom: 20px solid #F2F5F7;
}
}
@media (min-width: 720px){
.section {
    padding: 40px;
}
}
.section {
    margin-bottom: 20px;
    background-color: white;
    padding: 30px 20px;
}
.section__header {
    padding-bottom: 20px;
}
.section__title {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;
}
.info__list__wrapper {
    margin-bottom: 10px;
}
.info__list__wrapper.double ul li {
    width: 48%;
    display: inline-block;
}
.info__list__wrapper .info__list {
    padding: 10px 0px;
    display: flex;
}
.info__list__wrapper ul li .icon {
    display: inline-block;
    padding-right: 0px;
}
.info__list__wrapper .info__list i {
    padding-right: 10px;
    height: fit-content;
    width: 24px;
    height: 24px;
}
i {
    vertical-align: middle;
}
.info__list__wrapper ul li div {
    display: inline-block;
    padding-left: 10px;
}
.section-pc {
    display: none;
    padding: 30px 20px;
}
@media (min-width: 720px){
.section-pc, .section-pc--wide {
    display: block;
}
}

.matchTime {
    font-weight: 700;
    font-size: 16px;
    line-height: 150%;
    margin-right: 3px;
}
.matchPlace {
    padding-bottom: 20px;
}
.matchPlace h1 {
    margin-right: 3px;
}
@media only screen and (min-width: 1024px){
.txtH {
    font-size: 32px;
}
}
.w700h {
    color: #1570FF;
    font-weight: 700;
}
.txtH {
    font-size: 24px;
}
.matchPlace h1 a {
    color: #282B33;
    font-size: 22px;
    line-height: 120%;
    word-break: keep-all;
    font-weight: 400;
}
.stadium-info__address {
    font-size: 14px;
    line-height: 120%;
    margin-right: 4px;
}
.stadium-info__address--copy {
    font-size: 14px;
    line-height: 120%;
    color: #727F88;
    text-decoration: underline;
    margin-right: 4px;
}
.stadium-info__address--map {
    font-size: 14px;
    line-height: 120%;
    color: #727F88;
    text-decoration: underline;
}
.matchPlace .match-data {
    font-size: 12px;
    display: inline-flex;
    align-items: center;
    margin-right: 8px;
}
.matchPlace .match-data i {
    margin-right: 5px;
    width: 16px;
}
.match-info__fee {
    padding-top: 20px;
    border-top: 1px solid #eeeeee;
}
.match-info__fee>div {
    margin-bottom: 10px;
}
.matchFee {
    margin-top: 15px;
    color: #727F88;
    font-size: 18px;
}
.matchFee__money {
    font-size: 18px !important;
    color: #282B33;
    font-weight: 700;
}
.matchFee span {
    font-size: 12px;
}
.match-apply__wrap {
    position: sticky;
    bottom: 0;
    width: 100%;
    z-index: 10;
}
@media (min-width: 1024px){
.match-apply__wrap {
    position: initial;
    max-width: 340px;
    margin: 0 auto;
    left: 0;
    right: 0;
    background-color: white;
    padding: 20px;
}
}

.content-right-body__wrap--sticky {
    position: fixed;
    bottom: 0;
    width: 100%;
    height: fit-content;
    background-color: white;
    z-index: 10;
}
@media (min-width: 720px){
.content-right-body__wrap--sticky {
    width: 60%;
    min-width: 380px;
    margin-left: 10px;
    height: fit-content;
    position: sticky;
    position: -webkit-sticky;
    top: 10px;
    z-index: 3;
}
}
.match-apply__button {
    display: flex;
    align-items: center;
    padding: 15px 20px;
    border-top: 1px solid #C4CDD4;
}
@media (min-width: 1024px){
.match-apply__button {
    padding: 15px 0px;
}
}
p {
    margin: 0;
    padding: 0;
    word-break: break-all;
}
.match-apply__button-text {
    font-size: 13px;
    line-height: 150%;
}
.match-apply__wrap .btnWrap {
    margin: 0;
    display: flex;
    justify-content: space-between;
    margin-left: 26px;
}
.match-apply__wrap .btnWrap button {
    margin: 0;
    border-radius: 10px;
    padding: 12px;
}
.btn.apply_full {
    background-color: #D9E0E6;
    width: 100%;
    font-size: 16px;
    margin: 0 auto;
    padding: 20px;
    border-radius: 0;
    color: #ffffff;
}
.btn {
    width: 100%;
    background-color: #3540A5;
    color: white;
    border-radius: 6px;
    border: none;
    box-shadow: none;
    padding: 15px 10px;
    -webkit-transition: background-color 0.3s ease-out;
    -moz-transition: background-color 0.3s ease-out;
    -o-transition: background-color 0.3s ease-out;
    transition: background-color 0.3s ease-out;
    -webkit-appearance: none;
    display: block;
    text-align: center;
    cursor: pointer;
}
</style>

	<script type="text/template" id="message-template">
		<div class="message">
			<h2 class="memberId">보낸사람</h2>
			<p class="content">내용</p>
			<span class="time">HH:mm</span>
		</div>
	</script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>

	<script>
		$(function(){
			const url = "${pageContext.request.contextPath}/ws/free";
			window.socket = new SockJS(url);
			
			window.socket.onopen = function(){		
				const room = JSON.parse('${writer}');
				console.log(room);
				const data = {type : 2, room : room};

				window.socket.send(JSON.stringify(data));
				$("<p>").text("서버에 연결되었습니다")
							.appendTo(".message-wrapper");
			}
			window.socket.onclose = function(){
				$("<p>").text("서버와의 연결이 종료되었습니다")
							.appendTo(".message-wrapper");
			};
			window.socket.onerror = function(){
				$("<p>").text("서버와의 연결 오류가 발생했습니다")
							.appendTo(".message-wrapper");
			};
			window.socket.onmessage = function(e){
				//수신한 데이터(e.data)가 JSON 문자열 형태이므로 해석 후 처리
				const data = JSON.parse(e.data);
				const time = moment(data.time).format("HH:mm");
				//const time = moment(data.time).fromNow();
				console.log(data);
				var template = $("#message-template").html();
				var html = $.parseHTML(template);
				$(html).find(".memberId").text(data.memberId);
				$(html).find(".content").text(data.content);
				$(html).find(".time").text(time);
				
				switch(data.memberLevel) {
				case "우수회원": 
					$(html).find(".memberId").css("color", "dodgerblue"); 
					break;
				case "관리자":
					$(html).find(".memberId").css("color", "firebrick");
					break;
				}
				
				$(".message-wrapper").append(html);
			};
			
			$(".btn-send").click(function(){
				const text = $(".user-input").val();
				if(text.length == 0) return;
				
				//window.socket.send(text); //일반 텍스트
				
				//<자바스크립트에서 JSON을 처리하는 명령>
				//JSON.stringify(객체) ---> 객체를 JSON 문자열로 변환
				//JSON.parse(JSON문자열) ---> JSON 문자열을 객체로 변환
				const data = {type:1, content:text};
				window.socket.send(JSON.stringify(data));
				
				$(".user-input").val("");//입력창 초기화
			});
		})
	</script>

</header>
<body>
	<div class="content__wrap">
		<div class="content__header"></div>
		<div class="content__body">
			<div class="content-body__wrap">
				<section class="section">
					<div class="section__header">
						<div class="section__title">
							<h3>매치 포인트</h3>
						</div>
					</div>
					<div id="mnRule" class="info__list__wrapper double">
						<ul>
							<li class="info__list">
								<i class="fa-solid fa-star icon"></i>
								<div><p>모든 레벨</p></div>
							</li>
							<li class="info__list">
								<i class="fa-solid fa-star icon"></i>
								<div><p>남녀 모두</p></div>
							</li>
							<li class="info__list">
								<i class="fa-solid fa-star icon"></i>
								<div><p>${freeDto.freeNo}</p></div>
							</li>
							<li class="info__list">
								<i class="fa-solid fa-star icon"></i>
								<div><p>모든 레벨</p></div>
							</li>
						</ul>
					</div>
				</section>
				<section id="mnFeature" class="section">
					<div class="section__header">
						<div class="section__title">
							<h3>경기장 정보</h3>
						</div>
						<div class="info__list__wrapper double">
							<ul>
								<li class="info__list">
									<i class="fa-solid fa-star icon"></i>
									<div><p>${freeDto.freeWriter}</p></div>
								</li>
								<li class="info__list">
									<i class="fa-solid fa-star icon"></i>
									<div><p>??</p></div>
								</li>
								<li class="info__list">
									<i class="fa-solid fa-star icon"></i>
									<div><p>??</p></div>
								</li>
							</ul>
						</div>
					</div>
				</section>
				<section id="chat" class="section">
					<div class="section__header">
						<div class="section__title">
							<h3>작성자와 대화</h3>
						</div>
						<div class="info__list__wrapper double">
							<div class="message-wrapper"></div>
							<input type="text" class="user-input">
							<button class="btn-send">전송</button>
							
						</div>
					</div>
				</section>
			</div>
			<div class="content-right-body__wrap--sticky">
				<div class="section-pc">
					<div class="matchTime">5월 29일</div>
					<div class="matchPlace">
						<h1 class="txtH w700h">
							<a href="#">서울 영등포구 풋살파크</a>
						</h1>
						<div class="wtgTool">
							<span class="stadium-info__address">서울 영등포구 선유로</span>
							<span id="copy-url1" class="stadium-info__address--copy">주소 복사</span>
							<span id="toggleMap" onclick="showMap()" class="stadium-info__address--map">지도 보기</span>
						</div>
						<div style="margin-top: 10px; display:flex;">
							<span class="match-data">
								<i class="fa-solid fa-star icon"></i>
								263
							</span>
							<span class="match-data">
								<i class="fa-solid fa-star icon"></i>
								1
							</span>
						</div>
					</div>
					<div class="match-info__fee">
						<div class="matchFee">
							<div>
								<span class="matchFee__money">10,00원</span>
								<span> / 2시간</span>
							</div>
						</div>
						<div>
							<p style="color: rgb(255, 77, 55); font-size: 12px;">매치 시작 10분 전 신청이 마감돼요</p>
						</div>
					</div>
				</div>
				<div class="match-apply__wrap">
					<div class="match-apply__button">
						<div>
							<p class="match-apply__button-text">
								<font style="color: rgb(21, 112, 255); font-weight: 700; border-bottom: 2px solid;">다음 일정을 미리 예약</font>하세요
							</p>	
							<p style="font-size: 12px;">2일 전까지 무료 취소</p>
						</div>
						<div class="btnWrap" style="width: 144px;">
							<button type="button" class="btn apply_full"><p>신청 마감</p></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>