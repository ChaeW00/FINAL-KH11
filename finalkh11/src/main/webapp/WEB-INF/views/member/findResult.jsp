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
    <div class="jcontainer">
        <div class="container-fluid mt-2">
            <div class="row text-center">
                <div>
                    <div class="position-absolute top-50 start-50 translate-middle">
                        <a href="/"><img src="/static/image/matchUp.png" style="width: 400px; height: 130px; margin-bottom: 20px;"></a>
                        <h2 style="font-size: large;">임시비밀번호가 고객님의 이메일로 발송되었습니다.</h2>
                        <h2 style="font-size: medium;">로그인 후 원하는 비밀번호로 변경해주시기 바랍니다.</h2>
                            <div class="row mt-4">
                                <div class="col">
                                    <div class="row center">
                                        <button type="button" class="btn btn-outline-primary rounded btn-md w-40"><a href="/member/login">로그인 하러가기</a></button>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
