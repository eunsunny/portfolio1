<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.menu a {
		cursor:pointer;
	}
	
	.menu .hide {
		display:none;
	}
</style>
<script type="text/javascript">
	// html 이 다 로딩된 후 실행
	$(document).ready(function(){
		$(".menu>a").click(function(){
			var submenu = $(this).next("ul");
			
			if(submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
</script>
</head>
<body>
<!-- Start Content -->
<%@ include file="../notice/sub_menu.jsp"%>
<div class="col-lg-10">
	<h2 style="letter-spacing: 0;">자주 묻는 질문</h2><br>
	<div align="right" width="500">
		<select>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
			<input type="text" placeholder="검색어 입력" name="key" id="key">
			<input type="button" value="검색" onclick="location='oneone_insert_view'" style="font-size:14px; padding:0.5em 1.5em 0.5em 1.5em; margin-right: 3.5em;">
	</div>
	<form name="frm" id="" method="get">
		<div class="container py-5">
			<div class="row">
				<div class="row">
					<ul>
					<li class="menu">
					
					<a>타잍,ㄹ${questionVO.title}</a>
					<ul class="hide">
						<li>ddfff</li>
						<li>내용${questionVO.content}</li>
					</ul>
					</li>
					</ul>
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