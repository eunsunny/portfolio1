<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../notice/sub_menu.jsp"%>
<!DOCTYPE html>

<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">1:1 문의하기</h2><br>
	<form name="frm" id="oneWrite" method="post" action="oneone_insert">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table>
						<tr>
							<th>아이디</th>
							<td>${sessionScope.loginUser.id}
								<input type="hidden" id="id" name="id" value="${sessionScope.loginUser.id}"/>
							</td>
						</tr>
<%-- 						<tr>
							<th>문의종류 : </th>
							<td>
								<select>
									<option></option>
								</select>
							</td>
						</tr> --%>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" id="title" name="title">
							</td>
						</tr>
						<tr>
							<th>문의내용</th>
							<td>
								<textarea name="content" id="content" rows="8" cols="70"></textarea>
							</td>
						</tr>
					</table>
					</div>
					<div align="center" width="100">
						<button type="button" onclick="oneone_check()" style="font-size:14px; padding:0.5em 2em 0.5em 2em;">
							등록하기 </button>
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