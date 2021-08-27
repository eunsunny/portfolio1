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
  

  <link rel="stylesheet" href="css/main.css" />
</head>
<body>
<div class="container py-5">
	<div class="row aln-center">
		<h2 style="margin-top:3em; margin-bottom:2em; padding-left:0;">비밀번호 찾기</h2>
	</div>
		<div class="row aln-center" style="margin-bottom:3.5em;">
		<div style="float:center; width:80%;">
			<form name="findPwd" id="findPwd" action="find_pwd" method="get">
			<div style="margin-left:3em;">
				<div class="row aln-left" style="line-height:2.5em; margin-bottom:1.5em;">
					<div class="col-3" style="vertical-align:center; text-align:right;">아이디: </div>
					<div class="col-5"><input type="text" name="id" id="id" value="" autofocus></div>
				</div>
				<div class="row aln-left" style="line-height:2.5em; margin-bottom:1.5em;">
					<div class="col-3" style="vertical-align:center; text-align:right;">이름: </div>
					<div class="col-5"><input type="text" name="name" id="name" value="" autofocus></div>
				</div>
				<div class="row aln-left" style="line-height:2.5em; margin-bottom:1.5em;">
					<div class="col-3" style="vertical-align:center; text-align:right;">이메일: </div>
					<div class="col-5"><input type="text" name="email" id="email" value=""></div>
				</div>
				</div>
				<div class="row aln-center" style="margin-top:1em; margin-right:0.1em;">
					<input type="button" value="비밀번호 찾기" class="submit" onclick="findMemberPwd()"/>
				</div>
				<div style="margin-top:1em; text-align:center;">
					<a href="find_id_form" style="margin-left:-3em;">아이디 찾기</a>
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