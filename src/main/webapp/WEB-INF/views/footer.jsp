<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.dropotron.min.js"></script>
  <script src="js/browser.min.js"></script>
  <script src="js/breakpoints.min.js"></script>
  <script src="js/util.js"></script>
  <script src="js/main.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63bd730b2fea7a587228bb810016be21"></script>

<script>
var mapContainer = document.getElementById('map'),  // 지도표시 div
	mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	
var map = new kakao.maps.Map(mapContainer, mapOption);  // 지도 생성
/* 
var mapTypeControl = new kakao.maps.MapTypeControl();

map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

function getInfo() {
    // 지도의 현재 중심좌표를 얻어옵니다 
    var center = map.getCenter(); 
    
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();
    
    // 지도타입을 얻어옵니다
    var mapTypeId = map.getMapTypeId(); 
    
    // 지도의 현재 영역을 얻어옵니다 
    var bounds = map.getBounds();
    
    // 영역의 남서쪽 좌표를 얻어옵니다 
    var swLatLng = bounds.getSouthWest(); 
    
    // 영역의 북동쪽 좌표를 얻어옵니다 
    var neLatLng = bounds.getNorthEast(); 
    
    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
    var boundsStr = bounds.toString();
}
 */
</script>
</head>
<body>
  <div class="clear"></div>
		<!-- Footer -->
			<section id="footer">
				<div class="container">
					<header>
						<h3>Questions or comments? <strong>Get in touch:</strong></h3>
					</header>
					<div class="row">
						<div class="col-6 col-12-medium">
							<section>
								<form method="post" action="#">
									<div class="row gtr-50">
										<div class="col-6 col-12-small">
											<input name="name" placeholder="Name" type="text" />
										</div>
										<div class="col-6 col-12-small">
											<input name="email" placeholder="Email" type="text" />
										</div>
										<div class="col-12">
											<textarea name="message" placeholder="Message" rows="8"></textarea>
										</div>
										<div class="col-12">
											<a href="#" class="form-button-submit button icon solid fa-envelope">Send Message</a>
										</div>
									</div>
								</form>
							</section>
						</div>
						<div class="col-6 col-12-medium">
						<header style="margin-top:-60px">
							<h3><strong>SUNNY-FLEA-MARKET 본사 위치</strong></h3>
						</header>
							<section>
								<div id="map" style="width:100%; height:18em; border: 1px solid gray;" onclick="setDraggable(false); setZoomable(false);"></div>
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63bd730b2fea7a587228bb810016be21"></script>
									<script>
										var mapContainer = document.getElementById('map'),  // 지도표시 div
										mapOption = {
											center: new kakao.maps.LatLng(37.49998429751735, 127.02837538080844),
											level: 3
										};
										
										var map = new kakao.maps.Map(mapContainer, mapOption);
										
										function setDraggable(draggable) {
											map.setDraggable(draggable);
										}
										
										function setZoomable(zoomable) {
										    map.setZoomable(zoomable);    
										}
										
										var marker = new kakao.maps.Marker({ 
											position: map.getCenter() 
										});
										
										marker.setMap(map);
										
										var iwContent = '<div style="padding:1px 0 0 1px; text-align:center; font-size:17px;">Sunny-Flea-Market<br>'+
														'<a href="https://map.kakao.com/?urlX=506253&urlY=1111213&urlLevel=3&itemId=67041616&q=%EA%B7%B8%EB%A6%B0%EC%BB%B4%ED%93%A8%ED%84%B0%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8%20%EA%B0%95%EB%82%A8%EC%BA%A0%ED%8D%BC%EC%8A%A4%203%EB%B3%84%EA%B4%80&srcid=67041616&map_type=TYPE_MAP"'
														+' style="color:blue" target="_blank">큰지도보기</a></div>', 
									    	iwPosition = new kakao.maps.LatLng(37.49998429751735, 127.02837538080844); 
										
										var infowindow = new kakao.maps.InfoWindow({
										    position : iwPosition, 
										    content : iwContent 
										});
										  
										infowindow.open(map, marker); 
									</script>
									<span style="text-align:left; font-size:14px; color:black; padding:0; height:20px;">* 큰 지도보기를 통해 자세한 위치를 알 수 있습니다.</span>
							</section>
						</div>
					</div>
				</div>
				<div id="copyright" class="container">
					<ul class="links">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</section>
		</div>
</body>
</html>