<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<script src="js/jquery-1.11.0.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>

<!-- Load fonts style after rendering the layout styles -->
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
	<table>
		<tr align="center">
	  		<th style="border: solid 1px darkgray; font-size:17px;"><a href="find_zip_num_dong">동명 검색</a></th>
	  		<th style="border-top: solid 1px darkgray; border-right: solid 1px darkgray; font-size:17px;"><a href="#">도로명 검색</a></th>
	  	</tr>
	</table>
	<div class="row col-12">
		<form class="row col-10 aln-left" method=post name=formm action="find_zip_doro" style="padding:0; margin-top: 2.5em;">
			<label class="col-3 control-label" style="text-align:center; padding-top:3.5em;"> 도로명 : </label>
			<div class="col-6" style="margin-top:1em;">
				<input name="doro" id="doro" type="text">
			</div>
			<div class="col-3" style="margin-top: 13px; margin-bottom: 3.5em;">
				<input type="button" value="찾기" onclick="doroCheck()" style="padding: 0.75em 0.35em 0.75em 0.35em">
			</div>
		</form>
		<table style="margin-top:-20px; padding-top:0; border: 1px;  border-top: solid 1px black; font-size: 17px;">
			<thead style="padding: 0; text-align:center;">
				<tr>
					<th width="35%">우편번호</th>
					<th width="65%">주소</th>
				</tr>
			</thead>
			<c:forEach items="${addressList}" var="addressVO">
				<tr style="text-align:center;">
					<td>${addressVO.zip_num}</td>
					<td><a href="#"
						onclick="return result('${addressVO.zip_num}','${addressVO.sido}', 
												'${addressVO.gugun}','${addressVO.doro}')">
							${addressVO.sido} ${addressVO.gugun} ${addressVO.doro} ${addressVO.bunji}</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>