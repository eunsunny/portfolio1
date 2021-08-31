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
                    <h1 class="h3 mb-4 text-gray-800">상품 상세보기</h1>

                </div>
                <!-- /.container-fluid -->
                <div class="card-body">
                <div class="table-responsive">
                <label>상품이름</label>
                <p> ${Product.name} </p>
                <label>등록자 아이디</label>
                <p>${Product.id}</p>                 
                <label>카테고리</label>
                <p>${Product.kind}</p>
                <label>가격</label>
                <p>${Product.price}</p>
                <label>상품 등록제목</label>
                <p>${Product.title}</p> 
                <label>상품 설명</label>
                <p>${Product.content}</p>                 
                <label>이미지</label>
                <p> 
                <c:forEach items="${productImageList}" var="productImage">
                	<img src="upload_images/product/${productImage.product_image}" width="200pt">
                </c:forEach>
                </p>
                <label>등록일</label>
                <p><fmt:formatDate value="${Product.regdate}" type="date"/></p>
                <label>판매여부</label>
                <p> ${Product.soldyn}</p>
				
				<br><br>
                <input type="button" onclick="location.href='admin_product_delete?pseq=${Product.pseq}'" value="삭제"/> &nbsp; &nbsp;                
                <input type="button" onclick="location.href='product_manage'" value="리스트로 돌아가기"/>
                
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