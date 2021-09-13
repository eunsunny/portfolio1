<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="css/main.css" />

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>

<style type="text/css">
.rolling_panel {
	position: relative;
	width: 2000px;
	height: 340px;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

.rolling_panel ul {
	position: absolute;
	margin: 5px;
	padding: 0;
	list-style: none;
}

.rolling_panel ul li {
	float: left;
	width: 455px;
	height: 300px;
}
</style>

</head>
<script type="text/javascript">
$(document).ready(function() {

    var $panel = $(".rolling_panel").find("ul");

    var itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이
    var itemLength = $panel.children().length;      // 아이템 수

    // Auto 롤링 아이디
    var rollingId;

    auto();

    // 배너 마우스 오버 이벤트
    $panel.mouseover(function() {
        clearInterval(rollingId);
    });

    // 배너 마우스 아웃 이벤트
    $panel.mouseout(function() {
        auto();
    });

    // 이전 이벤트
    $("#prev").on("click", prev);

    $("#prev").mouseover(function(e) {
        clearInterval(rollingId);
    });

    $("#prev").mouseout(auto);

    // 다음 이벤트
    $("#next").on("click", next);

    $("#next").mouseover(function(e) {
        clearInterval(rollingId);
    });

    $("#next").mouseout(auto);

    function auto() {

        // 2초마다 start 호출
        rollingId = setInterval(function() {
            start();
        }, 2000);
    }

    function start() {
        $panel.css("width", itemWidth * itemLength);
        $panel.animate({"left": - itemWidth + "px"}, function() {

            // 첫번째 아이템을 마지막에 추가하기
            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");

            // 첫번째 아이템을 삭제하기
            $(this).find("li:first").remove();

            // 좌측 패널 수치 초기화
            $(this).css("left", 0);
        });
    }

    // 이전 이벤트 실행
    function prev(e) {
        $panel.css("left", - itemWidth);
        $panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
        $panel.animate({"left": "0px"}, function() {
            $(this).find("li:last").remove();
        });
    }

    // 다음 이벤트 실행
    function next(e) {
        $panel.animate({"left": - itemWidth + "px"}, function() {
            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
            $(this).find("li:first").remove();
            $(this).css("left", 0);
        });
    }
});

</script>

<body class="homepage is-preload">

	<%@ include file="./banner.jsp"%>

	<!-- Features -->
	<section id="features">
		<div class="container">
			<!-- <h2>Gentlemen, behold! This is <strong>Strongly Typed</strong>!</h2> -->

			<div
				style="display: flex; justify-content: center; align-items: center;">
				<!--         <a href="javascript:void(0)" id="next">다음</a> -->
				<a href="javascript:void(0)" role="button" data-bs-slide="prev"
					id="next"> <i class="text-dark fas fa-chevron-left"></i> <span
					class="sr-only">Previous</span>
				</a>
				<div class="rolling_panel">
					<ul>
						<c:forEach items="${allPicture}" var="allPicture">
							<li><a href="product_detail?pseq=${allPicture.pseq}"
								class="image featured"><img
									src="product_images/${allPicture.product_image}" alt=""
									style="width: 435px; height: 310px;" /></a></li>
						</c:forEach>

					</ul>
				</div>
				<!--         <a href="javascript:void(0)" id="prev">이전</a> -->
				<a class="h1" href="javascript:void(0)" role="button"
					data-bs-slide="next" id="prev"> <i
					class="text-light fas fa-chevron-right"></i>
				</a>
			</div>
		</div>
	</section>

	<!-- Scripts -->

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.dropotron.min.js"></script>
	<script src="js/browser.min.js"></script>
	<script src="js/breakpoints.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/main.js"></script>
	<%@ include file="./footer.jsp"%>
</body>
</html>