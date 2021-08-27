<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

	<meta charset="UTF-8">
	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="member/member.js"></script>
	
	
	<link rel="stylesheet" href="css/main.css" />

<script type="text/javascript">

function idok(){
  self.close();
}
</script>

</head>
<body>
<div class="container py-5">
	<div class="row aln-center">
		<div class="col-lg-5">
  		<form method=get name=formm style="margin-top:3.8em;" id="pwd_form">
	      <c:if test="${message == 1}">
	  		<span style="font-size:20px;"><b> ${id}</b>님, 비밀번호를 변경해주세요.</span>
	  		<input type=hidden name="id" id="id" value="${id}">
	  		<p></p>
	        <input type="password" name="pwd" id="pwd" placeholder="새로운 비밀번호" autofocus> 
	        <input type="password"  name="pwdCheck" id="pwdCheck" placeholder="비밀번호 확인" style="margin-top:0.5em;"><br> 
            <button type="button" class="cancel" onclick="changePassword()" style="font-size:15px;">비밀번호 변경</button>
	      </c:if>
	      <c:if test="${message == -1}">
             <span style="font-size:20px;">잘못된 사용자 정보입니다.</span>
		    <button type="button" class="cancel" onclick="idok()" style="font-size:15px;">확인</button>
	      </c:if>
	      <p></p>
	</form>
  </div>
</div>  
</div>
</body>
</html>