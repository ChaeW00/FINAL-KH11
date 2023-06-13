<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>팀 생성</title>
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="팀 생성" name="title" />
</jsp:include>
</head>
<body>
    <div class="container mt-5 main-content">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="alert alert-success text-center" role="alert">
                    <h2 class="alert-heading">팀 생성이 되었습니다!</h2>
                </div>
                <div class="text-center">
                    <a class="btn btn-primary btn-block" href="team/myTeam">팀 목록으로</a>
                    <a class="btn btn-secondary btn-block" href="/">메인페이지 이동</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>