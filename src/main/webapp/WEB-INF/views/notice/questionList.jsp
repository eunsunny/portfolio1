<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.menu {
		cursor: pointer;
		font-wight: bold;
		border-top: 1px solid #BDBDBD;
		border-bottom: 1px solid #BDBDBD;
		padding-top: 1em;
		padding-bottom: 1em;
	}
	
	.menu span {
		font-weight: bold;
		font-size: 20px;
		color: black;
	}
	
	.hide {
		display: none;
		font-size: 18px;
	}
	
	ul>li {
		list-style: none;
	}
	
	.hide {
		background-color: #F6F6F6;
	}
	
	.inputicon {
		position: relative;
	}
	
 	.inputicon > i {
		position: absolute;
		top: 50%;
		margin-left: 17px;
		margin-top: -7px;
		z-index: 1;
		color: #4f5b66;
	}
	
</style>
<script type="text/javascript">
	// html 이 다 로딩된 후 실행
	$(document).ready(function(){
		$(".menu").click(function(){
			var submenu = $(this).next(".hide");
			
			if(submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
	
 	$("#key").keyup(function(event){
		if(event.keyCode == 13) {
			$('#que_form').attr("action", "question_list").submit();
		}
	}); 
	
</script>
</head>
<body>
<!-- Start Content -->
	<%@ include file="../notice/sub_menu.jsp"%>
	<div class="col-lg-10">
		<h2 style="letter-spacing: 0;">자주 묻는 질문</h2>
		<br>
		<form name="frm" id="que_form" method="get">
			<div>
				<div style="display: inline-block; width: 100%;">
					<div class="inputicon"
						style="width: 30%; float: right; margin-bottom: 1em;">
						<i class="fa fa-search" aria-hidden="true"></i>
						<input style="background-color: white; padding-left: 2.5em" type="text"
								placeholder="질문을 검색해주세요." name="key" id="key" size="30">
					</div>
				</div>
				<div>
					<c:choose>
						<c:when test="${queList.size() == 0}">
							<ul>
								<li class="menu" style="text-align:center; border: 0px;"><br><br>
									<span>해당하는 질문이 없습니다.</span></li>
							</ul>
						</c:when>
						<c:otherwise>
							<c:forEach items="${queList}" var="questionVO">
								<ul>
									<li class="menu" style="clear: left;"><span
										style="color: red; font-size: 25px;">Q.&nbsp;&nbsp;</span><span>${questionVO.title}
											&nbsp;&nbsp; <i class="fa fa-angle-down" aria-hidden="true"></i>
									</span>
									<li class="hide">${questionVO.content}<br> <img
										src="upload_images/question/${questionVO.image}">
									</li>
								</ul>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form>
		<br><br>
		<%@ include file="../questionPage_area.jsp"%> 
	</div>
	</article>

</body>
</html>
	<%@ include file="../footer.jsp"%>