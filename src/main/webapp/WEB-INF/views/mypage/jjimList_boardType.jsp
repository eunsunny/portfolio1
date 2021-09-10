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

<script type="text/javascript">

	function selectClick(pseq) {
		location.href = "product_detail?pseq="+pseq;
	}
	
	function jjimPayForm(pseq, price, kind) {
		var url = "move_pay_form?pseq="+pseq+"&price="+price+"&kind="+kind;
		
		$("#formm").attr("action", url).submit();
	}

</script>

</head>
<body>
<%@ include file="../member/sub_menu.jsp"%>
<div class="col-lg-10">
	<h2 style="letter-spacing: 0;">나의 찜목록</h2><br>
	<form name="formm" id="formm" method="POST" action="move_pay_form">
		<div class="container py-5">
			<div class="row">
				<div class="row" align="center">
					<table>
						<thead>
						<tr style=" padding:0; text-align: center;">
							<th>카테고리</th><th>상품명</th><th>제목</th><th>가격</th><th>구매</th><th>삭제</th>
						</tr>
						</thead>
						<tbody class="ListBody">
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
									<tr class="select" onclick="selectClick(${jjimVO.pseq})">
										<td height="23" align="center" style="letter-spacing:-2px; width:13%;">${jjimVO.cod_nm}</td>
										<td width="15%">${jjimVO.pname}</td>
										<td>${jjimVO.title}</td>
										<td>
											<fmt:formatNumber value="${jjimVO.price}"/>
										</td>
										<c:choose>
											<c:when test='${jjimVO.soldyn=="n"}'>
												<td width="15%">
													<button type="submit" class="btn btn-success btn-lg" 
															onclick="jjimPayForm(${jjimVO.pseq},${jjimVO.price},${jjimVO.kind})">
														바로구매</button>
												</td>
											</c:when>
											<c:otherwise>
												<td width="15%">구매불가</td>
											</c:otherwise>
										</c:choose>
										<td width="10%">
											<button type="button" class="btn btn-success btn-lg" 
													onclick="event.stopPropagation(); location='jjim_delete?jjseq=${jjimVO.jjseq}';">
												삭제</button>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<span style="text-align:right; font-size:12px; color:red; padding:0; height:20px;">* 판매가 완료된 상품은 구매할 수 없습니다.</span>
						</div>
					</div>
				</div>
			</form>
			<%@ include file="../jjimpage_area.jsp" %>
		</div>
	</div>
</div>
</article>
</body>
</html>

<%@ include file="../footer.jsp"%>

