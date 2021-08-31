<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>자유게시판 관리</title>

    <!-- Custom fonts for this template-->
    <link href="admin_vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="admin_css/sb-admin-2.min.css" rel="stylesheet">
    
    <script type="text/javascript">
    	function delete_check(){
    		var bseq = $("#bseq");
    		
    		var check = confirm("삭제하시겠습니까?");
    		
    		if(check == true){
    			location.href="admin_board_delete?bseq="+bseq.val();
    			return true;
    		}
    		else
    			return false;
    	}
    </script>
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
            <h1 class="h3 mb-4 text-gray-800">게시글</h1>

            </div>
            <!-- /.container-fluid -->
            <div class="card-body">
            <div class="table-responsive">
            <input type="hidden" id="bseq" name="bseq" value="${board.bseq}"/>
            <label>제목</label> &nbsp; ${board.title}<br>
            <label>작성자 아이디</label> &nbsp; ${board.id}<br>           
            <label>내용</label> &nbsp; ${board.content}<br>
            <label>첨부 이미지</label> &nbsp; ${board.image}<br>
            <label>등록일</label> &nbsp; <fmt:formatDate value="${board.regdate}" type="date"/><br>
            <label>조회수</label> &nbsp; ${board.count}<br>               

			<br><br>
            <input type="button" class="btn btn-success btn-sm" onclick="delete_check()" value="삭제"/> &nbsp; &nbsp;                
            <input type="button" class="btn btn-success btn-sm" onclick="location.href='board'" value="리스트로 돌아가기"/>
            
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