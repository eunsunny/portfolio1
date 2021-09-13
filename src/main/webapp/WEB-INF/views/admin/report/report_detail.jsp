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
            <table  class="type05">
        		<tbody>
		            <tr>
		                <th scope="row">신고한 회원 아이디</th>
		                <td>${Report.id}</td>
		            </tr>
		            <tr>
		                <th scope="row">신고당한 회원 아이디</th>
		                <td>${Report.report_id}</td>
		            </tr>
		            <tr>
		                <th scope="row">신고사유</th>
		                <td>
		                	<c:choose>
				         		<c:when test="${Report.rp_kind == 1}">
				         			허위 상품
				         		</c:when>
				         		<c:when test="${Report.rp_kind == 2}">
				         			과대 홍보
				         		</c:when>
				         		<c:when test="${Report.rp_kind == 3}">
				         			비매너/욕설
				         		</c:when>
				         		<c:when test="${Report.rp_kind == 4}">
				         			결제관련
				         		</c:when>
				         		<c:when test="${Report.rp_kind == 5}">
				         			기타
				         		</c:when>
				         	</c:choose>
		                </td>
		            </tr>
		            <tr>
		                <th scope="row">내용</th>
		                <td>${Report.content}</td>
		            </tr>		            
		            <tr>
		                <th scope="row">신고 날짜</th>
		                <td><fmt:formatDate value="${Report.report_date}" type="date"/></td>
		            </tr>
		            <tr>
						<th scope="row">처리 여부</th>
						<td>
							<c:choose>
						      	<c:when test="${Report.result == 'y'}">처리완료</c:when>
						      	<c:otherwise>미처리</c:otherwise>
							</c:choose>				
						</td>
					</tr>
        		</tbody>
    		</table>
    		
			<br><br>
			<div align="center">
			<c:if test="${Report.result == 'n'}">
				<input type="hidden" id="rseq" name="rseq" value="${Report.rseq}"/>
				<input type="button" class="btn btn-success btn-sm" onclick="report_success()" value="처리 완료"/> &nbsp; &nbsp;
			</c:if>
            <input type="button" class="btn btn-success btn-sm" onclick="location.href='report'" value="리스트로 돌아가기"/>
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