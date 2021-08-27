<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../member/sub_menu.jsp"%>
<!DOCTYPE html>

<!-- Start Content -->
<div class="col-lg-9">
	<h2>나의 찜목록</h2>
	<form name="frm" id="prod_form" method="post">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<c:choose>
						<c:when test="${jjimListSize == 0}">
							<h3 style="color: red; text-align: center;">장바구니가 비었습니다.</h3>
						</c:when>
						<c:otherwise>
							<c:forEach items="${jjimList}" var="jjimVO">
								<div class="col-md-4">
									<div class="card mb-4 product-wap rounded-0">
										<div class="card rounded-0">
											<a id="atag" href="product_detail?pseq=${jjimVO.pseq}">
												<img class="card-img rounded-0 img-fluid"
												style="width: 310px; height: 200px"
												src="product_images/${jjimVO.product_image}" />
											</a>
										</div>
										<div class="card-body">
											<span class="w-30" style="font-color:black;">${jjimVO.title}</span><br>
											<p class="text-left mb-0">${jjimVO.price}원</p>
											<br>
											<button type="button" class="btn btn-success btn-lg" onclick="">바로 구매하기</button>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="row">
			<ul class="pagination pagination-lg justify-content-end">
				<li class="page-item disabled"><a
					class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0"
					href="#" tabindex="-1">1</a></li>
				<li class="page-item"><a
					class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
					href="#">2</a></li>
				<li class="page-item"><a
					class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
					href="#">3</a></li>
			</ul>
		</div>
	</div>
</div>

</article>

</body>
</html>
	<%@ include file="../footer.jsp"%>

