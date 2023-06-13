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
    <title>관리자 전용 마이페이지</title>

    <!--아이콘 CDN-->
<!--     <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"> -->
    <!-- bootswatch cdn-->
<!--     <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/sandstone/bootstrap.min.css" rel="stylesheet" > -->
    <!-- mypage 전용 css -->
    <link rel="stylesheet" type="text/css" href="/static/css/mypage.css">
    
    <!-- mypage 온도 전용 css -->
    <link rel="stylesheet" type="text/css" href="/static/css/temp.css">
    
    <style>
   
    </style>

</head>
<body>
    <div class="content" id="app" style="margin-top:200px; margin-bottom:80px;">
        <div class="col-md-7 ms-4">
        
        <div class="content_wrap">
            <div class="content_body content_body__double">
                <div class="content-body_left-wrap">
                    <section>	
                        <div style="display: flex; justify-content: space-between;">
                            <div class="my-profile">	
                                <div style="display: flex;">
                                    <div id="article-profile-image">
                                    	<c:choose>
                                    		<c:when test="${dto.imgNo != 0 }">
                                        		<img alt="프로필사진" src="/img/download/${imgDto.imgNo}" width="150" height="120">
                                    		</c:when>
                                    		<c:otherwise>
                                    			<img width="120" height="120" src="/static/image/profile.png">
                                    		</c:otherwise>
                                    	</c:choose>
                                        
                                    </div>
                                </div>
                                
                                <div style="display: flex; align-items: center;">
                                    <h1 class="my-profile__name">${dto.memberName}</h1>
                                </div>
                            </div>
    
                        </div>
                        <div class="my-status">
                            <li class="my-status_item my-status_item-double">
                                    <div class="my-status_label">
                                        <section id="article-profile">
                                            <h1 class="hide"></h1>
                                            <div class="space-between">

                                                <div id="article-profile-right">
                                                    <dl id="temperature-wrap">
                                                        <dd class="text-color-03 ">
                                                            ${dto.memberManner}<span>°C</span>
                                                        </dd>
                                                    </dl>
                                                    	<c:choose>
													        <c:when test="${dto.memberManner >= 80}">
													          <span class="face face-06"></span>
													        </c:when>
													        <c:when test="${dto.memberManner >= 60}">
													          <span class="face face-05"></span>
													        </c:when>
													        <c:when test="${dto.memberManner >= 40}">
													          <span class="face face-04"></span>
													        </c:when>
													        <c:when test="${dto.memberManner >= 20}">
													          <span class="face face-03"></span>
													        </c:when>
													        <c:when test="${dto.memberManner >= 10}">
													          <span class="face face-02"></span>
													        </c:when>
													        <c:otherwise>
													          <span class="face face-01"></span>
													        </c:otherwise>
												      	</c:choose>
                                                </div>
                                                
                                            </div>
                                        </section>
                                    </div>
                            </li>
                        
                        </div>
                    </section>
                
                </div>
                <div class="content-body_wrap">
                    <section>
                        <div class="section_title">관리자 메뉴</div>
                        <div class="my-menu mt-3">
                            <ul class="my-menu_list">
                                <li>
                                    <a href="/admin/member/list">
                                        <div class="my-menu-list_label">
                                            <img src="/static/image/list.png" alt="회원 목록">
                                            <p>회원 목록</p>
                                        </div>
                                    </a>
                                </li>
   								<li>
                                    <a href="/admin/member/groundList">
                                        <div class="my-menu-list_label">
                                            <img src="/static/image/list.png" alt="구장 목록">
                                            <p>구장 목록</p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/member/mainList">
                                        <div class="my-menu-list_label">
                                            <img src="/static/image/img.png" alt="메인페이지 이미지 슬라이드" width="18" height="18">
                                            <div>
                                                <p>메인페이지 이미지 슬라이드</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="/admin/member/statsView">
                                        <div class="my-menu-list_label">
                                            <img src="/static/image/table.png" alt="통계확인" width="18" height="18">
                                            <div>
                                                <p>통계확인</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
	                            </ul>
                        </div>
                    </section>
                
                    <section>
                        <div class="section_title">
                            <h5>고객센터</h5>
                        </div>
                        <div class="my-menu mt-3">
                            <ul class="my-menu_list">
                                <li>
                                    <a href="/admin/customer/cs">
                                        <div class="my-menu-list_label">
                                            <img src="/static/image/question.png" alt="자주 묻는 질문" width="15" height="25">
                                            <p>자주 묻는 질문</p>
                                        </div>
                                    </a>
                                </li>
                            </ul class="my-menu_list">
                        </div>
                    </section>
                    
                </div>
            </div>
        
        </div>
    </div>
    </div>
  
    
    
        </body>
    </html>
    