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
    <!-- 부트스트랩 cdn -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>    
    
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

        });

    </script>
</head>
<body>
    <div class="jcontainer">

        <div class="container-fluid mt-4">

            <div class="row">
                <div class="offset-md-2 col-md-8">
    
                    <!-- 문서 제목 (Jumbotron) -->
                    <div class="row text-center">
                        <div class="col">
                            <h1>MATCH-UP</h1>
                        </div>
                    </div>
                    
                    <div class="inner">
                        <div class="row mt-4">
                            <div class="col">
                                <label class="text-size">아이디</label>
                                <input class="form-control rounded" name="memberId" type="text" placeholder="아이디 입력">
                            </div>
                        </div>
                        
                        <div class="row mt-4">
                            <div class="col">
                                <label class="text-size">비밀번호</label>
                                <input class="form-control rounded" name="memberPw" type="password" placeholder="비밀번호 입력">
                            </div>
                                <div class="col">
                                    <label class="text-size">비밀번호 확인</label>
                                    <input class="form-control rounded" name="memberPwCheck" type="password" placeholder="비밀번호 확인">
                                </div>
                        </div>
                        
                        <div class="row mt-4">
                            <div class="col-md-4">
                                <div class="form-group">
                                  <label for="birth-year">생년월일</label>
                                  <select class="form-control" id="birth-year">
                                    <option value="1930">1930</option><option value="1931">1931</option><option value="1932">1932</option><option value="1933">1933</option><option value="1934">1934</option><option value="1935">1935</option><option value="1936">1936</option><option value="1937">1937</option><option value="1938">1938</option><option value="1939">1939</option><option value="1940">1940</option><option value="1941">1941</option><option value="1942">1942</option><option value="1943">1943</option><option value="1944">1944</option><option value="1945">1945</option><option value="1946">1946</option><option value="1947">1947</option><option value="1948">1948</option><option value="1949">1949</option><option value="1950">1950</option><option value="1951">1951</option><option value="1952">1952</option><option value="1953">1953</option><option value="1954">1954</option><option value="1955">1955</option><option value="1956">1956</option><option value="1957">1957</option><option value="1958">1958</option><option value="1959">1959</option><option value="1960">1960</option><option value="1961">1961</option><option value="1962">1962</option><option value="1963">1963</option><option value="1964">1964</option><option value="1965">1965</option><option value="1966">1966</option><option value="1967">1967</option><option value="1968">1968</option><option value="1969">1969</option><option value="1970">1970</option><option value="1971">1971</option><option value="1972">1972</option><option value="1973">1973</option><option value="1974">1974</option><option value="1975">1975</option><option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option><option value="1979">1979</option><option value="1980">1980</option><option value="1981">1981</option><option value="1982">1982</option><option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option><option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option><option value="1989">1989</option><option value="1990" selected>1990</option><option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option><option value="1998">1998</option><option value="1999">1999</option><option value="2000">2000</option><option value="2001">2001</option><option value="2002">2002</option><option value="2003">2003</option><option value="2004">2004</option><option value="2005">2005</option><option value="2006">2006</option><option value="2007">2007</option><option value="2008">2008</option><option value="2009">2009</option><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option>
                                  </select>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="birth-month"></label>
                                  <select class="form-control" id="birth-month">
                                    <option value="1" selected>1월</option><option value="2">2월</option><option value="3">3월</option><option value="4">4월</option><option value="5">5월</option><option value="6">6월</option><option value="7">7월</option><option value="8">8월</option><option value="9">9월</option><option value="10">10월</option><option value="11">11월</option><option value="12">12월</option>
                                  </select>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="birth-day"></label>
                                  <select class="form-control" id="birth-day">
                                    <option value="1" selected>1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                                  </select>
                                </div>
                              </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col">
                                <label class="text-size">성별</label>
                                <select class="form-select rounded" name="memberGender">
                                    <option>선택하세요</option>
                                    <option>여자</option>
                                    <option>남자</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col">
                                <label class="text-size">이메일</label>
                                <input class="form-control rounded" name="memberEmail" type="text" placeholder="이메일 입력">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="formFile" class="form-label mt-4">프로필 이미지</label>
                            <input class="form-control" type="file" id="formFile">
                        </div>


                        <div class="row mt-4" style="margin-left: 0px;">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                <label class="form-check-label" for="flexRadioDefault1">
                                MATCH-UP 서비스 이용 약관 및 개인 정보 수집 및 이용에 동의합니다.
                                </label>
                            </div>
                        </div>

                    <!-- 아웃라인 버튼 -->
                    <div class="row mt-4">
                        <div class="col">
                            <button type="submit" class="btn btn-outline-primary btn-md w-100">회원가입</button>
                        </div>
                    </div>

                </div>
            </div>
    
            
        </div>
        
    </div>
    </div>
    
</body>
</html>
