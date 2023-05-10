<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Javascript</title>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/load.css">
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <link rel="stylesheet" type="text/css" href="css/header.css">
    <!--jquery cdn-->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
    <div id="overlay"></div>
    <div class="headerContainer">
        <div class="navbar">
            <div class="navContainer">
                <div class="newLogo">
                    <a href="#">
                        <img src="image/matchUp.png" class="logo" alt="매치업">
                    </a>
                </div>
                <div class="top--menu">
                    <div class="mainTab">
                        <div class="show-search">
                            <div class="search-bar">
                                <svg data-v-454f7528="" width="24" height="24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg" class="icon2">
                                    <circle data-v-454f7528="" cx="10.5" cy="10.5" r="6" stroke="#222836"></circle>
                                    <path data-v-454f7528="" stroke="#222836" d="M14.354 14.646l4.949 4.95"></path>
                                </svg>
                                <input type="search" placeholder="지역, 구장 이름으로 찾기" maxlength="100" autocomplete="off">
                                <svg width="17" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class="clear"><ellipse data-v-454f7528="" cx="8.634" cy="8" rx="8.163" ry="8" fill="#5B7282"></ellipse><path data-v-454f7528="" fill-rule="evenodd" clip-rule="evenodd" d="M12.241 5.643a.822.822 0 000-1.179.863.863 0 00-1.202 0L8.634 6.821 6.229 4.464a.863.863 0 00-1.202 0 .822.822 0 000 1.179L7.432 8l-2.405 2.357a.822.822 0 000 1.179.863.863 0 001.202 0l2.405-2.358 2.405 2.357a.863.863 0 001.203 0 .822.822 0 000-1.178L9.837 8l2.404-2.357z" fill="#F7F7F7"></path></svg>
                            </div>
                        </div>
                        <a href="/team/">
                            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_club.svg" alt="팀">
                        </a>
                        <a href="/mypage/myplab/">
                            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_mymatch.svg" alt="나의 매치">
                        </a>
                        <a href="/mypage/">
                            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_my.svg" alt="나의 매치업">
                        </a>
                    </div>
                    <div class="icon">
                        <div class="moreIconWrap">
                            <div class="moreIcon"></div>
                            <div class="moreIcon"></div>
                            <div class="moreIcon"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="sidebar main" id="sidebar-main" data-sidebar-main="closed"
            style="position: fixed; top: 0px; bottom: 0px; width: 300px; z-index: 3000; right: -300px;">
            <div class="wrapper">
                <nav>
                    <ul class="menu">
                        <li>
                            <a href="/about/">
                                <img src="https://plab-football.s3.amazonaws.com/static/img/ic_about.svg" alt="매치업 소개">
                                <span>매치업 소개</span>
                            </a>
                        </li>
                        <li>
                            <a href="/manager/apply/">
                                <img src="https://plab-football.s3.amazonaws.com/static/img/ic_about_manager.svg"
                                    alt="매치업 매니저 지원">
                                <span>매니저 지원</span>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.notion.so/plabfootball/811eae2a9f034009a1078f02d5e5ac37">
                                <img src="https://plab-football.s3.amazonaws.com/static/img/ic_stadium_bk.svg">
                                <span>구장 제휴</span>
                            </a>
                        </li>
                        <li class="separateLine"></li>
                        <li>
                            <a href="/cs/6/topics/">
                                <img src="https://plab-football.s3.amazonaws.com/static/img/ic_notice.svg" alt="공지사항">
                                <span>공지사항</span>
                            </a>
                        </li>
                        <li>
                            <a href="/cs/">
                                <img src="https://plab-football.s3.amazonaws.com/static/img/ic_help.svg" alt="자주 묻는 질문">
                                <span>자주 묻는 질문</span>
                            </a>
                        </li>
                        <li class="separateLine"></li>
                        <p class="sideSub">SNS에서 플랩풋볼의 스토리를 들어보세요</p>
                        <li class="submenu">
                            <a href="https://www.facebook.com/plabfootball/?eid=ARCbIV7J0pdkC-eNTR8kOKz3Ce0WYjnpR9McmLlOQheslzEURQrjx5wYdcwv0SAVs3DofNPxG6_iaY_f"
                                target="_blank">
                                <img src="https://plab-football.s3.amazonaws.com/static/img/ic_fb.svg" alt="플랩풋볼 페이스북">
                                <span>페이스북</span>
                            </a>
                        </li>
                        <li class="submenu">
                            <a href="https://www.facebook.com/groups/plabfootball/" target="_blank">
                                <img src="https://plab-football.s3.amazonaws.com/static/img/ic_fbgroup.svg"
                                    alt="플랩풋볼 페이스북 그룹">
                                <span>페이스북 그룹</span>
                            </a>
                        </li>
                        <li class="submenu">
                            <a href="https://www.instagram.com/plabfootball/" target="_blank">
                                <img src="https://plab-football.s3.amazonaws.com/static/img/ic_ig.svg" alt="플랩풋볼 인스타그램">
                                <span>인스타그램</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="navigation--container">
            <div class="navigation--wrapper"><div class="navigation--item">
                <a href="/" class="selected">소셜 매치</a>
            </div> 
            <div class="navigation--item">
                <a href="/rental/">구장 예약</a>
            </div> 
            <div class="navigation--item">
                <a>팀</a>
            </div> 
            <div class="navigation--item">
                <a>게스트 모집</a><span class="is_new" style="width: inherit; padding: 0px 4px;">신규</span>
            </div>
        </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    $(function () {

        // sidebar 보이기/숨기기 버튼 클릭 시 이벤트
        $('.moreIconWrap').click(function () {
            // sidebar 열기/닫기
            $('#sidebar-main').toggleClass('active');
            $('#sidebar-main').animate({ 'right': '0px' }, 250);
            $('#overlay').show();
        });

        $(document).mouseup(function (e) {
            const container = $("#sidebar-main");
            const overlay = $("#overlay");
            // sidebar와 overlay 영역 외부 클릭 시 사라지도록 설정
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                container.removeClass('active');
                container.animate({ 'right': '-300px' }, 500);
                overlay.hide();
            }
        })

        const clearBtn = document.querySelector('.clear');
        clearBtn.addEventListener('click', function(){
            const input = document.querySelector('input[type="search"]');
            input.value = '';
            $('.clear').hide();
        });

        $('input[type="search"]').on('focus', function(){
            $('.clear').show();
        });

    });
</script>

</html>