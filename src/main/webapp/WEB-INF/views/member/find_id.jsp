<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
 	
 	  <script src="js/jquery-1.11.0.min.js"></script>
  <script src="js/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="member/member.js"></script>
  <script type="text/javascript" src="js/product.js"></script>
  
  
  	<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->


  <link rel="stylesheet" href="css/main.css" />
 <%-- 
  <script>
  
  $('#myTab a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
	});
  
	
  </script> --%>
</head>
<body>

	<!-- <ul id="myTab" class="nav nav-tabs">
  		<li role="presentation" class="active"><a href="#">동명 검색</a></li>
  		<li role="presentation"><a href="find_pwd_form">비밀번호찾기</a></li>
	</ul> -->
	
<div class="container py-5">
	<div class="row aln-center">
		<h2 style="margin-top:3em; margin-bottom:2em; padding-left:0;">아이디 찾기</h2>
	</div>
		<div class="row aln-center" style="margin-bottom:3.5em;">
		<div style="float:center; width:80%;">
			<form name="findId" id="findId" action="find_id" method="get">
			<div style="margin-left:3em;">
				<div class="row aln-left" style="line-height:2.5em; margin-bottom:1.5em;">
					<div class="col-3" style="vertical-align:center; text-align:right;">이 름: </div>
					<div class="col-5"><input type="text" name="name" id="name" value="" autofocus></div>
				</div>
				<div class="row aln-left" style="line-height:2.5em; margin-bottom:1.5em;">
					<div class="col-3" style="vertical-align:center; text-align:right;">이메일: </div>
					<div class="col-5"><input type="text" name="email" id="email" value=""></div>
				</div>
				</div>
				<div class="row aln-center" style="margin-top:1em; ">
					<input type="button" value="아이디 찾기" class="submit" id="check" onclick="findMemberId()"/>
				</div>
				<div style="margin-top:1em; text-align:center;">
					<a href="find_pwd_form" style="margin-left:-1.5em;">비밀번호 찾기</a>
					<span>|</span>
					<a href="login_form">로그인</a>
				</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>
<%@ include file="../footer.jsp"%>