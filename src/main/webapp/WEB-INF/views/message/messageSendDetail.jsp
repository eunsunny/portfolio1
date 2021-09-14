<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script>
	
	function messageDelete(no) {
		
		alert("쪽지가 삭제되었습니다.");
		location.href="message_send_delete?no="+no;
	}
	
</script>
<style>
	
	.notice {
		border-top: solid 1px black; 
		border-bottom: solid 1px black;
	}
	
</style>

</head>
<body>
<%@ include file="./sub_menu_message.jsp"%>
<div class="col-lg-7">
	<h2 style="letter-spacing: 0;">보낸 쪽지</h2><br>
	<form name="frm" id="messageWrite" method="get" action="send_message">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<input type="hidden" id="no" name="no" value="${message.no}"/>
					<table class="notice">
						<tr>
							<th width="25%">보낸 아이디</th>
							<td><b>${message.send_id}</b></td>
						</tr>
						<tr>
							<th>받는 아이디</th>
							<td><b>${message.recv_id}</b></td>
						</tr>
						<tr>
							<th>발신일</th>
							<td><fmt:formatDate value="${message.send_time}"/></td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${message.title}</td>
						</tr>
						<tr>
							<th>받은 내용</th>
							<td>${message.content}</td>
						</tr>
					</table>
					</div>
					<div align="center" width="100">
						<button type="button" onclick="location='message_send_list'">목록으로</button>
						<button type="button" onclick="messageDelete(${message.no})">삭제하기</button>
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