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
	<h2 style="letter-spacing: 0;">나의 구매상품 목록</h2><br>
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table>
						<thead>
							<tr style="padding: 0;">
								<th>번호</th><th>카테고리</th><th>상품명</th><th>제목</th><th>가격</th><th>확정</th><th>구매상세</th><th>구매일</th>
							</tr>
						</thead>
						<tbody class="ListBody">
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
									<form name="frm" id="order_form" method="GET" action="order_set">
										<%-- <input type="hidden" name="oid" id="oid" value="${orderVO.oid}"> --%>
										<tr class="select" onclick="selectClick(${orderVO.pseq})">
											<td height="23" align="center" style="letter-spacing:-2px;">${orderVO.oseq}
												<input type="hidden" name="oseq" id="oseq" value="${orderVO.oseq}">
											</td>
											<td style="letter-spacing:-2px;">${orderVO.cod_nm}</td>
											<td>${orderVO.name}</td>
											<td>${orderVO.title}</td>
											<td><fmt:formatNumber value="${orderVO.price}"/></td>
											<td>
												<c:choose>
													<c:when test='${orderVO.rev_result=="n"}'>
														<input type="hidden" name="pid" id="pid" value="${orderVO.pid}">
														<button type="submit" class="btn btn-success btn-lg"> 구매확정</button>
													</c:when> 
													<c:otherwise>구매 완료</c:otherwise>
												</c:choose>
											</td>
											<td>
												<input type="button" value="상세보기" 	onclick="detailClick(${orderVO.oseq});"/>
											</td>
											<td><fmt:formatDate value="${orderVO.order_date}"/></td>
										</tr>
									</form>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<span style="font-size:12px; color:red; padding:0; height:20px;">* 상품을 정상적으로 수취했을 경우 구매확정을 눌러주시기 바랍니다.</span>
					<span style="font-size:12px; color:red; padding:0; height:20px;">* 구매확정 후 구매완료가 되며, 만약 상품을 받지 못했을 경우 판매자에게 문의해주시기 바랍니다.</span>
					</div>
					</div>
				</div>
			<%@ include file="../orderPage_area.jsp"%>
		</div>
	</div>
</div>

</article>

</body>
</html>
	<%@ include file="../footer.jsp"%>

