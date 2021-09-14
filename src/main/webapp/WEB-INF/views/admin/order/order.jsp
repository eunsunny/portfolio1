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

    <title>결제 관리</title>

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

            <!-- Page Heading1 -->
            <h1 class="h3 mb-4 text-gray-800">주문 리스트</h1>
			
			<div class="card shadow mb-4">
            <div class="card-body">
			<!-- 검색 기능 -->
			<div class="table-responsive">
			<form name="frm" action="order_manage" id="prod_form" method="get">
			<h6 align="right">전체 주문 수 ${pageMaker.totalCount} 건</h6>
			<table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
				<tr>
					<td width="642">
						아이디
						<input type="text" name="key" id="key">
						<input class="btn" type="submit" name="btn_search" value="검색">
						<input class="btn" type="button" name="btn_total" value="전체보기" onClick="location.href='order_manage'">
					</td>
				</tr>
			</table>
			
			<!-- 회원 리스트 테이블 -->
			<div class="card-body">
    		<div class="table-responsive">
        	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
                <tr align="center">
                    <th>번호</th>
                    <th>주문 상품</th>
                    <th>카테고리</th>
                    <th>주문자 아이디</th>
                    <th>주문 날짜</th>
                    <th>결제여부</th>
                    <th>상품 수령여부</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
	    		<c:when test="${orderSize<=0}">
	    			<tr>
	      				<td width="100%" colspan="7" align="center" height="23">
	        				주문내역이 없습니다.
	      				</td>      
	    			</tr>
	    		</c:when>
				<c:otherwise>
				<c:forEach items="${orderList}" var="orderVO">
				    <tr align="center">
				      <td>${number=number+1}</td>
				      <td>   
				         <a href="admin_order_detail${pageMaker.makeQuery(pageMaker.cri.pageNum)}&oseq=${orderVO.oseq}">${orderVO.name}</a>
				   	  </td>
				   	  <td>${orderVO.cod_nm}</td>
				      <td>${orderVO.oid}</td>
				      <td><fmt:formatDate value="${orderVO.order_date}"/></td>
				      <td>
					      <c:choose>
					      	<c:when test="${orderVO.pay_result == 'y'}">결제완료</c:when>
					      	<c:otherwise>미결제</c:otherwise>
					      </c:choose>
				      </td>
				      <td>
					      <c:choose>
					      	<c:when test="${orderVO.rev_result == 'y'}">수령완료</c:when>
					      	<c:otherwise>미수령</c:otherwise>
					      </c:choose>
				      </td> 				      		     
				    </tr>
	   			</c:forEach>
				</c:otherwise>	
				</c:choose>
       		</tbody>
          	</table>
          	
			<!-- 페이징 처리 -->
			<div class="dataTables_wrapper">
			<div class="dataTables_paginate">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a class="btn btn-info btn-icon-split" href="order_manage${pageMaker.makeQuery(pageMaker.startPage-1)}">&nbsp;이전&nbsp;</a>&nbsp;&nbsp;
						</li>
					</c:if>
			
					<!-- [1][2][3]... 표시 부분 -->
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
						<a class="btn btn-info btn-circle btn-sm" href="order_manage${pageMaker.makeQuery(index)}&key=${key}">${index}</a>&nbsp;
					</c:forEach>
			
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a class="btn btn-info btn-icon-split" href="order_manage${pageMaker.makeQuery(pageMaker.endPage+1)}">&nbsp;다음&nbsp;</a>
						</li>
					</c:if>		
				</ul>
			</div>
			</div>
			<!-- End of Paging -->			
			</div>
			</div>
			</form>
			</div>
			</div>
            </div>
            
            
            <!-- page head 2 -->
            <h1 class="h3 mb-4 text-gray-800">주문 리스트</h1>
			
			<div class="card shadow mb-4">
            <div class="card-body">
			<!-- 검색 기능 -->
			<div class="table-responsive">
			<form name="frm" action="order_manage" id="prod_form" method="get">
			<h6 align="right">전체 주문 수 ${pageMaker.totalCount} 건</h6>
			<table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
				<tr>
					<td width="642">
						아이디
						<input type="text" name="key" id="key">
						<input class="btn" type="submit" name="btn_search" value="검색">
						<input class="btn" type="button" name="btn_total" value="전체보기" onClick="location.href='order_manage'">
					</td>
				</tr>
			</table>
			
			<!-- 회원 리스트 테이블 -->
			<div class="card-body">
    		<div class="table-responsive">
        	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
                <tr align="center">
                    <th>번호</th>
                    <th>주문 상품</th>
                    <th>카테고리</th>
                    <th>주문자 아이디</th>
                    <th>주문 날짜</th>
                    <th>결제여부</th>
                    <th>상품 수령여부</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
	    		<c:when test="${orderSize<=0}">
	    			<tr>
	      				<td width="100%" colspan="7" align="center" height="23">
	        				주문내역이 없습니다.
	      				</td>      
	    			</tr>
	    		</c:when>
				<c:otherwise>
				<c:forEach items="${orderList}" var="orderVO">
				    <tr align="center">
				      <td>${number=number+1}</td>
				      <td>   
				         <a href="admin_order_detail${pageMaker.makeQuery(pageMaker.cri.pageNum)}&oseq=${orderVO.oseq}">${orderVO.name}</a>
				   	  </td>
				   	  <td>${orderVO.cod_nm}</td>
				      <td>${orderVO.oid}</td>
				      <td><fmt:formatDate value="${orderVO.order_date}"/></td>
				      <td>
					      <c:choose>
					      	<c:when test="${orderVO.pay_result == 'y'}">결제완료</c:when>
					      	<c:otherwise>미결제</c:otherwise>
					      </c:choose>
				      </td>
				      <td>
					      <c:choose>
					      	<c:when test="${orderVO.rev_result == 'y'}">수령완료</c:when>
					      	<c:otherwise>미수령</c:otherwise>
					      </c:choose>
				      </td> 				      		     
				    </tr>
	   			</c:forEach>
				</c:otherwise>	
				</c:choose>
       		</tbody>
          	</table>
          	
			<!-- 페이징 처리 -->
			<div class="dataTables_wrapper">
			<div class="dataTables_paginate">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a class="btn btn-info btn-icon-split" href="order_manage${pageMaker.makeQuery(pageMaker.startPage-1)}">&nbsp;이전&nbsp;</a>&nbsp;&nbsp;
						</li>
					</c:if>
			
					<!-- [1][2][3]... 표시 부분 -->
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
						<a class="btn btn-info btn-circle btn-sm" href="order_manage${pageMaker.makeQuery(index)}&key=${key}">${index}</a>&nbsp;
					</c:forEach>
			
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a class="btn btn-info btn-icon-split" href="order_manage${pageMaker.makeQuery(pageMaker.endPage+1)}">&nbsp;다음&nbsp;</a>
						</li>
					</c:if>		
				</ul>
			</div>
			</div>
			<!-- End of Paging -->			
			</div>
			</div>
			</form>
			</div>
			</div>
            </div>
            
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->
       
        <%@ include file="../footer.jsp" %>

    </div>
    <!-- End of Page Wrapper -->
    </div>

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