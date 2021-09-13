<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

	function selectClick(no) {
		location.href = "message_send_detail?no="+no;
	}

</script>

</head>
<body>
<%@ include file="./sub_menu_message.jsp"%>
<div class="col-lg-8">
	<h2 style="letter-spacing: 0;">보낸 쪽지함
		<div align="right" width="70">
			<input type="button" value="쪽지보내기" onclick="location='send_message_view'" style="font-size:14px; padding:0.5em 1.5em 0.5em 1.5em; margin-right: 3.5em;">
		</div>
	</h2><br>
	<form name="frm" method="get">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table style="border-top: solid 1px black; border-bottom: solid 1px black;">
						<thead>
						<tr style="text-align: center; padding: 0;">
							<th>번호</th><th>제목</th><th>받은 사람</th><th colspan="2">수신일</th>
						</tr>
						</thead>
						<tbody class="noticeList">
						<c:choose>
							<c:when test="${messageList.size() == 0}">
								<tr>
									<td width="100%" colspan="4" align="center" height="23" style="color: black; text-align: center;">
										보낸 쪽지가 없습니다.<br>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${messageList}" var="MessageVO">
									<c:choose>
										<c:when test="${MessageVO.read_chk == 1}">
											<tr class="select" onclick="selectClick(${MessageVO.no})">
												<td align="center" width="10%">${MessageVO.no}</td>
												<td width="40%">${MessageVO.title}</td>
												<td width="15%">${MessageVO.recv_id}</td>
												<td width="20%"><fmt:formatDate value="${MessageVO.send_time}"/></td>
												<td width="20%">안읽음</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr class="select" onclick="selectClick(${MessageVO.no})" style="background-color:#D5D5D5">
												<td align="center" width="10%">${MessageVO.no}</td>
												<td width="40%">${MessageVO.title}</td>
												<td width="15%">${MessageVO.recv_id}</td>
												<td width="20%"><fmt:formatDate value="${MessageVO.send_time}"/></td>
												<td width="20%">읽음</td>
											</tr>
										</c:otherwise>
									</c:choose>
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