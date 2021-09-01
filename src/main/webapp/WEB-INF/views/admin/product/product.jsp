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

    <title>상품 관리</title>

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
        <h1 class="h3 mb-4 text-gray-800">상품 관리</h1>

        <!-- DataTales Example -->
		<div class="card shadow mb-4">
        <div class="card-body">
            
		<!-- 검색 기능 -->
		<div class="table-responsive">
		<form name="frm" action="product_manage" id="prod_form" method="get">
		<h6 align="right">전체 상품 수 ${pageMaker.totalCount} 개</h6>		
		<table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
			<tr>
				<td width="642">
   					상품명 
   					<input type="text" name="key" id="key">
   					<input class="btn" type="submit" name="btn_search" value="검색">
   					<input class="btn" type="button" name="btn_total" value="전체보기 " onClick="location.href='product_manage'">
 				</td>
			</tr>
		</table>
		
		<!-- 상품 리스트 테이블 -->
		<div class="card-body">
   		<div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
    		<tr>
        		<th>번호</th><th>상품명</th><th>카테고리</th><th>가격</th><th>상품등록제목</th>
        		<th>등록일</th><th>상품판매여부</th><th>등록자 아이디</th>
    		</tr>
    		<c:choose>
    			<c:when test="${productListSize<=0}">
    				<tr>
      					<td width="100%" colspan="7" align="center" height="23">
        					등록된 상품이 없습니다.
      					</td>      
    				</tr>
    			</c:when>
			<c:otherwise>
			<c:forEach items="${productList}" var="productVO">
			    <tr>
			      <td height="23" align="center" >${number=number+1}</td>
			      <td style="text-align: left; padding-right: 0px;">   
			         <a href="admin_product_detail${pageMaker.makeQuery(pageMaker.cri.pageNum)}&pseq=${productVO.pseq}"> 
			    	 	${productVO.name}     
			   		 </a>
			   	  </td>
			      <td>
			      	<c:choose>
			      		<c:when test="${productVO.kind eq 1}">패션의류/잡화</c:when>
			      		<c:when test="${productVO.kind eq 2}">뷰티</c:when>
			      		<c:when test="${productVO.kind eq 3}">출산/유아동</c:when>
			      		<c:when test="${productVO.kind eq 4}">식품</c:when>
			      		<c:when test="${productVO.kind eq 5}">주방/생활용품</c:when>
			      		<c:when test="${productVO.kind eq 6}">인테리어</c:when>
			      		<c:when test="${productVO.kind eq 7}">가전디지털</c:when>
			      		<c:when test="${productVO.kind eq 8}">스포츠/레저</c:when>
			      		<c:when test="${productVO.kind eq 9}">자동차용품</c:when>
			      		<c:when test="${productVO.kind eq 10}">도서/음반/DVD</c:when>
			      		<c:when test="${productVO.kind eq 11}">완구/문구/취미</c:when>
			      		<c:when test="${productVO.kind eq 12}">반려동물용품</c:when>
			      		<c:when test="${productVO.kind eq 13}">헬스/건강식품</c:when>
			      	</c:choose>
			      </td>
			      <td><fmt:formatNumber value="${productVO.price}"/></td>
			      <td>${productVO.title}</td>
			      <td><fmt:formatDate value="${productVO.regdate}"/></td>
			      <td>
			      	<c:choose>
			   	 		<c:when test='${productVO.soldyn=="n"}'>미사용</c:when>
			   	 		<c:otherwise>사용</c:otherwise>  	 		
			   	 	</c:choose>
			   	  </td>
			   	  <td>${productVO.id}</td>
			    </tr>
		    </c:forEach>
			</c:otherwise>	
			</c:choose>  
		</table>

		<!-- 페이징 처리 -->
		<div class="dataTables_wrapper">
		<div class="dataTables_paginate">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous">
					<a class="btn btn-info btn-icon-split" href="product_manage${pageMaker.makeQuery(pageMaker.startPage-1)}">&nbsp;이전&nbsp;</a>&nbsp;&nbsp;
				</li>
				</c:if>
					
				<!-- [1][2][3]... 표시 부분 -->
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
						<a class="btn btn-info btn-circle btn-sm" href="product_manage${pageMaker.makeQuery(index)}&key=${key}">${index}</a>&nbsp;
					</c:forEach>
			
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next">
						<a class="btn btn-info btn-icon-split" href="product_manage${pageMaker.makeQuery(pageMaker.endPage+1)}">&nbsp;다음&nbsp;</a>
					</li>
				</c:if>			
			</ul>
		</div>
		</div>
		</div>
		</div>
		</form>
		</div>
		</div>
		</div>

        </div>
        <!-- End of Main Content -->

		<%@ include file="../footer.jsp" %>

	    </div>
	    <!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

	    <!-- Scroll to Top Button-->
	    <a class="scroll-to-top rounded" href="#page-top">
	        <i class="fas fa-angle-up"></i>
	    </a>
	
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