<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file=".././header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Zay Shop - Product Listing Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	

    <script type="text/javascript" src="js/product.js"></script>
<style>
 	table{ 
 		width : auto; 
 	}
</style>
</head>

<body>
	<article>
	<div class="row">
		<h1>상품등록</h1>  
		
		<!-- [1] 파일을 업로드 하기 위해서는 폼태그를 post 방식으로 전송하고,
		인코딩 타입을 multipart/form-data 로 지정해야 한다. -->
		<form name="frm" id="write_form" method="post" enctype="multipart/form-data">
			<table id="list">
			<tr>
			  <th>카테고리</th>
			  <td colspan="5">
			  <select name="kind" id="kind">
			    <c:forEach items="${kindList}" var="kind" varStatus="status">
			      <option value="${status.count}">${kind}</option>  <!-- ${status.count} 1부터의 순서 -->
			   </c:forEach>
			  </select>     
			  </td>
			</tr>  
			
			<tr>
			  <th>거래방법</th>
			  <td colspan="5">
			  <select name="kind2" id="kind2">
			    <c:forEach items="${kindList2}" var="kind2" varStatus="status">
			      <option value="${status.count}">${kind2}</option>  <!-- ${status.count} 1부터의 순서 -->
			   </c:forEach>
			  </select>     
			  </td>
			</tr> 
			
			<tr>
			  <th>제목</th>
			  <td width="343" colspan="5">
			       <input type="text" name="title" id="title" size="47" maxlength="100" value="">
			  </td>
			</tr>
			
			<tr>
			  <th>상품명</th>
			  <td width="343" colspan="5">
			       <input type="text" name="name" id="name" size="47" maxlength="100" value="">
			  </td>
			</tr>
			
			<tr>
			  <th>가격</th>
			  <td width="70">
			    <input type="text" name="price" id="price" size="11"onKeyUp='NumFormat(this)'  value="">
			  </td>
			</tr>
			    
			  <tr>
			    <th>상세설명</th>
			    <td colspan="5">
			      <textarea name="content" id="content" rows="8" cols="70" ></textarea>
			    </td>
			  </tr>
			  <tr>
			    <th>상품이미지</th>
			    <td width="343" colspan="5">
			<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
			      <input multiple="multiple" type="file" name="file" id="file">
			    </td>
			  </tr>    
			</table>
		<input class="btn" type="button" value="등록" onClick="go_save()">           
		<input class="btn" type="button" value="취소" onClick="go_mov()">
		</form> 
		</div>
	</article>

</div>
</body>
</html>
<%@ include file=".././footer.jsp"%>