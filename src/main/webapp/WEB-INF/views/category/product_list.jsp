<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Zay Shop - Product Listing Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="css/main.css" />
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="css/fontawesome.min.css">
    
    <script type="text/javascript" src="js/product.js"></script>

</head>

<body>
  <!-- Modal -->
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



    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">

            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=1">
                            패션의류/잡화

                        </a>
<!--                         <ul class="collapse show list-unstyled pl-3"> -->
<!--                             <li><a class="text-decoration-none" href="#">Men</a></li> -->
<!--                             <li><a class="text-decoration-none" href="#">Women</a></li> -->
<!--                         </ul> -->
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=2">
                            뷰티
                           
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Sport</a></li>
                            <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        </ul>
                    </li>
                                        <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=3">
                            출산/유아동
                           
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Sport</a></li>
                            <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        </ul>
                    </li>
                                        </li>
                                        <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=4">
                            식품
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Sport</a></li>
                            <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        </ul>
                    </li>
                                        <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=5">
                            주방/생활용품
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                                        <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=6">
                            인테리어
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                                        <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=7">
                            가전디지털
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                                        <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=8">
                            스포츠/레저
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                                        <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=9">
                            자동차용품
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                                        <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=10">
                            도서/음반/DVD
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                                        <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=11">
                            완구/문구/취미
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=12">
                            반려동물
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=13">
                            헬스/건강식품
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?kind=14">
                            무료나눔
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
			
            <div class="col-lg-9">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#">${productTry.kind_nm}</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#"></a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="#"></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 pb-4">
<!--                         <div class="d-flex"> -->
<!--                             <select class="form-control" id="searchBox" name="searchBox" onchange="changeSelectBox()"> -->
<!--                                 <option selected value="1">전체</option> -->
<!--                                 <option value="2">조회순</option> -->
<!--                                 <option value="3">최신순</option> -->
<!--                                 <option value="4">찜순</option> -->
<!--                             </select> -->
<!--                         </div> -->
                    </div>
                </div>
                
  <form name="frm" id="prod_form" method="post"> 
  <input type="hidden" id="kind" name="kind" value="${productVO.kind}">
  <input type="hidden" id="cnt" name="cnt" value="${productVO.cnt}">
  <input type="hidden" id="kind_nm" name="kind_nm" value="${productTry.kind_nm}">
   <c:choose>
    <c:when test="${productListSize<=0}">
    <tr>
      <td width="100%" colspan="7" align="center" height="23">
        등록된 상품이 없습니다.
      </td>      
    </tr>
    </c:when>
	<c:otherwise>             
                <div class="row">
                <c:forEach items="${productList}"  var="productVO">
                    <div class="col-md-4">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">
                            <a id="atag" href="product_detail?pseq=${productVO.pseq}">
                            	<c:if test="${productVO.soldyn == 'y'}">
                            	<div style="position: relative;">
                            	<img class="card-img rounded-0 img-fluid" style="width:310px; height:250px; opacity:0.3; position: absolute;" src="product_images/판매완료.png" />
                                <img class="card-img rounded-0 img-fluid" style="width:310px; height:250px; opacity:0.3;" src="product_images/${productVO.image}" />
                                </div>
                                </c:if>
                                <c:if test="${productVO.soldyn == 'n'}">                           
                                <img class="card-img rounded-0 img-fluid" style="width:310px;height:250px" src="product_images/${productVO.image}" />
                                </c:if>
                                
                             </a>
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                    	<c:choose>
                                    		<c:when test="${empty sessionScope.loginUser}">
                                        		<li><a class="btn btn-success text-white" href="#" onclick="login_empty_check()">
                                        			<i class="far fa-heart"></i></a></li>
                                        	</c:when>
                                    		<c:otherwise>
                                        		<li><a class="btn btn-success text-white" href="jjim_insert_list?pseq=${productVO.pseq}">
                                        			<i class="far fa-heart"></i></a></li>
                                        	</c:otherwise>
                                        </c:choose>                                        
                                        <li><a class="btn btn-success text-white mt-2" href="product_detail?pseq=${productVO.pseq}"><i class="far fa-eye"></i></a></li>
<%--                                         <li><a class="btn btn-success text-white mt-2" href="product_detail?pseq=${productVO.pseq}"><i class="fas fa-cart-plus"></i></a></li> --%>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                            
                                <a style="font-size: 10em;" href="product_detail?pseq=${productVO.pseq}" class="h3 text-decoration-none">${productVO.name}</a>
                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                    <li><p class="text-center mb-0">조회수 : ${productVO.cnt}</p></li>
                                    <li class="pt-2">
                                        <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                        <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                    </li>
                                </ul>
