<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>

<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Load fonts style after rendering the layout styles -->
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
   	
   	.noticeList {
   		text-align:center; 
    	background-color: #F6F6F6;
    	padding: 0;
   	}
   	
	.noticeList > .select {
    	cursor: pointer;
    }
    
    .noticeList > .select:hover {
    	background-color: #FFEAEA;
    }

</style>

</head>
<body>
	<article>
		<div class="container py-5">
			<div class="row">
				<div class="col-2">
					<h2 class="h2 pb-5">MESSAGE</h2>
					<ul class="list-unstyled templatemo-accordion" id="ulli">
						<c:choose>
							<c:when test="${empty sessionScope.loginUser}">
								<li class="pb-3">
									<a class="collapsed d-flex" href="#" onclick="login_empty_check()">받은 쪽지함</a>
								</li>
								<li class="pb-3">
									<a class="collapsed d-flex" href="#" onclick="login_empty_check()">보낸 쪽지함</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="pb-3">
									<a class="collapsed d-flex" href="message_list">받은 쪽지함</a>
								</li>
								<li class="pb-3">
									<a class="collapsed d-flex" href="message_send_list">보낸 쪽지함</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>