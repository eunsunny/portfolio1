<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

	function report_check() {
		
		if($("#report_id").val() == "") {
			alert("신고할 아이디를 기입해주세요.");
			return false;
		} else if ($("#rp_kind").val() == "0") {
			alert("신고사유를 선택해주세요.");			
			return false;
		} else if ($("#content").val() == "") {
			alert("신고하실 내용을 작성해주세요.");
			return false;
		} else if ($("#id").val() == $("#report_id").val()) {
			alert("본인은 신고할 수 없습니다.");
			return false;
		} else {
			alert("신고가 접수되었습니다.");
			$("#reportWrite").attr("action", "report_write").submit();
		}
	}

</script>

</head>
<body>
<%@ include file="../notice/sub_menu.jsp"%>
<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">신고 하기</h2><br>
	<form name="frm" id="reportWrite" method="get" action="report_write">
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
						<tr>
							<th>신고대상 아이디</th>
							<td>
								<input type="text" id="report_id" name="report_id" placeholder="정확하게 입력해 주세요."/>
							</td>
						</tr>
						<tr>
							<th>신고사유</th>
							<td>
								<select name="rp_kind" id="rp_kind" style="">
									<option value="0">신고사유 선택</option>
									<option value="1">허위 상품</option>
									<option value="2">과대 홍보</option>
									<option value="3">비매너/욕설</option>
									<option value="4">결제관련</option>
									<option value="5">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>신고내용</th>
							<td>
								<textarea name="content" id="content" rows="8" cols="70"></textarea>
							</td>
						</tr>
					</table>
					</div>
					<div align="center" width="100">
						<button type="button" onclick="report_check()">	신고하기 </button>
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