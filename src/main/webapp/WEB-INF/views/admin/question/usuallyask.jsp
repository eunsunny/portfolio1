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

    <title>자주묻는질문</title>

    <!-- Custom fonts for this template-->
    <link href="admin_vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="admin_css/sb-admin-2.min.css" rel="stylesheet">

</head>
<style>
.hide{
	display:none;
}
</style>

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
                    <h1 class="h3 mb-4 text-gray-800">자주묻는질문</h1>

                </div>
                <!-- /.container-fluid -->
				<div class="card-body">
                <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="80%" cellspacing="0" style="text-align:center;">
                	<tr>
                		<th><span style="color: red;">자주 찾으시는 질문들</span></th>
                	</tr>
               		<c:forEach items="${questionList}"  var="QuestionVO">
       				<tr>      
       					<td> 
       						<li class="quest" style="list-style:none;">
       							<a href="#"><strong>${QuestionVO.title}</strong></a>
       							<ul class="hide" style="list-style:none;">
       								<li><br></li>
       								<li>${QuestionVO.content}</li>
       								<li><img src="upload_images/question/${QuestionVO.image}" width="200pt"></li>
       								<li>
       									<input type="button" class="btn btn-success btn-sm" value="수정" onclick="location.href='usuallyask_update?qseq=${QuestionVO.qseq}'"/>
       									<input type="button" class="btn btn-success btn-sm" value="삭제" onclick="location.href='usuallyask_delete?qseq=${QuestionVO.qseq}'"/>
       								</li>
       							</ul>
       						</li>
       					</td>
       				</tr>
       				</c:forEach>
                </table>
  				<input type="button" value="자주묻는질문 등록" class="btn btn-success btn-sm" onclick="location.href='usuallyask_add'"/>

                </div>
                </div>

            </div>
            <!-- End of Main Content -->
			
			<!-- footer 연결 -->
			<%@ include file="../footer.jsp" %>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<!-- 로그아웃 연결 -->
    <%@ include file="../logout.jsp" %>

    <!-- Bootstrap core JavaScript-->
    <script src="admin_vendor/jquery/jquery.min.js"></script>
    <script src="admin_vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="admin_vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="admin_js/sb-admin-2.min.js"></script>
    
    <!-- 자주묻는 질문 펼쳐보기 script -->
    <script>
    	$(document).ready(function(){
    		$(".quest>a").click(function(){
    			var answer = $(this).next("ul");
    			if(answer.is(":visible")){
    				answer.slideUp();
    			}
    			else{
    				answer.slideDown();
    			}
    		});
    	});
    </script>

</body>
</html>