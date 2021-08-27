<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
  <script src="js/jquery-1.11.0.min.js"></script>
  <script src="js/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="member/member.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>

<link rel="apple-touch-icon" href="img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo.css">
<link rel="stylesheet" href="css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="css/fontawesome.min.css">
<link rel="stylesheet" href="css/main.css" />

<script type="text/javascript">

function doroCheck() {
	
	var formm = document.formm;
	var doro = formm.doro.value;
	
	if(doro == "") {
		alert("도로명을 입력하세요."); 
		doro.focus();
	} else {
		formm.submit();
	}
	
}

function result(zip_num,sido,gugun,doro) {
	
   opener.document.formm.zip_num.value=zip_num;
   opener.document.formm.addr1.value=sido+" "+gugun+" "+doro;
   self.close();
};

</script>

</head>
<body>
	<ul class="nav nav-tabs">
  		<li role="presentation" class="active"><a href="find_zip_num_dong">동명 검색</a></li>
  		<li role="presentation"><a href="#">도로명 검색</a></li>
	</ul>
	<div class="row col-12">
		<h1 style="font-size: 20px; margin-left: 3em; margin-top: 13px; margin-bottom: 10px;">우편번호검색</h1>
		<form class="row col-10 aln-left" method=post name=formm action="find_zip_doro" style="padding:0;">
			<label class="col-3 control-label" style="text-align:center; padding-top:3.5em;"> 도로명 : </label>
			<div class="col-6" style="margin-top:1em;">
			<input name="doro" id="doro" type="text">
			</div>
			<div class="col-3" style="margin-top: 13px; margin-bottom: 0px;">
			<input type="button" value="찾기" class="submit" onclick="doroCheck()">
			</div>
		</form>
		<table class="row" style="margin-top:-20px; padding-top:0; border: 1px; " >
			<tr style="padding-top:0; text-align:center;">
				<th>우편번호</th>
				<th>주소</th>
			</tr>
			<c:forEach items="${addressList}" var="addressVO">
				<tr style="text-align:center;">
					<td>${addressVO.zip_num}</td>
					<td><a href="#"
						onclick="return result('${addressVO.zip_num}','${addressVO.sido}', 
												'${addressVO.gugun}','${addressVO.doro}')">
							${addressVO.sido} ${addressVO.gugun} ${addressVO.doro} ${addressVO.bunji}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>