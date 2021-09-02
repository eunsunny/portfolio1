<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>신고 관리</title>

<!-- Custom fonts for this template-->
<link href="admin_vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="admin_css/sb-admin-2.min.css" rel="stylesheet">

<script type="text/javascript">
function report_success(){
	var rep_confirm = confirm("처리 완료 되었습니까?");
	var rseq = $("#rseq");
	
	if(rep_confirm == true){
		alert("처리 완료 되었습니다.");
		location.href="admin_report_update?rseq="+rseq.val();
	}
	else{
		return false;
	}
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
            <h1 class="h3 mb-4 text-gray-800">신고내역 상세보기</h1>

            </div>
            <!-- /.container-fluid -->
            <div class="card-body">
            <div class="table-responsive">
            <label>신고한 회원 아이디</label> &nbsp; ${Report.id}<br>
            <label>신고당한 회원 아이디</label> &nbsp; ${Report.report_id}<br>           
            <label>신고 사유</label> &nbsp; ${Report.rp_kind}<br>
            <label>신고 날짜</label> &nbsp; <fmt:formatDate value="${Report.report_date}" type="date"/><br>
            <label>내용</label> &nbsp; ${Report.content}<br>
            <label>처리 여부</label> &nbsp;
		      	<c:choose>
		      		<c:when test="${Report.result=='n'}">미처리</c:when>
		      		<c:otherwise>처리완료</c:otherwise>
		      	</c:choose><br>
			<br><br>
			<c:if test="${Report.result == 'n'}">
				<input type="hidden" id="rseq" name="rseq" value="${Report.rseq}"/>
				<input type="button" class="btn btn-success btn-sm" onclick="report_success()" value="처리 완료"/> &nbsp; &nbsp;
			</c:if>
            <input type="button" class="btn btn-success btn-sm" onclick="location.href='report'" value="리스트로 돌아가기"/>
            
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