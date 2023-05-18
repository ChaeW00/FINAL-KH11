<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/WEB-INF/views/member/mypageHeader.jsp"></jsp:include>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <!--아이콘 CDN-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <!-- bootswatch cdn-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet" >
    <!-- mypage 전용 css -->
    <link rel="stylesheet" type="text/css" href="/static/css/mypage.css">
    <!-- mypage 온도 전용 css -->
    <link rel="stylesheet" type="text/css" href="/static/css/temp.css">
    
    <style>
   
    </style>

</head>
<body>
    <div class="content" id="app" style="margin-top:150px;" >
        <div>   
        <div class="content_wrap">
            <div class="content_body content_body__double">
                <div class="content-body_left-wrap">
                    <section>
                        <div style="display: flex; justify-content: space-between;">
                            <div class="my-profile">
                                <div style="display: flex;">
                                    <div id="article-profile-image">
                                        <img alt="프로필사진" src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-c649f052a34ebc4eee35048815d8e4f73061bf74552558bb70e07133f25524f9.png" />
                                        
                                    </div>
                                </div>
                                <div style="display: flex; align-items: center;">
                                    <h1 class="my-profile__name">쿼카 님</h1>
                                </div>
                                <div class="my-account_type">
                                    <p class="text-caption1">2772458056</p>
                                    
                                        <span class="badge badge-kakao sm">KAKAO</span>
                                    
                                </div>
                            </div>
    
                        </div>
                        <div class="my-status">
                            <li class="my-status_item my-status_item-double">
                                <a href="/mypage/mymanner/">
                                    <div class="my-status_label">
                                        <section id="article-profile">
                                            <h1 class="hide"></h1>
                                            <div class="space-between">

                                                <div id="article-profile-right">
                                                    <dl id="temperature-wrap">
                                                        <dd class="text-color-03 ">
                                                            36.5<span>°C</span>
                                                        </dd>
                                                    </dl>
                                                    <div class=" face face-04"></div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
        
                                </a>
                            </li>
                        
                        </div>
                    </section>
                
                </div>
                <div class="content-body_wrap">
                    <section>
                        <div class="section_title">나의 플랩</div>
                        <div class="my-menu">
                            <ul class="my-menu_list">
                                <li>
                                    <a href="/mypage/myplab/">
                                        <div class="my-menu-list_label">
                                            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_myplab_color.svg" alt="신청 내역">
                                            <p>신청 내역</p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="/mypage/change/profile/">
                                        <div class="my-menu-list_label">
                                            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_profile.svg" alt="프로필수정" width="18" height="18">
                                            <div>
                                                <p>프로필 수정</p>
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
                        <div class="my-menu">
                            <ul class="my-menu_list">
                                <li>
                                    <a href="/cs/">
                                        <div class="my-menu-list_label">
                                            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_faq_color.svg" alt="자주 묻는 질문">
                                            <p>자주 묻는 질문</p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="/cs/6/topics/">
                                        <div class="my-menu-list_label">
                                            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_notice_color.svg" alt="공지사항">
                                            <p>공지사항</p>
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
    