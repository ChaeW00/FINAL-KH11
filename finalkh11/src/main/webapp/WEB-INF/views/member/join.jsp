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
    <title>회원가입</title>

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

    </style>
    <!--Jquery CDN-->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    <script type="text/javascript">
       
        $(function(){
            const birthYearSelect = $("#birth-year");
            const birthMonthSelect = $("#birth-month");
            const birthDaySelect = $("#birth-day");
            const memberBirthField = $("#memberBirth");

            $("[name=happyBirth]").on("change",function(){
                const birthYear = birthYearSelect.val();
                const birthMonth = birthMonthSelect.val();
                const birthDay = birthDaySelect.val();

                const memberBirth = birthYear+"-"+birthMonth+"-"+birthDay;

                memberBirthField.val(memberBirth);
            });
            

        });

    </script>

</head>
<body>
    <div class="jcontainer" id="app">
		
        <div class="container-fluid mt-4">

            <div class="row">
                <div class="offset-md-2 col-md-8">
    
                    <!-- 문서 제목 (Jumbotron) -->
                    <div class="row text-center">
                        <div class="col">
                            <h1>MATCH-UP</h1>
                        </div>
                    </div>
                    
                    <form action="join" method="post" enctype="multipart/form-data">
                        <div class="inner">
                        
                        	<div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">이름</label>
                                    <input class="form-control rounded" name="memberName" type="text" placeholder="이름 입력" 
                                    v-model="memberName">
                                </div>
                            </div>
                        
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">아이디</label>
                                    <input class="form-control rounded" name="memberId" type="text" placeholder="아이디 입력"
                                    v-model="memberId">
                                </div>
                            </div>
                            
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">비밀번호</label>
                                    <input class="form-control rounded" name="memberPw" type="password" placeholder="비밀번호 입력"
                                    v-model="memberPw">
                                </div>
                                    <div class="col">
                                        <label class="text-size">비밀번호 확인</label>
                                        <input class="form-control rounded" name="memberPwCheck" type="password" placeholder="비밀번호 확인"
                                        v-model="memberPwCheck">
                                    </div>
                            </div>
                            
                            
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">성별</label>
                                    <select class="form-select rounded" name="memberGender">
                                         <option value=null>선택해주세요</option>
                                         <option value="남">남</option>
                                         <option value="여">여</option>
                                    </select>
                                </div>
                            </div>
                            

                            
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">이메일</label>
                                    <input class="form-control rounded" name="memberEmail" type="text" placeholder="이메일 입력">
                                </div>
                            </div>

                            <div class="row mt-4" name="happyBirth">
                                <div class="col-md-4" style="margin-top: 7px;">
                                    <div class="form-group" style="font-size: small; margin-bottom: 5px;">
                                    <label for="birth-year">생년월일</label>
                                    <select class="form-control" id="birth-year" v-model="birthYear" >
                                        <option v-for="(birthYear,index) in years" v-bind:key="index" v-bind:value="birthYear.value">
                                            {{birthYear}}
                                        </option>
                                    </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label for="birth-month"></label>
                                    <select class="form-control" id="birth-month" v-model="birthMonth">
                                        <option v-for="(birthMonth,index) in months" v-bind:key="index" v-bind:value="birthMonth.value">
                                            {{birthMonth.name}}
                                        </option>
                                    </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label for="birth-day"></label>
                                    <select class="form-control" id="birth-day" v-model="birthDay">
                                        <option v-for="(birthDay,index) in days" v-bind:key="index" v-bind:value="birthDay.value">
                                            {{birthDay}}
                                        </option>
                                    </select>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" id="memberBirth" name="memberBirth">

<!-- 
                            <div class="form-group">
                                <label for="formFile" class="form-label mt-4">프로필 이미지</label>
                                <input class="form-control" type="file" id="formFile" accept=".png,.jpg">
                            </div>

 -->


                            <div class="row mt-4" style="margin-left: 0px;">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                    MATCH-UP <a href="jointerm">서비스 이용 약관</a> 및 <a href="joinprivacy">개인 정보 수집 및 이용</a>에 동의합니다.
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!-- 아웃라인 버튼 -->
                        <div class="row mt-4">
                            <div class="col">
                                <button type="submit" class="btn btn-outline-primary btn-md w-100">회원가입</button>
                            </div>
                        </div>
                    </form>        

                </div>
            </div>
    
            
        </div>
    
    </div>

    <!-- 부트스트랩 cdn -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>    
    
    <!-- VueJS CDN -->
    <script src="https://unpkg.com/vue@3.2.36"></script>
    <script>
        Vue.createApp({
            data(){
                return {
                    birthYear:'',
                    birthMonth:'',
                    birthDay:'',
                    years:[], //연도 저장 배열
                    months:[ //월 옵션 저장 배열
                        {name:'1',value:'1'},
                        {name:'2',value:'2'},
                        {name:'3',value:'3'},
                        {name:'4',value:'4'},
                        {name:'5',value:'5'},
                        {name:'6',value:'6'},
                        {name:'7',value:'7'},
                        {name:'8',value:'8'},
                        {name:'9',value:'9'},
                        {name:'10',value:'10'},
                        {name:'11',value:'11'},
                        {name:'12',value:'12'},
                    ],
                    days:[],//일 옵션 저장 배열
                };
            },
            computed:{

            },
            mounted() {
                this.initializeYears(); // 생년 옵션 초기화
                this.initializeDays(); // 일 옵션 초기화
            },
            methods: {
                initializeYears() {
                const currentYear = new Date().getFullYear();
                const startYear = currentYear - 100; // 100년 전부터 시작
                for (let year = startYear; year <= currentYear; year++) {
                    this.years.push(year);
                }
            },
                initializeDays() {
                for (let day = 1; day <= 31; day++) {
                this.days.push(day);
                }
            },

            },
        }).mount("#app");
    </script>

    
</body>
</html>
