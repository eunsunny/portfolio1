<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flea Market</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
	<script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.0/js/dataTables.jqueryui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/> 
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/dataTables.jqueryui.min.css"/> 
    
    <script>
    $(document).ready(function() {
    	var status = 'ready';
	    makeGrid(status);
    } );
    
    function makeGrid(status){
    	if(status == 'reload') {
    		$("#board").dataTable().fnDestroy();
    	} 
    	
    	$('#board').DataTable({
	        scrollY : 500,
	        order : [[0, "desc"]],
	        ajax: {
	            "type" : "GET",
	            /*c:url : 컨택스트 루트를 반환(/sunny)
	    		          a태그에 a href를 걸거나 $.ajax를 사용하거나 form을 던질 때는 컨택스트 루트인 /sunny를 알아서 찾지만
	    		          따로 지정해주지 않으면 컨택스트 루트를 찾지못하는 경우가 있어 사용
	    		          외부 자원(api) 통신의 url, location.href 등은 컨택스트 루트를 따로 지정해줘야한다.
	    		*/
	            "url"  : "<c:url value='/getBoard'/>",
	            "dataType": "JSON"
	            },
	        "bDestroy": true,
	        columns: [
                      { data: "BSEQ" },
                      { data: "TITLE" ,
                    	// render : 렌더링이란 서버로부터 데이터를 받아 JSP에 뿌려주는 과정이다.
                    	// 렌더를 사용하여 뿌려지는 값에 다양한 이벤트를 걸 수 있다.
                  	    render : function(data, type, row, meta){
                  	    	//console.log("data:"+data); //각 줄의 글 제목을 반환 - data: "TITLE"의 렌더링이므로
                  	    	//console.log("row:"+JSON.stringify(row)); //한 줄을 JSON형식으로 반환
                  	    	
	                 	    var bseq = row.BSEQ;
	                 	    /*request.getContextPath() : 이 또한 컨택스트 루트를 반환(/sunny)
	                 	      localhost:8181/sunny/getBoardDetail?bseq=${bseq}꼴로 찾아야하므로 컨택스트 루트가 필요한 것
	                 	    */
	                 	    data = '<a href="<%=request.getContextPath()%>/getBoardDetail?bseq='+bseq+'">'+data + '</a>'; 
	                 	    return data;
                 	    }
                      },
                      { data: "ID" },
                      { data: "REGDATE" },
                      { data: "COUNT" }
	                 ]
	       });
    	
    }

   	function popOpen() {
   		var url= "<%=request.getContextPath()%>/BoardWrite";    //팝업창 페이지 URL
   		var winWidth = 1100;
   	    var winHeight = 500;
   	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
   		window.open(url,"",popupOption);
   	}
    </script>
    
    <script type="text/javascript" src="js/product.js"></script>

</head>
<body>
<div style="width:1280px; margin:50px auto;">
<div style="text-align:right;">
<input type="button" id="write" class="write" name="write" onClick="popOpen()" value="글 등록"  style="margin-bottom: 50px; "/>
</div>

  <table id="board" class="display" >
         <thead>
             <tr>
                 <th>번호</th>
                 <th>제목</th>
                 <th>작성자</th>
                 <th>작성일</th>
                 <th>조회수</th>
             </tr>
         </thead>
     </table>
 </div>
 
 <!-- footer를 사용하면 깨지는 부분이 있어 board.jsp는 footer의 body문을 직접 가져옴 -->
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
										<div class="col-12">
											<textarea name="message" id="message" placeholder="message" rows="8"></textarea>
										</div>
										<div class="col-12">
											<input class="btn" type="button" value="Send Message" onClick="send_mail()">
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