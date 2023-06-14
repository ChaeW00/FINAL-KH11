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
    <title>회원탈퇴</title>


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
    <div class="jcontainer">
		
        <div class="container-fluid mt-2">

            <div class="row">
                <div class="offset-md-2 col-md-8">
                     <!-- 문서 제목 (Jumbotron)-->
                    <div class="row text-center">

                        <div>
                            <div class="position-absolute top-50 start-50 translate-middle">
                                <h1 style="width: 350px; text-align: center;" >회원탈퇴</h1>             
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <h5 style="font-size: 12px;">탈퇴하시려면 비밀번호를 입력해주세요</h5>
                                            </div>
                                        </div>
                                    </div>
									<form action="exit" method="post">
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <input class="form-control ${param.mode == 'error' ? 'is-invalid' : ''}" name="memberPw" type="password" placeholder="현재 비밀번호 입력" required>
												<label>비밀번호</label>
												<div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
												<c:if test="${param.mode == 'error'}">
												    <script>
												        document.querySelector('input[name="memberPw"]').classList.add('is-invalid');
												    </script>
												</c:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <button type="submit" class="btn btn-outline-primary rounded btn-md w-100">탈퇴</button>
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

    
    <!-- Axios(비동기) CDN -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <!--Lodash cdn-->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>

    
</body>
</html>