<!--                                 <ul class="list-unstyled d-flex justify-content-center mb-1"> -->
<!--                                     <li> -->
<!--                                         <i class="text-warning fa fa-star"></i> -->
<!--                                         <i class="text-warning fa fa-star"></i> -->
<!--                                         <i class="text-warning fa fa-star"></i> -->
<!--                                         <i class="text-muted fa fa-star"></i> -->
<!--                                         <i class="text-muted fa fa-star"></i> -->
<!--                                     </li> -->
<!--                                 </ul> -->
                                <p style="font-size: 30px;" class="text-center mb-0">${productVO.price}원</p>
                                
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
   	</c:otherwise>	
</c:choose>  
</form> 
                <br>
                <br>
              	<%@ include file="../page_area.jsp" %>
                <input class="btn" type="button" name="btn_write" value="상품등록" onClick="go_wrt()">
                </div>
                
              
               
            

        </div>
    </div>
    <!-- End Content -->

<!--     Start Brands -->
<!--     <section class="bg-light py-5"> -->
<!--         <div class="container my-4"> -->
<!--             <div class="row text-center py-3"> -->
<!--                 <div class="col-lg-6 m-auto"> -->
<!--                     <h1 class="h1">Our Brands</h1> -->
<!--                     <p> -->
<!--                         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod -->
<!--                         Lorem ipsum dolor sit amet. -->
<!--                     </p> -->
<!--                 </div> -->
<!--                 <div class="col-lg-9 m-auto tempaltemo-carousel"> -->
<!--                     <div class="row d-flex flex-row"> -->
<!--                         Controls -->
<!--                         <div class="col-1 align-self-center"> -->
<!--                             <a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev"> -->
<!--                                 <i class="text-light fas fa-chevron-left"></i> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         End Controls -->

<!--                         Carousel Wrapper -->
<!--                         <div class="col"> -->
<!--                             <div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example" data-bs-ride="carousel"> -->
<!--                                 Slides -->
<!--                                 <div class="carousel-inner product-links-wap" role="listbox"> -->

<!--                                     First slide -->
<!--                                     <div class="carousel-item active"> -->
<!--                                         <div class="row"> -->
<!--                                             <div class="col-3 p-md-5"> -->
<!--                                                 <a href="#"><img class="img-fluid brand-img" src="images/brand_01.png" alt="Brand Logo"></a> -->
<!--                                             </div> -->
<!--                                             <div class="col-3 p-md-5"> -->
<!--                                                 <a href="#"><img class="img-fluid brand-img" src="images/brand_02.png" alt="Brand Logo"></a> -->
<!--                                             </div> -->
<!--                                             <div class="col-3 p-md-5"> -->
<!--                                                 <a href="#"><img class="img-fluid brand-img" src="images/brand_03.png" alt="Brand Logo"></a> -->
<!--                                             </div> -->
<!--                                             <div class="col-3 p-md-5"> -->
<!--                                                 <a href="#"><img class="img-fluid brand-img" src="images/brand_04.png" alt="Brand Logo"></a> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     End First slide -->

<!--                                     Second slide -->
<!--                                     <div class="carousel-item"> -->
<!--                                         <div class="row"> -->
<!--                                             <div class="col-3 p-md-5"> -->
<!--                                                 <a href="#"><img class="img-fluid brand-img" src="img/brand_01.png" alt="Brand Logo"></a> -->
<!--                                             </div> -->
<!--                                             <div class="col-3 p-md-5"> -->
<!--                                                 <a href="#"><img class="img-fluid brand-img" src="img/brand_02.png" alt="Brand Logo"></a> -->
<!--                                             </div> -->
<!--                                             <div class="col-3 p-md-5"> -->
<!--                                                 <a href="#"><img class="img-fluid brand-img" src="img/brand_03.png" alt="Brand Logo"></a> -->
<!--                                             </div> -->
<!--                                             <div class="col-3 p-md-5"> -->
<!--                                                 <a href="#"><img class="img-fluid brand-img" src="img/brand_04.png" alt="Brand Logo"></a> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     End Second slide -->

                                   

<!--                                 </div> -->
<!--                                 End Slides -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         End Carousel Wrapper -->

<!--                         Controls -->
<!--                         <div class="col-1 align-self-center"> -->
<!--                             <a class="h1" href="#multi-item-example" role="button" data-bs-slide="next"> -->
<!--                                 <i class="text-light fas fa-chevron-right"></i> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         End Controls -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
 <%--         <tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr> --%> 
<!--     </section> -->
    <!--End Brands-->
    
    <!-- Start Script -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/templatemo.js"></script>
    <script src="js/custom.js"></script>
    <!-- End Script -->
	<!-- Scripts -->

<%@ include file="../footer.jsp"%>
</body>
</html>