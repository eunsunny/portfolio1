<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>

<link rel="apple-touch-icon" href="img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo.css">
<link rel="stylesheet" href="css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="css/fontawesome.min.css">
<link rel="stylesheet" href="css/main.css" />
<script type="text/javascript" src="js/product.js"></script>

<style>
    
    #ulli > li {
    	font-size: 13pt;
    }
    
    td > input[type="button"],
    td > input[type="text"],
   	td > button[type="button"],
   	td > button[type="submit"],
   	td > textarea, 
   	td > select {
   	
   		background-color : white;
   	}
   	
   	

</style>

</head>
<body>
	<article>
		<div class="container py-5">
			<div class="row">
				<div class="col-2">
					<h2 class="h2 pb-5">NOTICE</h2>
					<ul class="list-unstyled templatemo-accordion" id="ulli">
						<li class="pb-3">
							<a class="collapsed d-flex" href="notice_list">공지사항</a>
						</li>
						<li class="pb-3">
							<a class="collapsed d-flex" href="question_list">자주묻는 질문</a>
						</li>
						<c:choose>
							<c:when test="${empty sessionScope.loginUser}">
								<li class="pb-3">
									<a class="collapsed d-flex" href="#" onclick="login_empty_check()">1:1 문의하기</a>
								</li>
								<li class="pb-3">
									<a class="collapsed d-flex" href="#" onclick="login_empty_check()">신고하기</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="pb-3">
									<a class="collapsed d-flex" href="oneone_list">1:1 문의하기</a>
								</li>
								<li class="pb-3">
									<a class="collapsed d-flex" href="report_write_view">신고하기</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>