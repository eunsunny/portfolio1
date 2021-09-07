<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<%@ include file="../notice/sub_menu.jsp"%>
<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">1:1 문의하기</h2><br>
	<form name="frm" id="prod_form" method="GET">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table style="border-top: solid 1px black; border-bottom: solid 1px black;">
						<tr>
							<th>아이디</th>
							<td>${OneoneVO.id}</td>
						</tr>
<%-- 						<tr>
							<th>문의종류 : </th>
							<td>????								
							</td>
						</tr> --%>
						<tr>
							<th>답변 진행현황</th>
							<td>
								<c:choose>
									<c:when test='${OneoneVO.rep=="n"}'>답변 진행중</c:when>								
									<c:otherwise>답변 완료</c:otherwise>
								</c:choose>
							</td>
							<th>질문 등록일</th>
							<td><fmt:formatDate value="${OneoneVO.regdate}"/></td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${OneoneVO.title}</td>
						</tr>
						<tr>
							<th>문의 내용</th>
							<td>${OneoneVO.content}</td>
						</tr>
						<tr>
							<th>답변 내용</th>
							<c:choose>
								<c:when test='${OneoneVO.reply == null}'>
									<td style="color:red">아직 답변이 등록되지 않았습니다. <br>
									빠른 시일내에 답변드리도록 하겠습니다.</td>
								</c:when>
								<c:otherwise>
									<td>${OneoneVO.reply}</td>
								</c:otherwise>
							</c:choose>
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