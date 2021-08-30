<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../notice/sub_menu.jsp"%>
<!DOCTYPE html>

<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">공지사항</h2><br>
	<form name="frm" method="get" action="notice_list">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table>
						<tr>
							<th>등록자</th>
							<td colspan="3">관리자</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td><fmt:formatDate value="${NoticeVO.regdate}"/></td>
							<th>조회수</th>
							<td>${NoticeVO.count}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">${NoticeVO.title}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">${NoticeVO.content}</td>
						</tr>
					</table>
					</div>
					<div align="left" width="100">
						<input type="submit" value="목록" style="padding-top:0.5em; padding-bottom:0.5em;">
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