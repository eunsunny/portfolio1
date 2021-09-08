<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<script>
 alert("결제에 성공하였습니다.");
 
 function goHome() {
	 location.href="index";
 }
</script>




<article>
	<div class="row">
	

	<form id="formm" name="formm" method="post">
		<input type="hidden" name="pseq" id="pseq" value="${buyerInfo.pseq}" />
		<input type="hidden" name="kind" id="kind" value="${buyerInfo.kind}" />
		
		<div style="font-size: 30px; margin-top: 60px;">
		<h1>결제내역</h1>  
		</div>	
		<br>
		
		<table id="list">
		
<!-- 		<p> -->
<%-- 		<span>name:</span> <input name="name" value="${buyerInfo.loginUserName}"> --%>
<!-- 			<!-- 값 가져오기 -->
<!-- 		</p> -->
		<tr>
			  <th>이름</th>
			  <td width="343" colspan="5">
			       <input type="text" name="name" id="name" size="47" maxlength="100" value="${buyerInfo.loginUserName}" disabled>
			  </td>
		</tr>
		
<!-- 		<p> -->
<!-- 			<span>이메일:</span> <input name="email" id="email"> -->
<!-- 		</p> -->

		<tr>
			  <th>이메일</th>
			  <td width="343" colspan="5">
			       <input type="text" name="email" id="email" size="47" maxlength="100" value="${buyerInfo.email}" disabled>
			  </td>
		</tr>

<!-- 		<span>폰넘버:</span> -->
<!-- 		<p> -->
<!-- 			<input type="text" name="phone" id="phone"> -->
<!-- 		</p> -->
		
		<tr>
			  <th>전화번호</th>
			  <td width="343" colspan="5">
			       <input type="text" name="phone" id="phone" size="47" maxlength="100" value="${buyerInfo.phone}" disabled>
			  </td>
		</tr>
		
		
<!-- 		<span>주소:</span> -->
<!-- 		<p> -->
<!-- 			<input name="address" id="address"> -->
<!-- 		</p> -->

		<tr>
			  <th>주소*</th>
			  <td width="343" colspan="5">
			       <input type="text" name="address" id="address" size="47" maxlength="100" value="${buyerInfo.address}" disabled>
			  </td>
		</tr>

<!-- 		<span>총가격:</span> -->
<!-- 		<p> -->
<%-- 			<input name="totalPrice" id="totalPrice" value="${buyerInfo.price}"> --%>
<!-- 		</p> -->
		
		<tr>
			  <th >결제 금액</th>
			  <td width="343" colspan="5" >
			  <input type="text" name=totalPrice id="totalPrice" size="47" maxlength="100" value="${buyerInfo.price}" disabled>
			  </td>
			
		</tr>
		
		</table>
		<div style="text-align: center;">
		<br>
		<input type="button" onclick="goHome()" value="홈으로">
		</div>
	</form>
 </div>
</article>
<%@ include file="../footer.jsp"%>	
</body>
</html>