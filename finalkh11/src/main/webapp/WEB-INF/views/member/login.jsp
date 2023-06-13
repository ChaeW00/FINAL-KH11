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
    <title>로그인</title>


        <!-- 폰트 css -->
     <link rel="stylesheet" type="text/css" href="/static/css/font.css">
    
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
                                <a href="/"><img src="/static/image/logo.png" style="width: 400px; height: 130px;"></a>

                                <form action="login" method="post">
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                            	<c:choose>
													<c:when test="${cookie.saveId == null}">
                                                		<input type="text" class="form-control rounded" placeholder="아이디" required id="memberId" name="memberId">
                                                	</c:when>
                                                	<c:otherwise>
                                                		<input type="text" class="form-control rounded" placeholder="아이디" required id="memberId" name="memberId" value="${cookie.saveId.value}">
                                                	</c:otherwise>
                                                </c:choose>
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
												<div class="form-check text-start">
							                        <c:choose>
							                            <c:when test="${cookie.saveId == null}">
							                                <input type="checkbox" name="checked" class="form-check-input" id="rememberId">
							                                <label class="form-check-label" for="rememberId">아이디 기억하기</label>
							                            </c:when>
							                            <c:otherwise>
							                                <input type="checkbox" name="checked" class="form-check-input" id="rememberId" checked>
							                                <label class="form-check-label" for="rememberId">아이디 기억하기</label>
							                            </c:otherwise>
							                        </c:choose>
												</div>
											</div>
										</div>
									</div>

                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <button type="submit" class="btn btn-outline-primary btn-lg rounded btn-md w-100">로그인</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <a class="text-primary me-2" href="/member/findId">아이디 찾기</a> |
                                                <a class="text-primary ms-2 me-2" href="/member/findPw">비밀번호 찾기</a> |
                                                <a class="text-primary ms-2" href="/member/join">이메일로 회원가입</a>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>

                            
                        </div>

                    </div>


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
