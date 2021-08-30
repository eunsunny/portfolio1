<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../member/sub_menu.jsp"%>
<!DOCTYPE html>

<!-- Start Content -->
<div class="col-lg-10">
	<h2 style="letter-spacing: 0;">나의 구매상품 목록</h2><br>
	<form name="frm" id="prod_form" method="post">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table>
						<thead>
						<tr style="text-align: center; padding: 0;">
							<th>번호</th><th>카테고리</th><th>상품명</th><th>제목</th><th>가격</th><th>구매현황</th><th>확정</th><th>구매일</th>
						</tr>
						</thead>
						<tbody class="prodListBody">
						<c:choose>
							<c:when test="${orderList.size() == 0}">
								<tr>
									<td width="100%" colspan="8" align="center" height="23" style="color: red; text-align: center;">
										<br>구매한 상품이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${orderList}" var="orderVO">
									<tr>
										<td height="23" align="center">${orderVO.oseq}</td>
										<td>${orderVO.kind_nm}</td>
										<td><a href="product_detail?pseq=${orderVO.pseq}">${orderVO.name}</a></td>
										<td><a href="product_detail?pseq=${orderVO.pseq}">${orderVO.title}</a></td>
										<td><fmt:formatNumber value="${orderVO.price}"/></td>
										<td>
											<c:choose>
												<c:when test='${orderVO.rev_result=="n"}'>
												<button type="button" onclick="location='update_form?pseq=${orderVO.pseq}'" style="padding-top:0.5em; padding-bottom:0.5em;">
													구매확정하기</button>
												</c:when> 
												<c:otherwise>구매 완료</c:otherwise>
											</c:choose>
										</td>
										<td></td>
										<td><fmt:formatDate value="${orderVO.order_date}"/></td>
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
			<%-- <%@ include file="../orderPage_area.jsp"%> --%>
		</div>
	</div>
</div>

</article>

</body>
</html>
	<%@ include file="../footer.jsp"%>

