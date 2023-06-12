<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
	<title>

	<style>
	
        a {
			text-decoration: none;
		}
		.ahzit-header-style {
			background-color : #E4E4E4;
		}
		.img-member-picture {
            width: 200px;
            height: 200px;
            border-radius: 50%;
        }

        .modal-i-member-grade-leader {
            width: 1em;
        }

        .modal-member-nick {
            font-size: 24px;
        }

        .div-modal-content-member-info{
            border-radius: 15px;
        }

        .div-modal-body-member-info{
            border  : 50px #3E4684 !important;
        }
        .member-profile {
        	cursor: pointer;
        }
    </style>
</head>
<body>



<div class = "container-fluid">	
	<div class = "row mt-1 ahzit-header-style">
		<div class = "col-2 offset-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitNo}" class = "p-2">게시글</a>
			<!-- <a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitDto.ahzitNo}">게시글</a> -->
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/calendar" class = "p-2">일정</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/attachment" class = "p-2">첨부</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/member" class = "p-2">멤버</a>
		</div>
	</div>
	
</div>


