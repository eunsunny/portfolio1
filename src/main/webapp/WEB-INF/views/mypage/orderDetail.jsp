<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>구매내역 상세</title>

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>

<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="css/main.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css">

</head>
<body>
<div class="container">
	<div class="row" style="margin:2em 0 0 0">
		<div class="col-10">
			<h2>구매 상세 내역</h2><br>
			<table style="border-top: solid 1px black; border-bottom: solid 1px black;">
				<tr>
					<th width="25%">구매자</th>
					<td>${orderVO.OID}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${orderVO.EMAIL}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${orderVO.PHONE}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${orderVO.BUYER_ADDRESS}</td>
				</tr>	
				<tr>
					<th>결제금액</th>
					<td><fmt:formatNumber value="${orderVO.PRICE}"/></td>
				</tr>		
				<tr>
					<th>결제일</th>
					<td><fmt:formatDate value="${orderVO.ORDER_DATE}"/></td>
				</tr>	
			</table>
		</div>
	</div>
</div>
</body>
</html>