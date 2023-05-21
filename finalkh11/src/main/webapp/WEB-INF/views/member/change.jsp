<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/member/mypageHeader.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <!--아이콘 CDN-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <!-- bootswatch cdn-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet" >
    
    
    <style>


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
                    
                    <form action="join" method="post" autocomplete="off" enctype="multipart/form-data">
                        <div class="inner">
                        
                            <div class="row text-center">
                                <div class="col">
                                    <img id="preview" width="120" height="120" :src="previewImage" style="margin-bottom: 10px;">
                                    <input class="form-control" type="file" name="file" id="formFile" accept=".png,.jpg" @change="handleFileChange">
                                </div>
                            </div>


                        	<div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">아이디</label>
                                    <input class="form-control rounded" name="memberName" type="text"
                                    v-model="memberName" :class="checkName" readonly>
                                </div>
                            </div>   

                            
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">이메일</label>
                                    <input class="form-control rounded" id="memberEmail" name="memberEmail" type="text" v-model="memberEmail"
                                     :class="checkEmail" @blur="EmailCheck" required>
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">비밀번호 확인</label>
                                    <input class="form-control" name="memberPw" type="password" placeholder="비밀번호 입력"
                                    v-model="memberPw" :class="checkPw" required>
                                </div>
                            </div>
                         
                            
                            
                    

                        <!-- 아웃라인 버튼 -->
                        <div class="row mt-4">
                            <div class="col">
                                <button type="submit" disabled class="btn btn-outline-primary btn-md w-100"
                                 v-bind:class="!allCheck">수정하기</button>
                            </div>
                        </div>
                    </form>        

                </div>
            </div>
    
            
        </div>
    
    </div>

    <!-- 부트스트랩 cdn -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>    
    
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
                    previewImage:"/static/image/profile.png",
                };
            },
            computed:{ //실시간 계산영역
                
            },
  
            watch:{//변경될때마다 값을 업데이트
   
            },
            methods: {
                handleFileChange(event) {// 프로필 이미지
                    const file = event.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.addEventListener('load', () => {
                        this.previewImage = reader.result;
                        });
                        reader.readAsDataURL(file);
                    }
                },


            }
        }).mount("#app");
    </script>

    
</body>
</html>


