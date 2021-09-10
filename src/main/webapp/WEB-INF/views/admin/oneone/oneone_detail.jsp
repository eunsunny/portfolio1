<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>1:1문의 관리</title>

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
            <h1 class="h3 mb-4 text-gray-800">1:1 문의</h1>

            </div>
            <!-- /.container-fluid -->
            <div class="card-body">
            <div class="table-responsive">
            <table  class="type05">
        		<tbody>
		            <tr>
		                <th scope="row">제목</th>
		                <td>${oneone.title}</td>
		            </tr>
		            <tr>
		                <th scope="row">작성자 아이디</th>
		                <td>${oneone.id}</td>
		            </tr>
		            <tr>
		                <th scope="row">내용</th>
		                <td>${oneone.content}</td>
		            </tr>
		            <tr>
		                <th scope="row">등록일</th>
		                <td><fmt:formatDate value="${oneone.regdate}" type="date"/></td>
		            </tr>
		            <tr>
						<th scope="row">답변 여부</th>
						<td>
							<c:choose>
						      	<c:when test="${oneone.rep == 'y'}">답변완료</c:when>
						      	<c:otherwise>미답변</c:otherwise>
							</c:choose>				
						</td>
					</tr>
					<tr>
						<th scope="row">답변</th>
						<td>${oneone.reply }</td>
		            </tr>
        		</tbody>
    		</table>
    		
            <input type="hidden" id="onseq" name="onseq" value="${oneone.onseq}"/>

			<br><br>
			<div align="center">
			<c:if test="${oneone.rep == 'n'}">
				<input type="button" class="btn btn-success btn-sm" onclick="location.href='oneone_reply?onseq=${oneone.onseq}'" value="답변 입력하기"/> &nbsp; &nbsp;
			</c:if>
            <input type="button" class="btn btn-success btn-sm" onclick="location.href='oneone'" value="리스트로 돌아가기"/>
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