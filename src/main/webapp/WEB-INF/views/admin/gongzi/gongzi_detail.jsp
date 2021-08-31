<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지사항 관리</title>

    <!-- Custom fonts for this template-->
    <link href="admin_vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="admin_css/sb-admin-2.min.css" rel="stylesheet">

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
                    <h1 class="h3 mb-4 text-gray-800">공지사항 관리</h1>

                </div>
                <!-- /.container-fluid -->
                <div class="card-body">
                <div class="table-responsive">
                <label>제목</label>
                <p> ${gongzi.title} </p>
                <label>작성일</label>
                <p><fmt:formatDate value="${gongzi.regdate}" type="date"/></p>
                <label>조회수</label>
                <p> ${gongzi.count}</p>
                <label>이미지</label>
                <p> <img src="upload_images/gongzi/${gongzi.image}" width="200pt"></p>
                <label>내용</label>
                <textarea rows="" cols="100" readonly="readonly" >${gongzi.content}</textarea>
				
				<br><br>
                <input type="button" class="btn btn-success btn-sm" onclick="location.href='gongzi_add'" value="새 공지사항"/> &nbsp; &nbsp;
                <input type="button" class="btn btn-success btn-sm" onclick="location.href='gongzi_update?gseq=${gongzi.gseq}'" value="수정"/> &nbsp; &nbsp;
                <input type="button" class="btn btn-success btn-sm" onclick="location.href='gongzi_delete?gseq=${gongzi.gseq}'" value="삭제"/> &nbsp; &nbsp;                
                <input type="button" class="btn btn-success btn-sm" onclick="location.href='gongzi'" value="리스트로 돌아가기"/>
                
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