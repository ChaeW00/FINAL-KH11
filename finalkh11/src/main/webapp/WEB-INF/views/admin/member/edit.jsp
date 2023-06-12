<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자-회원정보수정</title>


        <!-- 폰트 css -->
     <link rel="stylesheet" type="text/css" href="/static/css/font.css">
    
    <style>
         a {
	    text-decoration: none;
	  	}

    </style>

</head>
<body>
    <div class="jcontainer" id="app">
		
        <div class="container-fluid mt-4">

            <div class="row">
                <div class="offset-md-2 col-md-8">
    
                    <!-- 문서 제목 (Jumbotron) -->
                    <div class="row text-center">
                        <div class="col">
                            <h1>회원 정보 수정</h1>
                        </div>
                    </div>
                    
                    <form action="/admin/member/edit" method="post" autocomplete="off" enctype="multipart/form-data">
                        <div class="inner">
                        
                            <div class="row text-center">
                                <div class="col">
                                    <img id="profileImg" width="120" height="120" :src="profileImg" style="margin-bottom: 80px; margin-top: 40px;">
										<span v-if="profileImg !== '/static/image/profile.png'" style="position: relative;">
										  <i class="fa-regular fa-circle-xmark" style="color: red; position: absolute; margin-left: 0px; top: 30px; right: 0px; cursor: pointer; left: 0px;" @click="resetPreview"></i>
										</span>
									<input class="form-control" type="file" name="file" id="formFile" accept=".png,.jpg" ref="fileInput" @change="handleFileChange" >
                                </div>
                            </div>

							<input name="imgNo" type="hidden" value="${memberDto.imgNo}" v-model="imgNo">

                        	<div class="row mt-3">
                                <div class="col">
                                    <label class="text-size">아이디</label>
                                    <input class="form-control rounded" name="memberId" value="${memberDto.memberId}"  readonly>
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col">
                                    <label class="text-size">비밀번호</label>
                                    <input class="form-control rounded" id="memberPw" name="memberPw" value="${memberDto.memberPw}" readonly>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div	 class="col">
                                    <label class="text-size">이름</label>
                                    <input class="form-control rounded" name="memberName" id="memberName" 
                                     v-model="memberName" :class="checkName" required >

                                    <div class="valid-feedback"></div>
                                    <div class="invalid-feedback">한글 이름 2~5자 이내로 입력해주세요.</div>
                                </div>
                            </div>

                            
                            <div class="row mt-3">
                                <div class="col">
                                    <label class="text-size">등급</label>
                 						<select class="form-select rounded" required name="memberLevel" value="${memberDto.memberLevel}">
		                                        <option value="">선택해주세요</option>
		                                        <option value="관리자">관리자</option>
		                                        <option value="매니저">매니저</option>
		                                        <option value="일반회원">일반회원</option>
	                                      </select>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col">
                                    <label class="text-size">이메일</label>
                                    <input class="form-control rounded" id="memberEmail" name="memberEmail" value="${memberDto.memberEmail}" readonly>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col">
                                    <label class="text-size">성별</label>
	                                      <select class="form-select rounded" required name="memberGender"  value="${memberDto.memberGender}">
		                                        <option value="">선택해주세요</option>
		                                        <option value="남">남</option>
		                                        <option value="여">여</option>
	                                      </select>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col">
                                    <label class="text-size">매너지수</label>
                                    <input class="form-control rounded" id="memberManner" name="memberManner" value="${memberDto.memberManner}" required>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col">
                                    <label class="text-size">생년월일</label>
                                    <input class="form-control rounded" id="memberBirth" name="memberBirth" value="${memberDto.memberBirth}" required>
                                </div>
                            </div>
                    

	                        <!-- 아웃라인 버튼 -->
	                        <div class="row mt-3">
	                            <div class="col">
	                                <button type="submit" class="btn btn-outline-primary btn-md w-100"
	                                  style="margin-top: 15px;" v-on:click="clickMessage">수정하기</button>
	                            </div>
	                        </div>
	                        
	                        <div class="row mt-2">
	                            <div class="col">
	                            	<a href="/admin/member/list">
	                                	<button type="submit" class="btn btn-outline-primary btn-md w-100"
	                                  	style="margin-top: 1px; margin-bottom: 8px;" >회원 목록
	                                  	</button>
	                                </a>  	
	                            </div>
	                        </div>
	                        
                        </div>
                    </form>        

                </div>
            </div>
    
            
        </div>
    
    </div>

    
    <!-- Axios(비동기) CDN -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <!--Lodash cdn-->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>

    <!-- VueJS CDN -->
    <script src="https://unpkg.com/vue@3.2.36"></script>
    <script>
        Vue.createApp({
            data(){
                return {
                	imgNo:"${memberDto.imgNo}",
                	memberName:"${memberDto.memberName}",
                	profileImg : "",
                	message:'정말 수정하시겠습니까?',
                };
            },
            computed:{ //실시간 계산영역
               
            },
  
            watch:{//변경될때마다 값을 업데이트
   
            },
            methods: {
            	loadImg(){ //이미지 넘버 확인해서 이미지 보여주기
            		if (this.imgNo != 0)
            			{
            			
		            		this.profileImg = "/img/download/${img.imgNo}"
            			}
            		else this.profileImg = "/static/image/profile.png"
            	},
            	
                resetPreview(){
                    this.profileImg= "/static/image/profile.png";//이미지 미리보기 초기화
                    this.imgNo = 0;
                    this.$refs.fileInput.value = ""; // 파일 선택 초기화
                },
                clickMessage(){
                	if(confirm(this.message)){
                		alert("수정하겠습니다.");
                		return true;
                	}else{
                        event.stopPropagation();
                        event.preventDefault();
                	}
                },
                
                handleFileChange(event) {// 프로필 이미지
                    const file = event.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.addEventListener('load', () => {
                        this.profileImg = reader.result;
                        });
                        reader.readAsDataURL(file);
                    }
                },
                


            },
            created(){
            	this.loadImg();
            }
            
        }).mount("#app");
    </script>

    
</body>
</html>
