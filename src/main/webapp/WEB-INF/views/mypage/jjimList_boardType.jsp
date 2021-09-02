<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../member/sub_menu.jsp"%>
<!DOCTYPE html>

<!-- Start Content -->
<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">나의 찜목록</h2><br>
	<form name="frm" id="prod_form" method="get">
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
										<td height="23" align="center">${jjimVO.cod_nm}</td>
										<td><a href="product_detail?pseq=${jjimVO.pseq}">${jjimVO.pname}</a></td>
										<td><a href="product_detail?pseq=${jjimVO.pseq}">${jjimVO.title}</a></td>
										<td><fmt:formatNumber value="${jjimVO.price}"/></td>
										<td><input type="button" class="btn btn-success btn-lg" value="바로구매" onclick="movePayForm()"/></td>
										<td>
											<input type="button" class="btn btn-success btn-lg" value="삭제" onclick="location='jjim_delete?jjseq=${jjimVO.jjseq}'"/>
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

