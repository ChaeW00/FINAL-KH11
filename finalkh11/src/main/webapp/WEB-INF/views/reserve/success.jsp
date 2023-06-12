<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 
<style>
	a {
		text-decoration-line: none;
	}
</style>

<div class="main-content">
    <div class="col mt-4">
        <h1 class="text-center">결제가 성공적으로 완료되었습니다!</h1>
    </div>

    <div class="col mt-4 text-center">
        <a class="btn btn-primary me-3" href="/member/paymentHistory">
            <i class="fa-solid fa-credit-card me-2"></i>결제 내역으로 이동
        </a> |
        <a class="btn btn-primary ms-3" href="/ground/list">
			구장 리스트로 이동
        </a>
    </div>
</div>