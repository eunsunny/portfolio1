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
<!-- 		<h1>상품수정</h1>   -->
		
	
		<form name="frm" id="update_form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pseq" value="${productVO.pseq}">
		
		<div style="font-size: 30px; margin-top: 60px;">
		<h1>상품수정</h1>  
		</div>	
		<br>
			<table id="list">
			
<!-- 			<tr> -->
<!-- 			  <th>카테고리</th> -->
<!-- 			  <td colspan="5"> -->
<!-- 			  <select name="kind" id="kind"> -->
<%-- 			    <c:forEach items="${kindList}" var="kind" varStatus="status"> --%>
<%-- 			      <option value="${status.count}">${kind}</option>  <!-- ${status.count} 1부터의 순서 --> --%>
<%-- 			   </c:forEach> --%>
<!-- 			  </select>      -->
<!-- 			  </td> -->
<!-- 			</tr>   -->

			 <tr>
			    <th>카테고리</th>
			    <td colspan="5">
			    <select name="kind" id="kind">
			      <c:forEach items="${kindList}" var="kind" varStatus="status">
			        <c:choose>
			          <c:when test="${productVO.kind==status.count}">
			            <option value="${status.count}" selected="selected">${kind}</option>
			          </c:when>
			          <c:otherwise>
			            <option value="${status.count}">${kind}</option>
			          </c:otherwise>
			        </c:choose>
			      </c:forEach>
			    </select> 
			    </td>
			  </tr>
			
<!-- 			<tr> -->
<!-- 			  <th>거래방법</th> -->
<!-- 			  <td colspan="5"> -->
<!-- 			  <select name="kind2" id="kind2"> -->
<%-- 			    <c:forEach items="${kindList2}" var="kind2" varStatus="status"> --%>
<%-- 			      <option value="${status.count}">${kind2}</option>  <!-- ${status.count} 1부터의 순서 --> --%>
<%-- 			   </c:forEach> --%>
<!-- 			  </select>      -->
<!-- 			  </td> -->
<!-- 			</tr>  -->
				 <tr>
				    <th>거래방법</th>
				    <td colspan="5">
				    <select name="kind2" id="kind2">
				      <c:forEach items="${kindList2}" var="kind2" varStatus="status">
				        <c:choose>
				          <c:when test="${productVO.kind==status.count}">
				            <option value="${status.count}" selected="selected">${kind2}</option>
				          </c:when>
				          <c:otherwise>
				            <option value="${status.count}">${kind2}</option>
				          </c:otherwise>
				        </c:choose>
				      </c:forEach>
				    </select> 
				    </td>
				  </tr>
			
			<tr>
			  <th>제목</th>
			  <td width="500" colspan="5">
			       <input type="text" name="title" id="title" size="47" maxlength="100" value="${productVO.title}">
			  </td>
			</tr>
			
			<tr>
			  <th>상품명</th>
			  <td width="343" colspan="5">
			       <input type="text" name="name" id="name" size="47" maxlength="100" value="${productVO.name}">
			  </td>
			</tr>
			
			<tr>
			  <th>가격</th>
			  <td width="70">
			    <input type="text" name="price" id="price" size="11" onKeyUp='NumFormat(this)'  value="${productVO.price}">
			  </td>
			</tr>
			    
			  <tr>
			    <th>상세설명</th>
			    <td colspan="5">
			      <textarea name="content" id="content" rows="8" cols="70" >${productVO.content}</textarea>
			    </td>
			  </tr>
			  
<!-- 			  <tr> -->
<!-- 			    <th>상품이미지</th> -->
<!-- 			    <td width="343" colspan="5"> -->
<!-- 			<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  --> 
<!-- 			      <input type="file" name="product_image" id="product_image"> -->
<!-- 			    </td> -->
<!-- 			  </tr>     -->

			  <tr>
			    <th>상품이미지</th>
			    <td colspan="5">
			      <img src="product_images/${productVO.image}" width="200pt">     
			      <br>
			      <input type="file" multiple="multiple" name="file" id="file">
			      <input type="hidden" name="image" value="${productVO.image}">
			    </td> 
			  </tr>   
			  
			  
			</table>
		<div style="text-align: center;">
		<input class="btn" type="button" value="수정" onClick="go_mod_save('${productVO.pseq}')">           
		<input class="btn" type="button" value="취소" onClick="go_mov()">
		</div>
		</form> 
		</div>
	</article>

</div>
</body>
</html>
<%@ include file=".././footer.jsp"%>