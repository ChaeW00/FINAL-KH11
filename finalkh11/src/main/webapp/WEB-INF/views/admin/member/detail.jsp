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
    <title>회원상세정보</title>

    <!--아이콘 CDN-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <!-- bootswatch cdn-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet" >
    
    
    <style>
        th{
            height: 20px;

        }
        td{
            height: 20px;
        }
         a {
	    text-decoration: none;
	  	}

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
                            <h1>회원 상세 정보</h1>
                        </div>
                    </div>
                    
                    <div class="row text-center">
                        <div class="col">
                            <table class="table table-hover">
                                <tbody>
                                    <tr>
                                        <th style="padding-top: 50px;">프로필사진</th>
                                        <td>
											<c:choose>
                                    			<c:when test="${dto.imgNo != 0 }">
                                        			<img alt="프로필사진" src="/img/download/${imgDto.imgNo}" width="80" height="80">
                                    			</c:when>
                                    			<c:otherwise>
                                    				<img width="80" height="80" src="/static/image/profile.png">
                                    			</c:otherwise>
                                    		</c:choose>
										</td>
                                    </tr>
                                    <tr>
                                        <th>아이디</th>
                                        <td>${dto.memberId}</td>
                                    </tr>
  								 	<tr>
                                        <th>비밀번호</th>
                                        <td>${dto.memberPw}</td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>${dto.memberName}</td>
                                    </tr>
                                    <tr>
                                        <th>등급</th>
                                        <td>${dto.memberLevel}</td>
                                    </tr>
                                    <tr>
                                        <th>성별</th>
                                        <td>${dto.memberGender}</td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>${dto.memberEmail}</td>
                                    </tr>
                                    <tr>
                                        <th>생년월일</th>
                                        <td>${dto.memberBirth}</td>
                                    </tr>
                                    <tr>
                                        <th>매너온도</th>
                                        <td>${dto.memberManner}<span>°C</span></td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-outline-primary"><a href="/admin/member/list">회원목록</a></button>
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

   

    
</body>
</html>


