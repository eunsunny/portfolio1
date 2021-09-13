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

<script type="text/javascript">

function selectClick(pseq) {
	location.href = "product_detail?pseq="+pseq;
}

function detailClick(oseq) {
	
	event.stopPropagation();
	
	var url = "myorder_detail?oseq="+oseq;
	
	window.open(url, "_blank_1", 
			"toolbar=no, menubar=no, scrollbars=no, resizable=no, width=550, height=500, "+
				"top=150, left=400");
}

</script>

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
							<th>번호</th><th>카테고리</th><th>상품명</th><th>가격</th><th>판매상세</th><th>판매현황</th><th>상품수정</th><th>등록일</th>
						</tr>
						</thead>
						<tbody class="ListBody">
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
									<tr class="select" onclick="selectClick(${productVO.pseq})">
										<td height="23" align="center" style="letter-spacing:-2px;">${productVO.pseq}</td>
										<td style="letter-spacing:-2px;">${productVO.kind_nm}</td>
										<td>${productVO.name}</td>
										<td><fmt:formatNumber value="${productVO.price}"/></td>
										<td>
											<c:choose>
												<c:when test="${empty productVO.oid}">-</c:when>
												<c:otherwise>
													<input type="button" value="상세보기" 
														onclick="detailClick(${productVO.oseq});"/>
												</c:otherwise>
											</c:choose>
										</td>
										<c:choose>
											<c:when test='${productVO.soldyn=="n"}'>
												<td>판매중</td>
												<td>
													<button type="button" class="btn btn-success btn-lg" onclick="event.stopPropagation(); location='update_form?pseq=${productVO.pseq}';">
													 수정</button>
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
					<span style="text-align:right; font-size:12px; color:red; padding:0; height:20px;">* 상품삭제는 상품 상세보기에서 가능합니다.</span>
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

