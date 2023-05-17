<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팀 생성 페이지</title>
    
    <!--아이콘 CDN-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Include Vue.js -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
    <div id="app" class="container">
        <h1>팀 생성</h1>
        <form action="insert" method="post" autocomplete="off" enctype="multipart/form-data">
            <div class="form-group">
                <label for="teamName">팀 이름</label>
                <input type="text" class="form-control" id="teamName" v-model="team.teamName" required>
            </div>

            <div class="form-group">
                <label for="teamInfo">팀 소개글</label>
                <textarea class="form-control" id="teamInfo" v-model="team.teamInfo" required></textarea>
            </div>

            <div class="form-group">
                <label for="teamCity">팀 활동지역</label>
                <select class="form-control" id="teamCity" v-model="team.teamCity">
                    <!-- 지역을 입력하세요 -->
                    <option>서울</option>
                    <option>부산</option>
                </select>
                    <select class="form-control" id="teamLocation" v-model="team.teamLocation">
                    <!-- 상세지역을 입력하세요 -->
                    <option>북구</option>
                    <option>동구</option>
                </select>
            </div>
            <!-- 활동 요일 -->
            <div class="form-group">
                <label>활동 요일</label>
                <div class="form-check" v-for="day in days" :key="day">
                    <input class="form-check-input" type="radio" v-model="team.teamDay" :value="day">
                    <label class="form-check-label">{{ day }}</label>
                </div>
            </div>

            <!-- 활동 시간 -->
            <div class="form-group">
                <label>활동 시간</label>
                <div class="form-check" v-for="time in times" :key="time">
                    <input class="form-check-input" type="radio" v-model="team.teamTime" :value="time">
                    <label class="form-check-label">{{ time }}</label>
                </div>
            </div>

            <!-- 성별 -->
            <div class="form-group">
                <label>성별</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" id="male" value="Male" v-model="team.teamGender">
                    <label class="form-check-label" for="male">남자</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" id="female" value="Female" v-model="team.teamGender">
                    <label class="form-check-label" for="female">여자</label>
                </div>
            </div>

            <!-- 나이대 -->
            <div class="form-group">
                <label>나이대</label>
                <div class="form-check" v-for="age in ages" :key="age">
                    <input class="form-check-input" type="radio" v-model="team.teamAge" :value="age">
                    <label class="form-check-label">{{ age }}</label>
                </div>
            </div>


            <!-- Remaining form fields -->

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">팀 생성</button>
        </form>
    </div>

    <script>
        new Vue({
            el: '#app',
            data: {
                team: {
                    teamName: '',
                    teamInfo: '',
                    teamCity: '',
                    teamLocation: '',
                    teamDay: '',
                    teamTime: '',
                    teamGender: '',
                    teamAge: '',
                    // Remaining data fields
                },
                days: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
                times: ['아침(06시~10시)', '낮(10시~18시)', '저녁(18~24시)', '심야(24시~06시)'],
                ages: ['10대', '20대', '30대', '40대', '50대 이상']
            },
            methods: {
                submitForm() {
                    if (!this.team.teamName || !this.team.teamInfo || !this.team.teamCity || !this.team.teamLocation || 
                    !this.team.teamDay || !this.team.teamTime || !this.team.teamGender || 
                    !this.team.teamAge) {
                    alert("모든 필드를 입력해주세요.");
                    return;
                    }
                    // 팀 정보 제출 로직을 구현하세요.
                    console.log(this.team);
                }
            }
        });
    </script>
</body>
</html>