<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="js/jquery-1.11.0.min.js"></script>
  <script src="js/jquery-migrate-1.2.1.min.js"></script>
  <link rel="stylesheet" href="css/main.css" />
<meta charset="UTF-8">
<title>check</title>

<script type="text/javascript">

function jjim_ok(){
  self.close();
}

</script>

</head>
<body class="homepage is-preload">
	<div class="row">
		<form method="get" action="jjim_insert">
			<div id="page-wrapper">
				<span><b>나의 찜 목록에 추가되었습니다. <br> 찜 목록으로 가시겠습니까? </b></span>		
			</div>
			<div class="row">
				<button type="submit" class="btn btn-success btn-lg">찜목록 바로가기</button>
				<button type="button" class="btn btn-success btn-lg" id="jjim_insert" value="계속 쇼핑하기" onclick="jjim_ok()"></button>
			</div>
		</form>
	</div>
</body>
</html>