<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴 완료</title>

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
        .text-size{
            font-size: small;
            margin-bottom: 5px;
        }
        .mt-2 {
            margin-top: -0.1rem !important;
        }
        a{
        text-decoration-line: none;
        color:black;
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
                            <div class="position-absolute top-50 start-50 translate-middle" style="margin-bottom: 10px;width: 600px;height: 500px;">
                                <div class="row mt-4" style="margin-top: 0px; height: 280px;">
                                    <div class="col" style="height: 200px;">
                                        <img src="/static/image/matchUp.png"">
                                        <h1>회원탈퇴가 완료되었습니다</h1>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="form-floating">
                                            <button type="button" class="btn btn-warning btn-lg" style="width: 200px; margin-right: 10px;">
	                                            <a href="/">
	                                            메인화면
	                                            </a>
                                            </button>
                                            <button type="button" class="btn btn-warning btn-lg" style="width: 200px;">
	                                            <a href="/member/join" >
	                                            회원가입
	                                            </a>
                                            </button>
                                        </div>
                                    </div>
                                </div>  

                            </div>

                            
                        </div>

                    </div>

                </div>
            </div>
    
            
        </div>
    
    </div>

    <!-- 부트스트랩 cdn -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>    
    
   
</body>
</html>

