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
    <title>회원가입</title>


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
        .text-size{
            font-size: small;
            margin-bottom: 5px;
        }
        .mt-2 {
            margin-top: -0.1rem !important;
        }
        a{
            text-decoration-line: none;
        }
	
    </style>

</head>
<body>
    <div class="jcontainer main-content" id="app">
		
        <div class="container-fluid mt-2">

            <div class="row">
                <div class="offset-md-2 col-md-8">
    
                    <!-- 문서 제목 (Jumbotron) -->
                    <div class="row text-center">
                        <div class="col">
                            <a href="/"><img src="/static/image/logo.png" style="width: 370px; height: 120px;"></a>
                        </div>
                    </div>
                    
                    <form action="join" method="post" autocomplete="off" enctype="multipart/form-data">
                        <div class="inner">
                        
                        	<div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">이름</label>
                                    <input class="form-control rounded" name="memberName" type="text" placeholder="이름 입력" 
                                    v-model="memberName" :class="checkName" required>

                                    <div class="valid-feedback"></div>
                                    <div class="invalid-feedback">한글 이름 2~5자 이내로 입력해주세요.</div>
                                </div>
                            </div>
                        
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">아이디</label>
                                    <input class="form-control rounded" id="memberId" name="memberId" type="text" placeholder="아이디 입력"
                                    v-model="memberId" :class="checkId" @blur="IdCheck" required>

                                    <div class="valid-feedback" id="idValidCheck"></div>
                                    <div class="invalid-feedback" id="idInValidCheck"></div>
                                </div>
                            </div>
                            
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">비밀번호</label>
                                    <input class="form-control" name="memberPw" type="password" placeholder="비밀번호 입력"
                                    v-model="memberPw" :class="checkPw" required>

                                    <div class="valid-feedback">사용할 수 있는 비밀번호입니다.</div>
                                    <div class="invalid-feedback">최소한 한개의 대문자,소문자,숫자,특수문자를 포함하여 8~16 사이여야 합니다.</div>
                                </div>
                                    <div class="col">
                                        <label class="text-size">비밀번호 확인</label>
                                        <input class="form-control rounded" name="memberPwCheck" type="password" placeholder="비밀번호 확인"
                                        v-model="memberPwCheck" :class="checkPwRe" required>

                                        <div class="valid-feedback">비밀번호가 일치합니다.</div>
                                        <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                                    </div>
                            </div>
                            
                            
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">성별</label>
                                    <select class="form-select rounded" required name="memberGender" required v-model="memberGender">
                                        <option value="">선택해주세요</option>
                                        <option value="남">남</option>
                                        <option value="여">여</option>
                                      </select>
                                      <div class="valid-feedback"></div>
                                      <div class="invalid-feedback"></div>
                                </div>
                            </div>

                            
                            <div class="row mt-4">
                                <div class="col">
                                    <label class="text-size">이메일</label>
                                    <input class="form-control rounded" id="memberEmail" name="memberEmail" type="text" v-model="memberEmail"
                                    placeholder="이메일 입력" :class="checkEmail" @blur="EmailCheck" required>
                                
                                    <div class="valid-feedback" id="emailValidCheck"></div>
                                    <div class="invalid-feedback" id="emailInValidCheck"></div>
                                </div>
                            </div>

                            <div class="row mt-4" name="happyBirth">
                                <div class="col-md-4" style="margin-top: 7px;">
                                    <div class="form-group" style="font-size: small; margin-bottom: 5px;">
                                    <label for="birth-year">생년월일</label>
                                    <select class="form-select" id="birth-year" v-model="birthYear" required>
                                        <option value="">년</option>
                                        <option v-for="(birthYearValue,index) in years" v-bind:key="index" v-bind:value="birthYearValue">
                                            {{birthYearValue}}
                                        </option>
                                    </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label for="birth-month"></label>
                                    <select class="form-select" id="birth-month" v-model="birthMonth" required>
                                        <option value="">월</option>
                                        <option v-for="(birthMonthValue,index) in months" v-bind:key="index" v-bind:value="birthMonthValue">
                                            {{birthMonthValue}}
                                        </option>
                                    </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label for="birth-day"></label>
                                    <select class="form-select" id="birth-day" v-model="birthDay" required>
                                        <option value="">일</option>
                                        <option v-for="(birthDayValue,index) in days" v-bind:key="index" v-bind:value="birthDayValue">
                                            {{birthDayValue}}
                                        </option>
                                    </select>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" id="memberBirth" name="memberBirth" v-bind:value="happyBirth">

                                <div class="form-group">
                                    <label for="formFile" class="form-label mt-4">프로필 이미지</label>
									 <img id="preview" width="100" height="100" :src="previewImage" style="margin-left: 180px; margin-bottom: 10px;">
                                    <input class="form-control" type="file" name="file" id="formFile" accept=".png,.jpg" @change="handleFileChange">
                                </div>

                            <div class="row mt-4" style="margin-left: 0px;">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault1" required v-model="agree">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                    MATCH-UP <a href="jointerm">서비스 이용 약관</a> 및 <a href="joinprivacy">개인 정보 수집 및 이용</a>에 동의합니다.
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!-- 아웃라인 버튼 -->
                        <div class="row mt-4">
                            <div class="col" style="margin-bottom:20px;">
                                <button type="submit" class="btn btn-outline-primary btn-md w-100"
                                 :disabled="!allCheck">회원가입</button>
                            </div>
                        </div>
                    </form>        

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

    <!-- VueJS CDN -->
    <script src="https://unpkg.com/vue@3.2.36"></script>
    <script>
        Vue.createApp({
            data(){
                return {
                    birthYear:'',
                    birthMonth:'',
                    birthDay:'',
                    happyBirth:'',
                    years:[], //연도 저장 배열ㅋ
                    months:[ //월 옵션 저장 배열
                        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
                    ],
                    days:[],//일 옵션 저장 배열
                    memberName:"",
                    memberId:"",
                    isValid:false,
                    memberPw:"",
                    memberPwCheck:"",
                    memberGender:"",
                    memberEmail:"",
                    idFinalCheck:false,//아이디 중복검사, 정규표현식 검사 결과
                    emailFinalCheck:false,//이메일 중복검사, 정규표현식 검사 결과
                    previewImage:"/static/image/profile.png",
                    agree:false,
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
                    
                    const temp = document.querySelector("#idValidCheck"); //vue에서 id선택자 가져오는 코드 
                    const temp2 = document.querySelector("#idInValidCheck");//vue에서 id선택자 가져오는 코드

                    if(this.memberId.length == 0) return "";

                    if(idValid){
                        temp.textContent='사용할 수 있는 아이디 입니다.'
                        this.idFinalCheck = true;
                    }else{
                        temp2.textContent='아이디는 소문자와 숫자 8~20 사이여야 합니다.';
                        this.idFinalCheck = false;
                    }
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

                    const temp = document.querySelector("#emailValidCheck"); //vue에서 id선택자 가져오는 코드 
                    const temp2 = document.querySelector("#emailInValidCheck");//vue에서 id선택자 가져오는 코드
                    
                    if(this.memberEmail.length == 0) return "";

                    if(emailValid){
                        temp.textContent='사용할 수 있는 이메일 입니다.'
                        this.emailFinalCheck = true;
                    }else{
                        temp2.textContent='이메일은 소문자,대문자,숫자로 이루어지며, @기호가 포함되야 합니다.';
                        this.emailFinalCheck = false;
                    }

                    return emailValid ? "is-valid" : "is-invalid";
                },
                allCheck(){
                    if( 
                        this.checkName == 'is-valid' &&
                        this.checkPw == 'is-valid' &&
                        this.checkPwRe == 'is-valid' &&
                        this.checkEmail == 'is-valid' &&
                        this.birthYear !== '' &&
                        this.birthMonth !== '' &&
                        this.birthDay !== '' &&
                        this.memberGender !== '' &&
                        this.agree
                        )
                        {
                    	// 모든 필수 조건이 충족되었을 때
                            return true;
                        }else{
                        	 // 하나 이상의 필수 조건이 충족되지 않았을 때
                            return false;
                        }
                },
            },
            mounted() {
                this.initializeYears(); // 생년 옵션 초기화
                this.initializeDays(); // 일 옵션 초기화
            },
            watch:{//변경될때마다 값을 업데이트
                birthYear(){
                    this.happyBirth = String(this.birthYear).padStart(4, '0') + "-" + String(this.birthMonth).padStart(2, '0') + "-" + String(this.birthDay).padStart(2, '0'); 
                },
                birthMonth(){
                    this.happyBirth = String(this.birthYear).padStart(4, '0') + "-" + String(this.birthMonth).padStart(2, '0') + "-" + String(this.birthDay).padStart(2, '0'); 
                },
                birthDay(){
                    this.happyBirth = String(this.birthYear).padStart(4, '0') + "-" + String(this.birthMonth).padStart(2, '0') + "-" + String(this.birthDay).padStart(2, '0'); 
                },
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
                async IdCheck() {//비동기 아이디 중복검사
                if(!this.idFinalCheck) return;  //idFinalCheck 가 false면 return
                const memberId = this.memberId.trim(); // 입력된 아이디를 가져옴
                if (memberId === "") {
                    return; // 아이디가 비어있으면 검사하지 않음
                }
                const temp = document.querySelector("#idValidCheck");
                const temp2 = document.querySelector("#idInValidCheck");
                const memberIdTemp =  document.querySelector("#memberId");
                try {
                    const response = await axios.get(
                        "/rest/member/memberId/"+memberId 
                    );

                    if (response.data === "Y") {
                        this.isValid = true;
                        console.log("사용 가능한 아이디");
                        temp.textContent = "아이디가 중복되지 않습니다.";
                        memberIdTemp.className = "form-control rounded is-valid";
                        // TODO: 사용 가능한 아이디 처리
                    } else {
                        this.isValid = false;
                        console.log("사용 불가능한 아이디");
                        temp2.textContent = "아이디가 중복되었습니다.";
                        memberIdTemp.className = "form-control rounded is-invalid";
                        // TODO: 사용 불가능한 아이디 처리
                    }
                } catch (error) {
                    console.error("아이디 중복 검사 실패:", error);
                    temp2.textContent = "아이디 중복 검사 실패";
                    memberIdTemp.className = "form-control rounded is-invalid";
                    // TODO: 에러 처리
                }
                },
                async EmailCheck(){//비동기 이메일 중복검사
                    if(!this.emailFinalCheck) return;  //emailFinalCheck 가 false면 return
                    const memberEmail = this.memberEmail.trim(); // 입력된 아이디를 가져옴
                    if (memberEmail === "") {
                        return; // 아이디가 비어있으면 검사하지 않음
                    }
                    const temp = document.querySelector("#emailValidCheck");
                    const temp2 = document.querySelector("#emailInValidCheck");
                    const memberEmailTemp =  document.querySelector("#memberEmail");
                    try {
                        const response = await axios.get(
                            "/rest/member/memberEmail/"+memberEmail
                        );
                        console.log(response.data);
                        if (response.data === "Y") {
                            this.isValid = true;
                            console.log("사용 가능한 이메일");
                            temp.textContent = "이메일이 중복되지 않습니다.";
                            memberEmailTemp.className = "form-control rounded is-valid";
                            // TODO: 사용 가능한 아이디 처리
                        } else {
                            this.isValid = false;
                            console.log("사용 불가능한 이메일");
                            temp2.textContent = "이메일이 중복되었습니다.";
                            memberEmailTemp.className = "form-control rounded is-invalid";
                            // TODO: 사용 불가능한 아이디 처리
                        }
                    } catch (error) {
                        console.error("이메일 중복 검사 실패:", error);
                        temp2.textContent = "이메일 중복 검사 실패";
                        memberEmailTemp.className = "form-control rounded is-invalid";
                        // TODO: 에러 처리
                    }
                },
                handleFileChange(event) {
                    const file = event.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.addEventListener('load', () => {
                        this.previewImage = reader.result;
                        });
                        reader.readAsDataURL(file);
                    }
                },

            }
        }).mount("#app");
    </script>

    
</body>
</html>
