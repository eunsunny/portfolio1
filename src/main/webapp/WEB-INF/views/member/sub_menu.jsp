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
	
	fieldset > #row_row {
		padding-top : 0;
		margin-top : 0;
	}
	
	div > label {
       text-align : right;
       margin-top : 0.5em;
       padding-top : 0;
    }
    
    fieldset > legend {
    	font-size : 25px;
    	font-weight : bold;
    	margin : 10px 0 0 8em;
    }
    
    #infotable {
    	margin:0 0 30px 0;
    	padding: 0;
    }
    
    #infotable > tr > th {
    	text-align: cneter;
    }
    
    #infotable > tr:last-child {
    	border-bottom: solid 1px black;
    }
    
    #infotable > tr:first-child {
    	border-top: solid 1px black;
    }
    
    table > .jjimListbody, .prodListBody:last-child {
    
	    border-bottom: solid 2px #505050;
	    color: #black;
    
    }
    
    #infotable > thead > tr > th {
    	padding: 0;
    }
    
    #ulli > li {
    	font-size: 13pt;
    }

    
</style>

</head>
<body>
	<article>
		<div class="container py-5">
			<div class="row">
				<div class="col-2">
					<h2 class="h2 pb-5">MY PAGE</h2>
					<ul class="list-unstyled templatemo-accordion" id="ulli">
						<li class="pb-3">
							<a class="collapsed d-flex" href="member_update_form">회원정보 변경</a>
						</li>
						<li class="pb-3">
							<a class="collapsed d-flex" href="jjim_list">찜목록</a>
						</li>
						<li class="pb-3">
							<a class="collapsed d-flex" href="my_prod_list">내상품조회/수정</a>
						</li>
						<li class="pb-3">
							<a class="collapsed d-flex" href="admin_product_write_form">상품 등록</a>
						</li>
						<li class="pb-3">
							<a class="collapsed d-flex" href="#">주문/결제내역 </a>
						</li>
						<li class="pb-3">
							<a class="collapsed d-flex" href="#">나의 등급관리</a>
						</li>
					</ul>
				</div>