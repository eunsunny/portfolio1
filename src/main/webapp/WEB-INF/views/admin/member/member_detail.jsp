<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>회원 관리</title>

    <!-- Custom fonts for this template-->
    <link href="admin_vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="admin_css/sb-admin-2.min.css" rel="stylesheet">
<style>
	
table.type05 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 4px solid #ccc;
  border-bottom: 5px double #ccc; 
  margin: 20px 10px;
  width : 800px;
  margin-left:auto; 
  margin-right:auto;
  background-color: white;
}
table.type05 th {
  width: 30%;
  padding: 10px;
  font-weight: bold;
  text-align : center;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
  background: #ffc0cb;
}
table.type05 td {
  width: 70%;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
</style>

</head>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">

<!-- 사이드 바 연결 -->
<%@ include file="../sidebar.jsp"%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

           <%@ include file="../topbar.jsp" %>

            <!-- Begin Page Content -->
            <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-4 text-gray-800">회원 상세보기</h1>

            </div>
            <!-- /.container-fluid -->
            <div class="card-body">
            <div class="table-responsive">
            <table class="type05">
        		<tbody>
		            <tr>
		                <th scope="row">아이디</th>
		                <td>${Member.id}</td>
		            </tr>
		            <tr>
		                <th scope="row">이름</th>
		                <td>${Member.name}</td>
		            </tr>
		            <tr>
		                <th scope="row">닉네임</th>
		                <td>${Member.nick_name}</td>
		            </tr>
		            <tr>
		                <th scope="row">등급</th>
		                <td>
		                	<c:choose>
			            		<c:when test="${Member.grade eq 1}"><img src="grade_images/1.png" width="50px;"> 브론즈</c:when>
			            		<c:when test="${Member.grade eq 2}"><img src="grade_images/2.png" width="50px;"> 실버</c:when>
			            		<c:when test="${Member.grade eq 3}"><img src="grade_images/3.png" width="50px;"> 골드</c:when>
			            		<c:when test="${Member.grade eq 4}"><img src="grade_images/4.png" width="50px;"> 플래티넘</c:when>
			            		<c:when test="${Member.grade eq 5}"><img src="grade_images/5.png" width="50px;"> 다이아몬드</c:when>
			            	</c:choose>
		                </td>
		            </tr>
		            <tr>
		                <th scope="row">이메일</th>
		                <td>${Member.email}</td>
		            </tr>
		            <tr>
		                <th scope="row">전화번호</th>
		                <td>${Member.phone}</td>
		            </tr>
		            <tr>
		                <th scope="row">우편번호</th>
		                <td>${Member.zip_num}</td>
		            </tr>
		            <tr>
		                <th scope="row">주소</th>
		                <td>${Member.address}</td>
		            </tr>
		            <tr>
		                <th scope="row">관심 카테고리</th>
		                <td>
		                	<c:choose>
					      		<c:when test="${Member.inter_kind eq 1}">패션의류/잡화</c:when>
					      		<c:when test="${Member.inter_kind eq 2}">뷰티</c:when>
					      		<c:when test="${Member.inter_kind eq 3}">출산/유아동</c:when>
					      		<c:when test="${Member.inter_kind eq 4}">식품</c:when>
					      		<c:when test="${Member.inter_kind eq 5}">주방/생활용품</c:when>
					      		<c:when test="${Member.inter_kind eq 6}">인테리어</c:when>
					      		<c:when test="${Member.inter_kind eq 7}">가전디지털</c:when>
					      		<c:when test="${Member.inter_kind eq 8}">스포츠/레저</c:when>
					      		<c:when test="${Member.inter_kind eq 9}">자동차용품</c:when>
					      		<c:when test="${Member.inter_kind eq 10}">도서/음반/DVD</c:when>
					      		<c:when test="${Member.inter_kind eq 11}">완구/문구/취미</c:when>
					      		<c:when test="${Member.inter_kind eq 12}">반려동물용품</c:when>
					      	</c:choose>
		                </td>
		            </tr>		            
		            <tr>
		                <th scope="row">회원가입일</th>
		                <td><fmt:formatDate value="${Member.regdate}" type="date"/></td>
		            </tr>
        		</tbody>
    		</table>
			<br><br>
			
			<div align="center">
            	<input type="button" class="btn btn-success btn-sm" onclick="location.href='admin_member_delete?id=${Member.id}'" value="삭제"/> &nbsp; &nbsp;                
            	<input type="button" class="btn btn-success btn-sm" onclick="location.href='member_manage'" value="리스트로 돌아가기"/>
            </div>
            
            </div>
            </div>

        </div>
		<!-- End of Main Content -->

<!-- footer 연결 -->
<%@ include file="../footer.jsp"%>

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<!-- 로그아웃 알림창 연결 -->
	<%@ include file="../logout.jsp" %>

    <!-- Bootstrap core JavaScript-->
    <script src="admin_vendor/jquery/jquery.min.js"></script>
    <script src="admin_vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- Core plugin JavaScript-->
    <script src="admin_vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="admin_js/sb-admin-2.min.js"></script>

</body>
</html>