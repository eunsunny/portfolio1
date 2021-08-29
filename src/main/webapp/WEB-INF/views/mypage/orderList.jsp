<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../member/sub_menu.jsp"%>
<!DOCTYPE html>

<!-- Start Content -->
<div class="col-lg-10">
	<h2 style="letter-spacing: 0;">나의 판매상품 목록</h2><br>
	<form name="frm" id="prod_form" method="post">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table>
						<thead>
						<tr style="text-align: center; padding: 0;">
							<th>번호</th><th>카테고리</th><th>상품명</th><th>제목</th><th>가격</th><th>판매현황</th><th>상품수정</th><th>등록일</th>
						</tr>
						</thead>
						<tbody class="prodListBody">
						<c:choose>
							<c:when test="${prodList.size() == 0}">
								<tr>
									<td width="100%" colspan="8" align="center" height="23" style="color: red; text-align: center;">
										<br>등록된 상품이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${prodList}" var="productVO">
									<tr>
										<td height="23" align="center">${productVO.pseq}</td>
										<td>${productVO.kind_nm}</td>
										<td><a href="product_detail?pseq=${productVO.pseq}">${productVO.name}</a></td>
										<td><a href="product_detail?pseq=${productVO.pseq}">${productVO.title}</a></td>
										<td><fmt:formatNumber value="${productVO.price}"/></td>
										<td>
											<c:choose>
												<c:when test='${productVO.soldyn=="n"}'>판매중</c:when>
												<c:otherwise>판매완료</c:otherwise>
											</c:choose>
										</td>
										<td><input type="button" class="btn btn-success btn-lg" value="수정" onclick="location='update_form?pseq=${productVO.pseq}'"/></td>
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

