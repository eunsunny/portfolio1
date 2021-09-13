<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Sunny-Flea-Market</title>

<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="member/member.js"></script>
<script type="text/javascript" src="js/product.js"></script>

<link rel="stylesheet" href="css/main.css" />

</head>
<style>

</style>
<body class="homepage is-preload">
	
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container" style="padding-bottom: 3em;">
					<!-- login nav -->
							<nav id="nav">
								<div class="lognav">
								<ul>
									<c:choose>
										<c:when test="${empty sessionScope.loginUser}">
											<li><span><a href="admin_index">admin</a></span></li>
											<li><span><a href="login_form">login</a></span></li>
											<li> | </li>
											<li><span><a href="contract">회원가입</a></span></li>
											<li> | </li>
											<li><span><a href="#" onclick="login_empty_check()">찜목록</a></span></li>
											<li> | </li>
											<li><span><a href="#" onclick="login_empty_check()">내등급</a></span></li>
											<li> | </li>
											<li><span><a href="#" onclick="login_empty_check()">쪽지</a></span></li>
										</c:when>
										<c:otherwise>
											<li style="color:orange">
											<img src="grade_images/${sessionScope.loginUser.grade}.png" width="20" height="20" >
											<span>
												${sessionScope.loginUser.name}(${sessionScope.loginUser.id})
												<input type="hidden" value="${sessionScope.loginUser.id}" id="session_id"/>
											</span>
											</li>
											<li> | </li>
											<li><span><a href="logout" onclick="logout()">logout</a></span></li>
											<li> | </li>
											<li><span><a href="jjim_list">찜목록</a></span></li>
											<li> | </li>
											<li><span><a href="grade_detail">내등급</a></span></li>
											<li> | </li>
											<li><span><a href="message_list">쪽지</a></span></li>
										</c:otherwise>
									</c:choose>
								</ul>
								</div>
							</nav>
						<!-- Logo -->
							<h1 id="logo"><a href="index.html">Sunny Flea Market</a></h1>
							<p>안전한 중고거래, 써니 플리마켓</p>
							
						
						<!-- Nav -->
							<nav id="nav">
								<ul>
									<li><a class="icon solid fa-home" href="index.html"><span>Home</span></a></li>
									<li>
										<a href="#" class="icon fa-chart-bar"><span>Categories</span></a>
										<ul>
											<li><a href="category?kind=1">패션의류/잡화</a></li>
											<li><a href="category?kind=2">뷰티</a></li>
											<li><a href="category?kind=3">출산/유아동</a></li>
											<li><a href="category?kind=4">식품</a></li>
											<li><a href="category?kind=5">주방/생활용품</a></li>
											<li><a href="category?kind=6">인테리어</a></li>
											<li><a href="category?kind=7">가전디지털</a></li>
											<li><a href="category?kind=8">스포츠/레저</a></li>
											<li><a href="category?kind=9">자동차용품</a></li>
											<li><a href="category?kind=10">도서/음반/DVD</a></li>
											<li><a href="category?kind=11">완구/문구/취미</a></li>
											<li><a href="category?kind=12">반려동물</a></li>
											<li><a href="category?kind=13">헬스/건강식품</a></li>
											<li>
												<a href="category?kind=14">무료나눔</a>
												<ul>
													<li><a href="#">Magna phasellus</a></li>
													<li><a href="#">Etiam dolore nisl</a></li>
													<li><a href="#">Phasellus consequat</a></li>
												</ul>
											</li>
											
										</ul>
									</li>
								<c:choose>
									<c:when test="${empty sessionScope.loginUser}">
										<li><a class="icon solid fa-retweet" href="member_info"
											onclick="login_empty_check()"><span>MY PAGE</span></a>
											<ul>
		
												<li><a href="#" onclick="login_empty_check()">회원정보 변경</a></li>
												<li><a href="#" onclick="login_empty_check()">찜목록</a></li>
												<li><a href="#" onclick="login_empty_check()">상품등록</a></li>
												<li><a href="#" onclick="login_empty_check()">내상품조회/수정</a></li>
												<li><a href="#" onclick="login_empty_check()">주문결제내역</a></li>
												<li><a href="#" onclick="login_empty_check()">내등급관리</a></li>
											</ul></li>
									</c:when>
									<c:otherwise>
										<li><a class="icon solid fa-retweet" href="member_info"><span>MY PAGE</span></a>
											<ul>
												<li><a href="member_update_form">회원정보 변경</a></li>
												<li><a href="jjim_list">찜목록</a></li>
												<li><a href="admin_product_write_form">상품등록</a></li>
												<li><a href="my_prod_list">내상품조회/수정</a></li>
												<li><a href=order_list>주문결제내역</a></li>
												<li><a href="grade_detail">내등급관리</a></li>
		
											</ul></li>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${empty sessionScope.loginUser}">
								<li><a class="icon solid fa-sitemap" href="#" onclick="login_empty_check()"><span>Flea-Board</span></a></li>
								</c:when>
								<c:otherwise>
								<li><a class="icon solid fa-sitemap" href="moveBoard"><span>Flea-Board</span></a></li>
								</c:otherwise>
								</c:choose>
								
								<li><a class="icon solid fa-cog" href="notice_list"><span>NOTICE</span></a>
									<ul>
										<li><a href="notice_list">공지사항</a></li>
										<li><a href="question_list">자주묻는 질문</a></li>
									<c:choose>
										<c:when test="${empty sessionScope.loginUser}">
											<li><a href="#" onclick="login_empty_check()">1:1 문의하기</a></li>
											<li><a href="#" onclick="login_empty_check()">신고 하기</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="oneone_list">1:1 문의하기</a></li>
											<li><a href="report_write_view">신고 하기</a></li>
										</c:otherwise>
									</c:choose>
									</ul></li>
								</ul>
							</nav>
							<br>
							
<br>
<br>						
<form name="form1" method="post" action="list.do">
<div style="display: inline-flex;">
    <select  class="form-control" name="search_option" style="background-color:#F6F6F6; width:115px; font-weight:bold; padding-left:1.5em;">
        <option value="id"
<c:if test="${map.search_option == 'user_id'}">selected</c:if>
   >작성자</option>

        <option value="title" 
<c:if test="${map.search_option == 'title'}">selected</c:if>
        >제목</option>

        <option value="content" 
<c:if test="${map.search_option == 'content'}">selected</c:if>
        >내용</option>

        <option value="all" 
<c:if test="${map.search_option == 'all'}">selected</c:if>
        >전체</option>

    </select>
    <input name="keyword" value="${map.keyword}" size="70" placeholder="검색어를 입력하세요" style="margin-left:8px;">
    <button type="submit" style="margin-left:13px;">조회</button>
</div>
</form>

					</div>
				</section>
			</div>
			
  </body>
</html>