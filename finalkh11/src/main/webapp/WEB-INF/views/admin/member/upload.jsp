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
    <title>메인 이미지 등록</title>


    
    
    <style>


    </style>

</head>
<body>
    <div class="jcontainer" id="app">
		
        <div class="container-fluid mt-2">

            <div class="row">
                <div class="offset-md-2 col-md-8">
                    	
                    <form action="/admin/member/upload" method="post" autocomplete="off" enctype="multipart/form-data">
                        <div class="inner">
                        
                            <div class="row text-center">
                                <div class="col">
                                    <img id="profileImg" width="120" height="120" :src="profileImg" style="margin-bottom: 80px; margin-top: 80px; width: 800px;height: 250px;" @click="resetPreview">
										<span v-if="profileImg !== '/static/image/profile.png'" style="position: relative;">
										  <i class="fa-regular fa-circle-xmark" style="color: red; position: absolute; margin-left: 0px; top: 30px; right: 0px; cursor: pointer; left: 0px;" @click="resetPreview"></i>
										</span>
									<input class="form-control" type="file" name="img" id="formFile" accept=".png,.jpg" ref="fileInput" @change="handleFileChange" >
                                </div>
                                
                            </div>

                        	<div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">제목</label>
                                    <input class="form-control rounded" name="mainTitle" required>
                                </div>
                            </div>                                        

	                        <!-- 아웃라인 버튼 -->
	                        <div class="row mt-4">
	                            <div class="col">
	                                <button type="submit" class="btn btn-outline-primary btn-md w-100"
	                                  style="margin-top: 15px;">등록하기</button>
	                            </div>
	                        </div>
	                        <div class="row mt-4">
	                            <div class="col">
	                                <a href="/admin/member/mainList"><button type="button" class="btn btn-outline-primary btn-md w-100"
	                                  style="margin-top: 1px;">목록으로 돌아가기</button></a>
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
                	profileImg : ""
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
