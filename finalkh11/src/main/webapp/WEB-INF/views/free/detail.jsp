<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/static/css/commons.css">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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

pre {
	font-family: TheJamsil5Bold !important;
}
</style>

<div class="content__wrap" id="detail-app">
	<div class="content__header"></div>
	<div class="content__body">
		<div class="content-body__wrap">
			<section class="section">
				<div class="section__header">
					<div class="section__title">
						<h3>${freeDto.freeTitle}</h3>
					</div>
				</div>
				<div id="mnRule" class="info__list__wrapper double">
					<pre>${freeDto.freeContent}</pre>
				</div>
			</section>
			<section id="mnFeature" class="section">
				<div class="section__header">
					<div class="section__title">
						<h3>모집 정보</h3>
					</div>
					<div class="info__list__wrapper double">
						<ul>
							<li class="info__list">
								<i class="fa-solid fa-star icon"></i>
								<div><p>${freeDto.freeWriter} 님이 작성</p></div>
							</li>
							<li class="info__list">
								<i class="fa-solid fa-star icon"></i>
								<div><p>${teamDto.teamName} 팀에서 모집</p></div>
							</li>
							<li class="info__list">
								<i class="fa-solid fa-star icon"></i>
								<div><p>${freeDto.writeTime} 에 작성</p></div>
							</li>
						</ul>
					</div>
				</div>
				<div class="row"><div class="col text-end">
					<c:if test="${memberId == freeDto.freeWriter}">
						<button class="btn btn-danger" @click="deleteItem">삭제하기</button>
					</c:if>
					<button class="btn btn-secondary ms-2" @click="moveList">목록보기</button>
				</div></div>
			</section>
			<section id="chat" class="section">
				<div class="section__header">
					<div class="section__title">
						<h3>작성자와 대화</h3>
					</div>
					<div class="info__list__wrapper double">
						<div class="row mt-4">
							<div class="col-10">
								<input type="text" class="form-control rounded" placeholder="메세지 입력" v-model="freeReplyContent">
							</div>
							<div class="col-2">
								<button class="btn btn-success btn-send" v-on:click="sendReply">보내기</button>
							</div>						
						</div>
					</div>
				</div>
				<div class="section-body">
					<div v-for="(freeReply, index) in freeReplyList" v-bind:key="freeReply.freeReplyNo">
						<!-- 수정 모드 -->
						<div v-if="freeReply.edit === true">
							&lt;{{freeReply.freeReplyWriter}}&gt;
							<span v-if="freeReply.freeReplyWriter === '${freeDto.freeWriter}'">[작성자]</span>
							<br>
							<input type="text" v-model="freeReplyList[index].freeReplyContent">
							<br>
							<button v-on:click="completeEdit(index)">완료</button>
							<button v-on:click="cancelEdit(index)">취소</button>
						</div>
						<!-- 보여주기 모드 -->
						<div v-else>
							&lt;{{freeReply.freeReplyWriter}}&gt;
							<span v-if="freeReply.freeReplyWriter === '${freeDto.freeWriter}'">[작성자]</span>
							<span v-if="freeReply.freeReplyUtime != null">(수정됨)</span>
							<br>
							{{freeReply.freeReplyContent}}
							<br>
							<button v-on:click="changeToEdit(index)" v-if="isMyReply(index)">수정</button>
							<button v-on:click="deleteReply(index)" v-if="isMyReply(index)">삭제</button>
						</div>
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
							<span class="matchFee__money">10,000원</span>
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

<script>
	Vue.createApp({
		data(){
			return {
				freeReplyContent:"",//댓글 작성 내역
				freeReplyList:[],//작성된 댓글 목록
			};
		},
		methods:{
			async loadReplyData(){//목록 불러오기
				const resp = await axios.get("${pageContext.request.contextPath}/free/replyList/${freeNo}");
				this.freeReplyList.splice(0);
				this.freeReplyList.push(...resp.data);
			},
			async sendReply(){//댓글 등록
				if(this.freeReplyContent.trim().length == 0) return;
				
				const resp = await axios.post("${pageContext.request.contextPath}/free/replyInsert", {
					freeReplyContent : this.freeReplyContent,
					freeReplyOrigin : "${freeNo}"
				});
				
				this.loadReplyData();
				this.clearInput();
			},
			async deleteReply(index) {//댓글 삭제
				const choice = window.confirm("정말 댓글을 삭제하시겠습니까?");
				if(!choice) return;
				
				const freeReplyNo = this.freeReplyList[index].freeReplyNo;
				
				const resp = await axios.delete("${pageContext.request.contextPath}/free/replyDelete/" + freeReplyNo);
				
				this.loadReplyData();
			},
			clearInput() {
				this.freeReplyContent = "";
			},
			isMyReply(index) {
				const my = "${memberId}";
				return my.length >0 && this.freeReplyList[index].freeReplyWriter === my;
			},
			changeToEdit(index){
				this.freeReplyList[index].edit = true;
				this.freeReplyList[index].backup = this.freeReplyList[index].freeReplyContent;
			},
			async completeEdit(index){
				const freeReplyNo = this.freeReplyList[index].freeReplyNo;
				const freeReplyContent = this.freeReplyList[index].freeReplyContent;
				if(freeReplyContent.length == 0) return;
				
				const resp = await axios.put("${pageContext.request.contextPath}/free/replyEdit", {
					freeReplyNo : freeReplyNo,
					freeReplyContent: freeReplyContent
				});
				this.loadReplyData();
			},
			cancelEdit(index){
				this.freeReplyList[index].edit = false;
				this.freeReplyList[index].freeReplyContent = this.freeReplyList[index].backup;
			},
			moveList(){
				window.location.href = "../list";
			},
			async deleteItem(){
				const choice = window.confirm("정말 모집글을 삭제하시겠습니까?");
				if(choice == false) return;
				
				const resp = await axios.delete("${pageContext.request.contextPath}/free/delete/${freeNo}");
				this.moveList();
			},
		},
		created(){
			this.loadReplyData();
		},
	}).mount("#detail-app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>