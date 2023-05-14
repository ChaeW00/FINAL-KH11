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
                                    v-model="memberName" :class="checkName">

                                    <div class="valid-feedback"></div>
                                    <div class="invalid-feedback">한글 이름 2~5자 이내로 입력해주세요.</div>
                                </div>
                            </div>
                        
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">아이디</label>
                                    <input class="form-control rounded" name="memberId" type="text" placeholder="아이디 입력"
                                    v-model="memberId" :class="checkId">

                                    <div class="valid-feedback">사용할 수 있는 아이디입니다.</div>
                                    <div class="invalid-feedback">아이디는 소문자와 숫자 8~20 사이여야 합니다.</div>
                                </div>
                            </div>
                            
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">비밀번호</label>
                                    <input class="form-control" name="memberPw" type="password" placeholder="비밀번호 입력"
                                    v-model="memberPw" :class="checkPw">

                                    <div class="valid-feedback">사용할 수 있는 비밀번호입니다.</div>
                                    <div class="invalid-feedback">최소한 한개의 대문자,소문자,숫자,특수문자를 포함하여 8~16 사이여야 합니다.</div>

                                </div>
                                    <div class="col">
                                        <label class="text-size">비밀번호 확인</label>
                                        <input class="form-control rounded" name="memberPwCheck" type="password" placeholder="비밀번호 확인"
                                        v-model="memberPwCheck" :class="checkPwRe">

                                        <div class="valid-feedback">비밀번호가 일치합니다.</div>
                                        <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                                    </div>
                            </div>
                            
                            
                            <div class="row mt-4 was-validated">
                                <div class="col">
                                    <label class="text-size">성별</label>
                                    <select class="form-select rounded" required aria-label="select example" name="memberGender">
                                        <option value="">선택해주세요</option>
                                        <option value="남">남</option>
                                        <option value="여">여</option>
                                      </select>
                                      <div class="invalid-feedback"></div>
                                </div>
                            </div>
                            

                            
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">이메일</label>
                                    <input class="form-control" name="memberEmail" type="text" v-model="memberEmail"
                                    placeholder="이메일 입력" :class="checkEmail">
                                
                                    <div class="valid-feedback"></div>
                                    <div class="invalid-feedback">이메일이 형식에 맞지 않습니다.</div>
                                </div>
                            </div>

                            <div class="row mt-4" name="happyBirth">
                                <div class="col-md-4" style="margin-top: 7px;">
                                    <div class="form-group" style="font-size: small; margin-bottom: 5px;">
                                    <label for="birth-year">생년월일</label>
                                    <select class="form-select" id="birth-year" v-model="birthYear" >
                                        <option value="">년</option>
                                        <option v-for="(birthYear,index) in years" v-bind:key="index" v-bind:value="birthYear.value">
                                            {{birthYear}}
                                        </option>
                                    </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label for="birth-month"></label>
                                    <select class="form-select" id="birth-month" v-model="birthMonth">
                                        <option value="">월</option>
                                        <option v-for="(birthMonth,index) in months" v-bind:key="index" v-bind:value="birthMonth.value">
                                            {{birthMonth.name}}
                                        </option>
                                    </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label for="birth-day"></label>
                                    <select class="form-select" id="birth-day" v-model="birthDay">
                                        <option value="">일</option>
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
                    memberName:"",
                    memberId:"",
                    memberPw:"",
                    memberPwCheck:"",
                    memberGender:"",
                    memberEmail:"",

                };
            },
            computed:{ //실시간 계산영역
                checkName(){ // 이름
                    const regex = /^[가-힣]{2,5}$/;
                    const nameValid = regex.test(this.memberName); 

                    if(this.memberName.length == 0) return "";

                    return nameValid ? "is-valid" : "is-invalid";
                },
                checkId(){//아이디
                    const regex = /^[a-z][a-z0-9]{5,20}$/;
                    const idValid = regex.test(this.memberId);

                    if(this.memberId.length == 0) return "";

                    return idValid ? "is-valid" : "is-invalid";
                },
                checkPw(){//비밀번호
                    const regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[-A-Za-z~!@#$%^&*()_+=0-9]{8,16}$/;
                    const pwValid = regex.test(this.memberPw);

                    if(this.memberPw.length == 0) return "";

                    return pwValid ? "is-valid" : "is-invalid";

                },
                checkPwRe(){//비밀번호 확인
                    const pwCheckValid = this.memberPw == this.memberPwCheck;

                    if(this.memberPwCheck.length == 0) return "";

                    return pwCheckValid ? "is-valid" : "is-invalid";
                },

                checkEmail(){//이메일
                    const regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
                    const emailValid = regex.test(this.memberEmail);
                    
                    if(this.memberEmail.length == 0) return "";

                    return emailValid ? "is-valid" : "is-invalid";
                }
            },
            mounted() {
                this.initializeYears(); // 생년 옵션 초기화
                this.initializeDays(); // 일 옵션 초기화
            },
            methods: {
                initializeYears() { //연도
                    const currentYear = new Date().getFullYear();
                    const startYear = currentYear - 100; // 100년 전부터 시작
                    for (let year = startYear; year <= currentYear; year++) {
                        this.years.push(year); //위 계산한 공식을 years배열에 넣는다
                        }
                },
                initializeDays() { //날짜
                    for (let day = 1; day <= 31; day++) {
                    this.days.push(day);//위 계산한 공식은 days배열에 넣는다
                        }
                },
                async sendItem(){//

                }

            },
        }).mount("#app");
    </script>

    
</body>
</html>
