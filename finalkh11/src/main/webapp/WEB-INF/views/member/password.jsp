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
    <title>비밀번호 변경</title>


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
                           
                                <h3 style="width: 400px;">비밀번호 변경</h3>
                                <form action="password" method="post" autocomplete="off">
                                    
                                    <div class="row mt-4">
                                        <div class="col">
                                                <input class="form-control" name="currentPw" type="password" placeholder="현재 비밀번호 입력"
                                                required>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col">
                                                <input class="form-control" name="newPw" type="password" placeholder="새 비밀번호 입력"
                                                v-model="newPw" :class="checkNewPw" required>

                                                <div class="valid-feedback">올바른 비밀번호 형식입니다</div>
                                                <div class="invalid-feedback">영문 대/소문자, 숫자, 특수문자를 반드시 포함하여 8~16자로 작성하세요</div>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <button type="submit" class="btn btn-outline-primary rounded btn-md w-100" style="margin-top:30px;" :disabled="isButtonDisabled">비밀번호 변경하기</button>
                                            </div>
                                        </div>
                                    </div>


                                </form>
                            </div>

							 <c:choose>
							    <c:when test="${param.mode == 'error'}">
							        <h2 style="color:red; width:324px; height:300px; margin-top:540px; margin-left: 50px; font-size: medium;">비밀번호가 일치하지 않습니다</h2>
							    </c:when>
							    <c:otherwise>
							        <h2></h2>
							    </c:otherwise>
							</c:choose>
							                       
                        </div>

                    </div>

                </div>
            </div>
    
            
        </div>
    
    </div>
        <!-- VueJS CDN -->
    <script src="https://unpkg.com/vue@3.2.36"></script>
    <script>
        Vue.createApp({
            data(){
                return {
                    newPw:"",
                };
            },
            computed:{ //실시간 계산영역
            	checkNewPw() {
                    const regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[-A-Za-z~!@#$%^&*()_+=0-9]{8,16}$/;
                    const pwValid = regex.test(this.newPw);

                    if (this.newPw.length === 0) return "";

                    return pwValid ? "is-valid" : "is-invalid";
                },
                isButtonDisabled() {
                    return this.checkNewPw !== "is-valid";
                }

            }

        }).mount("#app");
    </script>  
    
</body>
</html>
