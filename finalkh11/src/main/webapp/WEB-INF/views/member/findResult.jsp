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
    <title>아이디 찾기</title>

    <!--아이콘 CDN-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <!-- bootswatch cdn-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/litera/bootstrap.min.css" rel="stylesheet" >
    
   <h2>비밀번호 ${findId} 입니다.</h2>
   <h2>아이디 찾았습니다</h2>

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


