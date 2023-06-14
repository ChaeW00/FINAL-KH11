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
    <title>아이디 찾기</title>


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
                                <h3 style="width: 400px;">아이디 찾기</h3>

                                <form action="findId" method="post">
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <input class="form-control rounded" name="memberName" type="text" placeholder="이름" 
                                                 required>
                                                <label>이름</label>

                                            </div>
                                        </div>
                                    </div>

        
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <input class="form-control rounded" name="memberEmail" type="text" 
                                                placeholder="이메일 입력" required>
                                                <label>이메일</label>

                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="form-floating">
                                                <button type="submit" class="btn btn-outline-primary rounded btn-md w-100">아이디 찾기</button>
                                            </div>
                                        </div>
                                    </div>


                                </form>
                            </div>
                            
						   
										<c:choose>
											  <c:when test="${mode == 'error'}">
											    	<h2 style="color:red; width:324px; height:300px; margin-top:630px; margin-left: 50px; font-size: medium;">일치하는 정보가 없습니다</h2>
											  </c:when>
											  <c:when test="${not empty findId}">
											    	<h2 style="width:350px; height:100px; margin-top:625px; margin-left:30px; font-size: medium;">찾으시는 아이디는 <span style="color: red;">${findId}</span>입니다.</h2>
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


