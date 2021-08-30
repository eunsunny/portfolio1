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

<script type="text/javascript">
	function oneone_check() {
		
		if($("#title").val() == "") {
			alert("제목을 입력해주세요.");
			return false;
		} else if($("#content").val() == "") {
			alert("문의하실 내용을 입력해주세요.");
			return false;
		} else {	
			alert("1:1 문의 질문이 등록되었습니다.");
			$("#oneWrite").attr("action", "oneone_insert").submit();
		}
	}
</script>

<style>
	
	/* fieldset > #row_row {
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
    } */
    
    #ulli > li {
    	font-size: 13pt;
    }
    
   /*  .gradebox {
    	width: 43em;
    	border: outset 1px gray; 
    	padding: 1.5em; 
    	margin: 1em;
    	border-radius: 6px;
    	color: #5D5D5D;
    	background-color: #F5F5F5;
    	font-weight: bold;
    } */
    
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
								<li><a href="#" onclick="login_empty_check()">1:1 문의하기</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="oneone_list">1:1 문의하기</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>