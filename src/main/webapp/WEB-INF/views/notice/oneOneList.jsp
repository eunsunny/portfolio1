<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<%@ include file="../notice/sub_menu.jsp"%>
<div class="col-lg-10">
	<h2 style="letter-spacing: 0;">1:1 문의하기
		<div align="right" width="70">
			<input type="button" value="문의하기" onclick="location='oneone_insert_view'" style="font-size:14px; padding:0.5em 1.5em 0.5em 1.5em; margin-right: 3.5em;">
		</div>
	</h2><br>
	<form name="frm" id="" method="get">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					
					<table style="border-top: solid 1px black; border-bottom: solid 1px black;">
						<thead>
						<tr style="text-align: center; padding: 0;">
							<th>번호</th><th>제목</th><th>답변여부</th><th><th>등록일</th>
						</tr>
						</thead>
						<tbody class="prodListBody">
						<c:choose>
							<c:when test="${OneoneList.size() == 0}">
								<tr>
									<td width="100%" colspan="8" align="center" height="23" style="color: red; text-align: center;">
										<br>등록된 질문이 없습니다.<br>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${OneoneList}" var="OneoneVO">
									<tr>
										<td height="23" align="center">${OneoneVO.onseq}</td>
										<td><a href="oneOne_Detail?onseq=${OneoneVO.onseq}">${OneoneVO.title}</a></td>
										<td>
											<c:choose>
												<c:when test='${OneoneVO.rep=="n"}'>답변 진행중</c:when>								
												<c:otherwise>답변 완료</c:otherwise>
											</c:choose>
										</td>
										<td><fmt:formatDate value="${OneoneVO.regdate}"/></td>
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
		</div>
	</div>
</div>

</article>

</body>
</html>
	<%@ include file="../footer.jsp"%>