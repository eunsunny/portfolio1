<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>

    tr, th, td {
    	text-align:center;
    }
    
    tr > td {
    	font-size: 0.9em;
    }
  
</style>
</head>
<body>
<%@ include file="../member/sub_menu.jsp"%>
<div class="col-lg-10">
	<h2 style="letter-spacing: 0;">나의 판매상품 목록</h2><br>
	<form name="frm" id="prod_form" method="get">
		<div class="container py-5">
			<div class="row">
				<div class="row" align="center">
					<table>
						<thead>
						<tr style="padding: 0;">
							<th>번호</th><th>카테고리</th><th>상품명</th><th>가격</th><th>구매자</th><th>판매현황</th><th>상품수정</th><th>등록일</th>
						</tr>
						</thead>
						<tbody class="prodListBody">
						<c:choose>
							<c:when test="${prodList.size() == 0}">
								<tr>
									<td width="100%" colspan="8" align="center" height="23" style="color: red;">
										<br>등록된 상품이 없습니다.<br>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${prodList}" var="productVO">
									<tr>
										<td height="23" align="center">${productVO.pseq}</td>
										<td>${productVO.kind_nm}</td>
										<td><a href="product_detail?pseq=${productVO.pseq}">${productVO.name}</a></td>
										<td><fmt:formatNumber value="${productVO.price}"/></td>
										<td>
											<c:choose>
												<c:when test="${empty productVO.oid}">-</c:when>
												<c:otherwise>
													<a href="#">${productVO.oid}</a><!-- 페이지 새로만들어서 넣기 -->
												</c:otherwise>
											</c:choose>
										</td>
										<c:choose>
											<c:when test='${productVO.soldyn=="n"}'>
												<td>판매중</td>
												<td>
													<input type="button" class="btn btn-success btn-lg" value="수정" onclick="location='update_form?pseq=${productVO.pseq}'"/>
												</td>
											</c:when>
												<c:otherwise>
													<td>판매완료</td>
													<td>수정불가</td>
												</c:otherwise>
										</c:choose>
										<td><fmt:formatDate value="${productVO.regdate}"/></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
						</div>
					</div>
				</div>
			</form>
			<%@ include file="../myProdPage_area.jsp"%>
		</div>
	</div>
</div>

</article>

</body>
</html>
	<%@ include file="../footer.jsp"%>

