<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/product.js"></script>
<style>

    tr, th, td {
    	text-align:center;
    }
    
    tr > td {
    	font-size: 0.9em;
    	padding : 0;
    	margin : 0;
    }
  
</style>
</head>
<body>
<%@ include file="../member/sub_menu.jsp"%>
<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">나의 찜목록</h2><br>
	<form name="frm" id="prod_form" method="POST" action="move_pay_form">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table style="padding:0;">
						<thead>
						<tr style="text-align: center;">
							<th>카테고리</th><th>상품명</th><th>제목</th><th>가격</th><th colspan="2">구매 및 삭제</th>
						</tr>
						</thead>
						<tbody class="jjimListbody">
						<c:choose>
							<c:when test="${jjimListSize == 0}">
								<tr>
									<td width="100%" colspan="6" align="center" height="23" style="color: red; text-align: center;">
										<br>장바구니가 비었습니다.<br>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${jjimList}" var="jjimVO">
									<tr>
										<td height="23" align="center" width="15%">${jjimVO.cod_nm}
											<input type="hidden" name="kind" value="${jjimVO.kind}">
										</td>
										<td width="13%"><a href="product_detail?pseq=${jjimVO.pseq}">${jjimVO.pname}
											<input type="hidden" name="pseq" value="${jjimVO.pseq}">
											</a></td>
										<td width="20%"><a href="product_detail?pseq=${jjimVO.pseq}">${jjimVO.title}</a></td>
										<td width="15%"><fmt:formatNumber value="${jjimVO.price}"/>
											<input type="hidden" name="price" value="${jjimVO.price}">
										</td>
										<td width="15%">
											<button type="submit" class="btn btn-success btn-lg">바로구매</button>
										</td>
										<td width="12%">
											<button type="button" class="btn btn-success btn-lg" onclick="location='jjim_delete?jjseq=${jjimVO.jjseq}'">삭제</button>
										</td>
									</tr>
								</c:forEach>
								
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
							<%@ include file="../jjimpage_area.jsp" %>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</article>
</body>
</html>

<%@ include file="../footer.jsp"%>

