<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">  

</head>
<body>
   <div class="container py-5">
	<div class="row aln-center">
		<div class="col-lg-3">
	<div>
		<h1 style="margin-top:2.7em; margin-bottom:1em; font-size:35px;">LOGIN</h1>
	</div>
			<form id="login" method="post" action="login">
				<div>
					<input name="id" id="id" placeholder="아이디" type="text" size="40" autofocus/>
				</div>
				<div style="margin-top:0.6em;">
					<input name="pwd" id="pwd" placeholder="비밀번호" type="password" size="40"/>
				</div>
				<div align="center" style="margin-top:1em;">
					<button type="button" class="submit" onclick="loginCheck()">LOGIN</button>
				</div>
				<div class="row aln-center">
					<div class="div" style="margin-top:1em; margin-bottom:5em;">
						<a href="find_id_form">아이디 찾기</a> <!-- 컨트롤러에서 넘기기(확인필요) -->
					<span> | </span>
						<a href="find_pwd_form">비밀번호 찾기</a><!-- 컨트롤러에서 넘기기(확인필요) --> 
					<span> | </span>
						<a href="contract">회원가입</a><!-- 컨트롤러에서 넘기기 -->
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>
<%@ include file="../footer.jsp"%>