<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../member/sub_menu.jsp"%>
<!DOCTYPE html>

<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">1:1 문의하기</h2><br>
	<form name="frm" id="prod_form" method="post">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table>
						<tr>
							<th>아이디 : </th>
							<td>${OneoneVO.id}
								<input type="hidden" id="id" name="id" value="${OneoneVO.id}"/>
							</td>
						</tr>
						<tr>
							<th>문의종류 : </th>
							<td>????								
							</td>
						</tr>
						<tr>
							<th>답변 진행현황 : </th>
							<td>
								<c:choose>
									<c:when test='${OneoneVO.rep=="n"}'>답변 진행중</c:when>								
									<c:otherwise>답변 완료</c:otherwise>
								</c:choose>
							</td>
							<th>질문 등록일 : </th>
							<td></td>
						</tr>
						<tr>
							<th>제목 : </th>
							<td>${OneoneVO.title}</td>
						</tr>
						<tr>
							<th>내용 : </th>
							<td>${OneoneVO.content}</td>
						</tr>
						<tr>
							<th>답변 내용</th>
							<td>${OneoneVO.reply}</td>
						</tr>
					</table>
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