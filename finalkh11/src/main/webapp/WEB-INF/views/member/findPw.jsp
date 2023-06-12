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
    <title>비밀번호 찾기</title>

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
                                <h3 style="width: 400px;">비밀번호 찾기</h3>
                                <form action="findPw" method="post" autocomplete="off">
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <input class="form-control rounded" id="memberId" name="memberId" type="text" placeholder="아이디 입력"
                                                required>
                                                <label>아이디</label>
                                            </div>
                                        </div>
                                    </div>
        
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <input class="form-control rounded" id="memberEmail" name="memberEmail" type="text"
                                                placeholder="이메일 입력" required>
                                                <label>이메일</label>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <button type="submit" class="btn btn-outline-primary rounded btn-md w-100">임시 비밀번호 메일로 보내기</button>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${param.mode == 'error'}">
                                      <div class="row center" style=" color: red;">
                                        <h3 class="error" style="font-size:15px;">입력하신 정보와 일치하는 회원이 없습니다.</h3>
                                      </div>
                                    </c:if>


                                </form>
                            </div>
                       
                        </div>

                    </div>

                </div>
            </div>
    
            
        </div>
    
    </div>
    
</body>
</html>
