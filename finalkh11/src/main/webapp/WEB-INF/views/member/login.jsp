<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
        .jcontainer{
            clear: both;
            margin: 0 auto;
            width: 100%;
            zoom: 1;
            width:650px;
        }
        .top-50 {
            top: 45%!important;
        }
        a{
            text-decoration-line: none;
        }


    </style>

</head>
<body>
    <div class="jcontainer" id="app">
		
        <div class="container-fluid mt-2">

            <div class="row">
                <div class="offset-md-2 col-md-8">
                     <!-- 문서 제목 (Jumbotron)-->
                    <div class="row text-center">

                        <div>
                            <div class="position-absolute top-50 start-50 translate-middle">
                                <a href="/"><img src="/static/image/matchUp.png" style="width: 400px; height: 130px;"></a>

                                <form action="login" method="post">
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <input type="text" class="form-control rounded" placeholder="아이디" required id="memberId" name="memberId">
                                                <label>ID</label>
                                            </div>
                                        </div>
                                    </div>
        
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <input type="password" class="form-control rounded" placeholder="비밀번호" required id="memberPw" name="memberPw">
                                                <label>PW</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <button type="submit" class="btn btn-outline-primary rounded btn-md w-100">로그인</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <a href="#">아이디찾기</a> |
                                                <a href="#">비밀번호찾기</a> |
                                                <a href="#">이메일로 회원가입</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <span style="font-size:14px">SNS계정으로 간편 로그인/회원가입</span>
                                            </div>
                                            <div style="margin-top:10px;">
                                                <a><img src="/static/image/kakao.png" style="margin-right: 10px;"></a>
                                                <a><img src="/static/image/google.png"></a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            
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
                return{
                    
                };
            },
            computed:{

            },
            methods:{
           
            },
            shuffle(){
                
            },
            created(){
               
            },
        }).mount("#app");
    </script>
</body>
</html>
