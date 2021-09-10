<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

function selectClick(gseq) {
	location.href = "notice_detail?gseq="+gseq;
}

</script>

</head>
<body>
<%@ include file="../notice/sub_menu.jsp"%>
<div class="col-lg-10">
	<h2 style="letter-spacing: 0;">공지사항</h2><br>
	<form name="frm" method="get">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table style="border-top: solid 1px black; border-bottom: solid 1px black;">
						<thead>
						<tr style="text-align: center; padding: 0;">
							<th>번호</th><th>제목</th><th>등록일</th><th>조회수</th>
						</tr>
						</thead>
						<tbody class="noticeList">
						<c:choose>
							<c:when test="${noticeList.size() == 0}">
								<tr>
									<td width="100%" colspan="4" align="center" height="23" style="color: red; text-align: center;">
										<br>등록된 질문이 없습니다.<br>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${noticeList}" var="NoticeVO">
									<tr class="select" onclick="selectClick(${NoticeVO.gseq})">
										<td align="center" width="10%">${NoticeVO.gseq}</td>
										<td width="60%">${NoticeVO.title}</td>
										<td width="20%"><fmt:formatDate value="${NoticeVO.regdate}"/></td>
										<td width="10%">${NoticeVO.count}</td>
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
			<%@ include file="../noticePage_area.jsp"%> 
		</div>
	</div>
</div>

</article>

</body>
</html>
	<%@ include file="../footer.jsp"%>