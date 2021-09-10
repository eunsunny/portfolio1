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
										<div class="col-6 col-12-small">
											<input name="name" placeholder="Name" type="text" />
										</div>
										<div class="col-6 col-12-small">
											<input name="email" placeholder="Email" type="text" />
										</div>
										<div class="col-12">
											<textarea name="message" placeholder="Message"></textarea>
										</div>
										<div class="col-12">
											<a href="#" class="form-button-submit button icon solid fa-envelope">Send Message</a>
										</div>
									</div>
								</form>
							</section>
						</div>
						<div class="col-6 col-12-medium">
							<section>
								<p>Erat lorem ipsum veroeros consequat magna tempus lorem ipsum consequat Phaselamet
								mollis tortor congue. Sed quis mauris sit amet magna accumsan tristique. Curabitur
								leo nibh, rutrum eu malesuada.</p>
								<div class="row">
									<div class="col-6 col-12-small">
										<ul class="icons">
											<li class="icon solid fa-home">
												1234 Somewhere Road<br />
												Nashville, TN 00000<br />
												USA
											</li>
											<li class="icon solid fa-phone">
												(000) 000-0000
											</li>
											<li class="icon solid fa-envelope">
												<a href="#">info@untitled.tld</a>
											</li>
										</ul>
									</div>
									<div class="col-6 col-12-small">
										<ul class="icons">
											<li class="icon brands fa-twitter">
												<a href="#">@untitled</a>
											</li>
											<li class="icon brands fa-instagram">
												<a href="#">instagram.com/untitled</a>
											</li>
											<li class="icon brands fa-dribbble">
												<a href="#">dribbble.com/untitled</a>
											</li>
											<li class="icon brands fa-facebook-f">
												<a href="#">facebook.com/untitled</a>
											</li>
										</ul>
									</div>
								</div>
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
</body>
</html>