<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
  		<form method=post name=formm style="margin-top:2.8em;">
	      <c:if test="${message == 1}">
	        <script type="text/javascript">
	          opener.document.formm.id.value="";
	        </script>
	             <span style="font-size:20px;">요청하신 ID는 "<b> ${id} </b>"입니다.</span>
	      </c:if>
	      <c:if test="${message==-1}">
	             <span style="font-size:20px;">가입되지 않은 사용자입니다.</span>
	      </c:if>
	      <p></p>
	    <button type="button" class="cancel" onclick="idok()" style="font-size:15px;">확인</button>
	</form>
  </div>
</div>  
</div>
</body>
</html>