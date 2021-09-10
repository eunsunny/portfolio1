<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

	function message_check() {
		
		if($("#recv_id").val() == "") {
			alert("보내실 아이디를 기입해주세요.");
			$("#recv_id").focus();
		} else if ($("#title").val() == "") {
			alert("제목을 입력해주세요.");			
			$("#title").focus();
		} else if ($("#content").val() == "") {
			alert("보내실 내용을 작성해주세요.");
			$("#content").focus();
		} else if ($("#send_id").val() == $("#recv_id").val()) {
			alert("본인에게는 보낼 수 없습니다.");
			$("#recv_id").focus();
		} else {
			alert("쪽지를 보내시겠습니까?");
			$("#messageWrite").attr("action", "send_message").submit();
		}
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
<%@ include file="../notice/sub_menu.jsp"%>
<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">쪽지 보내기</h2><br>
	<form name="frm" id="messageWrite" method="get" action="send_message">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<table class="notice">
						<tr>
							<th>아이디</th>
							<td><b>${sessionScope.loginUser.id}</b>
								<input type="hidden" id="send_id" name="send_id" value="${sessionScope.loginUser.id}"/>
							</td>
						</tr>
						<tr>
							<th>받는 아이디</th>
							<td>
								<input type="text" id="recv_id" name="recv_id" placeholder="아이디를 정확하게 입력해 주세요."/>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" id="title" name="title"/>
							</td>
						</tr>
						<tr>
							<th>보낼 내용</th>
							<td>
								<textarea name="content" id="content" rows="8" cols="70"></textarea>
							</td>
						</tr>
					</table>
					</div>
					<div align="center" width="100">
						<button type="button" onclick="message_check()">보내기</button>
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