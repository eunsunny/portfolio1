<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

	$(document).ready(function(result){
		
		if(result == 1) {
			alert("신고가 접수되었습니다.");
			location.href="report_write_view";
		} else {
			alert("신고대상 유저가 존재하지 않습니다.\n아이디를 확인해주세요.");
			location.href="report_write_view";
		}
		
	}

</script>