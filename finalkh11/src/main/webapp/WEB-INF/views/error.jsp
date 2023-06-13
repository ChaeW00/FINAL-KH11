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
    <title>ERROR 페이지</title>

    <!--아이콘 CDN-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

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
                    <div class="row text-center">
                        <div>
                            <div class="position-absolute top-50 start-50 translate-middle">
                                <div class="col">
                                    <div class="form-floating mb-4">
                                       <h1>ERROR 발생!</h1>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-floating">
                                        <P>페이지를 찾을 수 없습니다.<br>
                                            존재하지 않는 주소를 입력하셨거나,<br>
                                            요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.<br>
                                            혹은 권한이 없습니다.</P>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-floating">
                                       <img src="/static/image/error.png" style="width:900px; height:480px;">
                                    </div>
                                </div>    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!--Lodash cdn-->
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>

</body>
</html>