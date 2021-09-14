<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Zay Shop - Product Detail Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	
    <link rel="apple-touch-icon" href="images/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo.css">
    <link rel="stylesheet" href="css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="css/fontawesome.min.css">

    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="css/slick.min.css">
    <link rel="stylesheet" type="text/css" href="css/slick-theme.css">
    
    <link rel="stylesheet" href="css/main.css" />
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="js/product.js"></script>
    
    <style>
    
		.link-icon { position: relative; display: inline-block; width: auto;    font-size: 14px; font-weight: 500; color: #333; margin-right: 10px;  }
		.link-icon.twitter {  background-repeat: no-repeat; }
		.link-icon.facebook {  background-repeat: no-repeat; } 
		.link-icon.kakao {  background-repeat: no-repeat; }
    </style>
</head>


<body>
<form name="formm" id="theform" method="post">
<input type="hidden" name="pseq" id="pseq" value="${productVO.pseq}">
<input type="hidden" name="kind" value="${productVO.kind}">
<input type="hidden" name="price" value="${productVO.price}">
<input type="hidden" name="id" value="${productVO.id}">
<input type="hidden" name="name" value="${productVO.name}">
<input type="hidden" name="regdate" value="${productVO.regdate}">
<input type="hidden" name="soldyn" id="soldyn" value="${productVO.soldyn}">

   <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                   		<!-- 대표사진 -->
                        <img class="card-img img-fluid" src="product_images/${productVO.image}" alt="Card image cap" id="product-detail">
                    </div>
                    <div class="row">
                        <!--Start Controls-->
<!--                         <div class="col-1 align-self-center"> -->
<!--                             <a href="#multi-item-example" role="button" data-bs-slide="prev"> -->
<!--                                 <i class="text-dark fas fa-chevron-left"></i> -->
<!--                                 <span class="sr-only">Previous</span> -->
<!--                             </a> -->
<!--                         </div> -->
                        <!--End Controls-->
                        <!--Start Carousel Wrapper-->
                        <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                           
                            <!--Start Slides-->
                            <div class="carousel-inner product-links-wap" role="listbox">

								
                                <!--First slide-->
                                <div class="carousel-item active">
                                    <div class="row">
                                    <c:forEach items="${productImageList}"  var="productImageVO">
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="product_images/${productImageVO.product_image}" alt="Product Image 1">
                                            </a>
                                        </div>
                                     </c:forEach>
<!--                                         <div class="col-4"> -->
<!--                                             <a href="#"> -->
<!--                                                 <img class="card-img img-fluid" src="images/product_single_02.jpg" alt="Product Image 2"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="col-4"> -->
<!--                                             <a href="#"> -->
<!--                                                 <img class="card-img img-fluid" src="images/product_single_03.jpg" alt="Product Image 3"> -->
<!--                                             </a> -->
<!--                                         </div> -->
                                    </div>
                                </div>
                                
                                <!--/.First slide-->

                                <!--Second slide-->
<!--                                 <div class="carousel-item"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="col-4"> -->
<!--                                             <a href="#"> -->
<!--                                                 <img class="card-img img-fluid" src="images/product_single_04.jpg" alt="Product Image 4"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="col-4"> -->
<!--                                             <a href="#"> -->
<!--                                                 <img class="card-img img-fluid" src="images/product_single_05.jpg" alt="Product Image 5"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="col-4"> -->
<!--                                             <a href="#"> -->
<!--                                                 <img class="card-img img-fluid" src="images/product_single_06.jpg" alt="Product Image 6"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <!--/.Second slide-->

                                <!--Third slide-->
<!--                                 <div class="carousel-item"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="col-4"> -->
<!--                                             <a href="#"> -->
<!--                                                 <img class="card-img img-fluid" src="images/product_single_07.jpg" alt="Product Image 7"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="col-4"> -->
<!--                                             <a href="#"> -->
<!--                                                 <img class="card-img img-fluid" src="images/product_single_08.jpg" alt="Product Image 8"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                         <div class="col-4"> -->
<!--                                             <a href="#"> -->
<!--                                                 <img class="card-img img-fluid" src="images/product_single_09.jpg" alt="Product Image 9"> -->
<!--                                             </a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <!--/.Third slide-->
                            </div>
                            <!--End Slides-->
                        </div>
                        <!--End Carousel Wrapper-->
                        <!--Start Controls-->
<!--                         <div class="col-1 align-self-center"> -->
<!--                             <a href="#multi-item-example" role="button" data-bs-slide="next"> -->
<!--                                 <i class="text-dark fas fa-chevron-right"></i> -->
<!--                                 <span class="sr-only">Next</span> -->
<!--                             </a> -->
<!--                         </div> -->
                        <!--End Controls-->
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body">
                        	<div style="display : flex;">
                        	
                        	<div>
                            <h1 class="h2">${productVO.title} </h1>
                            </div>
                            
                            <div style="margin-left: auto;">
                          	<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"><img alt="" src="images/icon-twitter.png"></a>
							<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();"><img alt="" src="images/icon-facebook.png"></a>    
							<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();"><img alt="" src="images/icon-kakao.png"></a>   
							</div>
							
                            </div>
                            
                            <p class="h3 py-2">${productVO.price}원</p>
                            <p class="py-2">
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-secondary"></i>
                                <span class="list-inline-item text-dark">Rating 4.8 | ${totalComment} Comments</span>
                            </p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>id</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>:  ${productVO.id}</strong></p>
                                    
                                </li>
                            </ul>
                            
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>registration date</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>:  ${productVO.regdate}</strong></p>
                                    
                                </li>
                            </ul>
                            
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>product name</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>:  ${productVO.name}</strong></p>
                                    
                                </li>
                            </ul>

  							 <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>category:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>${productVO.kind_nm}</strong></p>
                                </li>
                            </ul>


<!--                             <h6>Description:</h6> -->
<%--                             <p>${productVO.content}</p> --%>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>delivery:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>${productVO.delivery_nm}</strong></p>
                                </li>
                            </ul>
                            
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Description:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>${productVO.content}</strong></p>
                                </li>
                            </ul>

<!--                             <h6>Specification:</h6> -->
<!--                             <ul class="list-unstyled pb-3"> -->
<!--                                 <li>Lorem ipsum dolor sit</li> -->
<!--                                 <li>Amet, consectetur</li> -->
<!--                                 <li>Adipiscing elit,set</li> -->
<!--                                 <li>Duis aute irure</li> -->
<!--                                 <li>Ut enim ad minim</li> -->
<!--                                 <li>Dolore magna aliqua</li> -->
<!--                                 <li>Excepteur sint</li> -->
<!--                             </ul> -->



                            <form action="" method="GET">
                                <input type="hidden" name="product-title" value="Activewear">
                                
                            
<!--                                 <div class="row"> -->
<!--                                     <div class="col-auto"> -->
<!--                                         <ul class="list-inline pb-3"> -->
<!--                                             <li class="list-inline-item">Size : -->
<!--                                                 <input type="hidden" name="product-size" id="product-size" value="S"> -->
<!--                                             </li> -->
<!--                                             <li class="list-inline-item"><span class="btn btn-success btn-size">S</span></li> -->
<!--                                             <li class="list-inline-item"><span class="btn btn-success btn-size">M</span></li> -->
<!--                                             <li class="list-inline-item"><span class="btn btn-success btn-size">L</span></li> -->
<!--                                             <li class="list-inline-item"><span class="btn btn-success btn-size">XL</span></li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                     <div class="col-auto"> -->
<!--                                         <ul class="list-inline pb-3"> -->
<!--                                             <li class="list-inline-item text-right"> -->
<!--                                                 Quantity -->
<!--                                                 <input type="hidden" name="product-quanity" id="product-quanity" value="1"> -->
<!--                                             </li> -->
<!--                                             <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li> -->
<!--                                             <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li> -->
<!--                                             <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <div class="row pb-3">
                                    <div class="col d-grid">
                                     <c:choose>
                                    <c:when test="${sessionScope.loginUser.id == productVO.id}">
                                       <button type="button" class="btn btn-success btn-lg" id="but" name="submit" onclick="DontmovePayForm()">구매하기</button>
                                    </c:when>
                                    <c:otherwise>
                                       <button type="button" class="btn btn-success btn-lg" id="but" name="submit" onclick="movePayForm()">구매하기</button>
                                    </c:otherwise>
                                 </c:choose>
                                      
                                    </div>
										<div class="col d-grid">
                                 <c:choose>
                                    <c:when test="${empty sessionScope.loginUser}">
                                       <button type="button" class="btn btn-success btn-lg"
                                          id="empty_check" name="submit" onclick="login_empty_check()">찜 등록</button>
                                    </c:when>
                                    <c:when test="${sessionScope.loginUser.id == productVO.id}">
                                       <button type="button" class="btn btn-success btn-lg"
                                          id="jjim_check" name="submit"
                                          onclick="login_jjim_check()">찜 등록</button>
                                    </c:when>
                                    <c:otherwise>
                                       <button type="button" class="btn btn-success btn-lg"
                                          name="submit" id="jjim_check"
                                          onclick="jjim_check_form('${productVO.pseq}')">찜 등록</button>
                                    </c:otherwise>
                                 </c:choose>
                              </div>
									</div>
                                	
                                <div style="text-align: center;">
								<c:if test="${sessionScope.loginUser.id == productVO.id}">
									<button type="button" id="" onclick="go_update()">수정</button>
									<button type="button" id="" onclick="go_delete()">삭제</button>
								</c:if>
								</div>	
                                	
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>
    <!-- Close Content -->
        <!-- Start Script -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/templatemo.js"></script>
    <script src="js/custom.js"></script>
    <!-- End Script -->
	<!-- Scripts -->
		
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.dropotron.min.js"></script>
	<script src="js/browser.min.js"></script>
	<script src="js/breakpoints.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/main.js"></script>


    <!-- Start Slider Script -->
    <script src="js/slick.min.js"></script>
    <script>
        $('#carousel-related-product').slick({
            infinite: true,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 3,
            dots: true,
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
        
        function shareTwitter() {

        	var t =  document.getElementById("pseq").value;
        	
         	var sendText = "써니플리마켓에서 공유할 중고거래를 소개합니다."; // 전달할 텍스트
            var sendUrl = "http://localhost:8181/sunny/product_detail?pseq="+ t; // 전달할 URL
            window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
        }
        
        function shareFacebook() {
        	var t =  document.getElementById("pseq").value;
        	
        	var sendUrl = "http://localhost:8181/sunny/product_detail?pseq="+ t; // 전달할 URL
            window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
        }
        

        function shareKakao() {
        var t =  document.getElementById("pseq").value;
        
          // 사용할 앱의 JavaScript 키 설정
          Kakao.init('34fc5afec38496128b56a0ed781010a0');
         
          // 카카오링크 버튼 생성
          Kakao.Link.createDefaultButton({
            container: '#btnKakao', // 카카오공유버튼ID
            objectType: 'feed',
            content: {
              title: "써니플리마켓", // 보여질 제목
              description: "써니플리마켓에서 공유할 중고거래를 소개합니다.", // 보여질 설명
              imageUrl: "http://localhost:8181/sunny/product_detail?pseq="+t, // 콘텐츠 URL
              link: {
                 mobileWebUrl: "http://192.168.137.1:8181/sunny/index",
                 webUrl: "http://localhost:8181/sunny/product_detail?pseq="+t
              }
            }
          });
        }
        
    </script>
    <!-- End Slider Script -->
	
<%@include file="comment.jsp" %>
<%@ include file="../footer.jsp"%>
</body>
</html>