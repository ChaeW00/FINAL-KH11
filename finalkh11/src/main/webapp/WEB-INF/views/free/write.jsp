<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-fluid" id="free-write-app">

	<div class="row"><div class="offset-sm-3 col-sm-6">
		<div class="row mt-5"><div class="col"></div></div>
		<div class="row mt-5"><div class="col"></div></div>
		<div class="row mt-5"><div class="col"></div></div>
		<div class="row mt-4"><div class="col"></div></div>
		<div class="row mt-4"><div class="col">
			<h1>용병 모집</h1>
		</div></div>
		
		<form action="write" method="post" autocomplete="off">
		
		<div class="row mt-4"><div class="col">
			<label class="col-form-label">소속팀</label>
			<select v-model="free.teamNo" class="form-select rounded">
				<option value="">선택하세요</option>
				<option v-for="(team, index) in teamList" :value="team.teamNo">{{team.teamName}}</option>
			</select>
		</div></div>
		
		<div class="row mt-4"><div class="col">
			<label class="col-form-label">제목</label>
			<input type="text" class="form-control rounded" v-model="free.freeTitle">
		</div></div>
		
		<div class="row mt-4"><div class="col">
			<label class="col-form-label">내용</label>
			<textarea class="form-control rounded" style="min-height: 200px;" v-model="free.freeContent"></textarea>
		</div></div>
		
		<div class="row mt-4"><div class="col text-end">
			<button class="btn btn-secondary" v-on:click.prevent="moveList">목록</button>
			<button class="btn btn-primary ms-2" :disabled="free.write == false" v-on:click.prevent="saveFree">등록</button>
		</div></div>
		
		</form>
	</div></div>
</div>

<script>
	Vue.createApp({
		data(){
			return {
				free:{
					freeTitle:"",
					freeContent:"",
					teamNo:"",
					get write(){
						return this.teamNo.length !== "" || this.freeTitle.length > 0 || this.freeContent.length > 0;
					},
				},
				teamList:[],
			};
		},
		methods:{
			async saveFree(){
				if(this.free.write == false) return;
				
				const choice = window.confirm("용병 모집글을 등록하시겠습니까?");
				if(choice == false) return;
				
				const resp = await axios.post("${pageContext.request.contextPath}/free/write", this.free);
				window.location.href = "./detail/" + resp.data;				
			},
			moveList(){
				if(this.free.write) {
					const choice = window.confirm("작성중인 내용이 사라집니다\n이동하시겠습니까?");
					if(choice == false) return;
				}
				
				window.location.href = "./list";
			},
			async loadTeam(){
				const resp = await axios.get("${pageContext.request.contextPath}/rest/team/teamList/${memberId}");
				this.teamList.splice(0);
				this.teamList.push(...resp.data);
			},
		},
		created(){
			this.loadTeam();
		},
	}).mount("#free-write-app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>