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
    
    <!-- Custom styles for this page -->
    <link href="admin_vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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

                <!-- /.container-fluid -->
                <div class="card shadow mb-4">
                <div class="card-body">
                
                <!-- 검색 기능 -->
				<div class="table-responsive">
				<form name="frm" action="gongzi" method="get">
				<h6 align="right">전체 공지사항 갯수 ${pageMaker.totalCount} 개</h6>
				<table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
					<tr>
						<td width="642">
							제목
							<input type="text" name="key" id="key">
							<input class="btn" type="submit" name="btn_search" value="검색">
							<input class="btn" type="button" name="btn_total" value="전체보기" onClick="location.href='gongzi'">
						</td>
					</tr>
				</table>
				</form>
				
				<div class="card-body">
                <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
                	<tr align="center">
                		<th>번호</th>
                		<th>제목</th>
                		<th>등록 날짜</th>
                		<th>조회 수</th>
                	</tr>
               		<c:forEach items="${gongziList}"  var="gongziVO">
       				<tr align="center">      
       					<td> ${gongziVO.gseq}</td>
       					<td> <a href="gongzi_detail?gseq=${gongziVO.gseq}">${gongziVO.title}</a></td>
				        <td> <fmt:formatDate value="${gongziVO.regdate}" type="date"/></td>
				        <td> ${gongziVO.count}</td>
       				</tr>
       				</c:forEach>
                </table>
                
            <!-- 페이징 처리 -->
			<div class="dataTables_wrapper">
			<div class="dataTables_paginate">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a class="btn btn-info btn-icon-split" href="oneone${pageMaker.makeQuery(pageMaker.startPage-1)}">이전</a>&nbsp;&nbsp;
						</li>
					</c:if>
			
					<!-- [1][2][3]... 표시 부분 -->
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
						<a class="btn btn-info btn-circle btn-sm" href="gongzi${pageMaker.makeQuery(index)}&key=${key}">${index}</a>&nbsp;
					</c:forEach>
			
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a class="btn btn-info btn-icon-split" href="gongzi${pageMaker.makeQuery(pageMaker.endPage+1)}">다음</a>
						</li>
					</c:if>		
				</ul>
			</div>
			</div>
			<!-- End of Paging -->
  			<input type="button" class="btn btn-success btn-sm" value="새 공지사항 등록" onclick="location.href='gongzi_add'"/>
  			</div>
			</div>
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