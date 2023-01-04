<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Header start -->
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>	
<!-- Header end -->

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->

    <!-- breadcrumb start-->

    <!--================Category Product Area =================-->
    <section class="cat_product_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>產品目錄</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li>
                                        <a href="#">所有商品</a>
                                        <span>(50)</span>
                                    </li>
                                    <li>
                                        <a href="#">精選方案</a>
                                        <span>(3)</span>
                                    </li>
                                    <li>
                                        <a href="#">沙發/桌子/椅子</a>
                                        <span>(250)</span>
                                    </li>
                                    <li>
                                        <a href="#">床組/寢具</a>
                                        <span>(250)</span>
                                    </li>
                                </ul>
                            </div>
                        </aside>

                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>熱門品牌</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li>
                                        <a href="#">涵潤 HamRu</a>
                                    </li>
                                    <li>
                                        <a href="#">Ikea</a>
                                    </li>
                                    <li class="active">
                                        <a href="#">宜得利</a>
                                    </li>
                                    <li>
                                        <a href="#">MR.Living 居家先生</a>
                                    </li>
                                    <li>
                                        <a href="#">生活倉庫</a>
                                    </li>
                                </ul>
                                
                            </div>
                        </aside>

                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>顏色分類</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li>
                                        <a href="#">白色</a>
                                    </li>
                                    <li>
                                        <a href="#">黑色</a>
                                    </li>
                                    <li>
                                        <a href="#">棕色</a>
                                    </li>
                                    <li>
                                        <a href="#">其他</a>
                                    </li>
                                </ul>
                            </div>
                        </aside>

                        <aside class="left_widgets p_filter_widgets price_rangs_aside">
                            <div class="l_w_title">
                                <h3>價格預算</h3>
                            </div>
                            <div class="widgets_inner">
                                <div class="range_item">
                                    <!-- <div id="slider-range"></div> -->
                                    <input type="text" class="js-range-slider" value="" />
                                    <div class="d-flex">
                                        <div class="price_text">
                                            <p>價格 :</p>
                                        </div>
                                        <div class="price_value d-flex justify-content-center">
                                            <input type="text" class="js-input-from" id="amount" readonly />
                                            <span>~</span>
                                            <input type="text" class="js-input-to" id="amount" readonly />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </aside>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product_top_bar d-flex justify-content-between align-items-center">
                                <div class="single_product_menu">
                                    <p><span>10000 </span> Prodict Found</p>
                                </div>
                                <div class="single_product_menu d-flex">
                                    <h5>short by : </h5>
                                    <select>
                                        <option data-display="Select">name</option>
                                        <option value="1">price</option>
                                        <option value="2">product</option>
                                    </select>
                                </div>
                                <div class="single_product_menu d-flex">
                                    <h5>show :</h5>
                                    <div class="top_pageniation">
                                        <ul>
                                            <li>1</li>
                                            <li>2</li>
                                            <li>3</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="single_product_menu d-flex">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="search"
                                            aria-describedby="inputGroupPrepend">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroupPrepend"><i
                                                    class="ti-search"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row align-items-center latest_product_inner">
                        
                      <c:forEach items="${rtnList}" var="ListItem">
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
										<img src="img/product/HRoomProduct/product_${ListItem.id}.png"
											alt="">
										<div class="single_product_text">
											<h4>${ListItem.name}</h4>
											<h3>$ ${ListItem.cost}</h3>
											<a class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
							            	<input type="hidden" class="productId" value="${ListItem.id}">
										</div>
							</div>
                        </div>
                        </c:forEach>
<!--                         <div class="col-lg-4 col-sm-6"> -->
<!--                             <div class="single_product_item"> -->
<!--                                 <img src="img/product/product_2.png" alt=""> -->
<!--                                 <div class="single_product_text"> -->
<!--                                     <h4>Quartz Belt Watch</h4> -->
<!--                                     <h3>$150.00</h3> -->
<!--                                     <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-sm-6"> -->
<!--                             <div class="single_product_item"> -->
<!--                                 <img src="img/product/product_3.png" alt=""> -->
<!--                                 <div class="single_product_text"> -->
<!--                                     <h4>Quartz Belt Watch</h4> -->
<!--                                     <h3>$150.00</h3> -->
<!--                                     <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-sm-6"> -->
<!--                             <div class="single_product_item"> -->
<!--                                 <img src="img/product/product_4.png" alt=""> -->
<!--                                 <div class="single_product_text"> -->
<!--                                     <h4>Quartz Belt Watch</h4> -->
<!--                                     <h3>$150.00</h3> -->
<!--                                     <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-sm-6"> -->
<!--                             <div class="single_product_item"> -->
<!--                                 <img src="img/product/product_5.png" alt=""> -->
<!--                                 <div class="single_product_text"> -->
<!--                                     <h4>Quartz Belt Watch</h4> -->
<!--                                     <h3>$150.00</h3> -->
<!--                                     <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-sm-6"> -->
<!--                             <div class="single_product_item"> -->
<!--                                 <img src="img/product/product_6.png" alt=""> -->
<!--                                 <div class="single_product_text"> -->
<!--                                     <h4>Quartz Belt Watch</h4> -->
<!--                                     <h3>$150.00</h3> -->
<!--                                     <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-sm-6"> -->
<!--                             <div class="single_product_item"> -->
<!--                                 <img src="img/product/product_7.png" alt=""> -->
<!--                                 <div class="single_product_text"> -->
<!--                                     <h4>Quartz Belt Watch</h4> -->
<!--                                     <h3>$150.00</h3> -->
<!--                                     <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-sm-6"> -->
<!--                             <div class="single_product_item"> -->
<!--                                 <img src="img/product/product_8.png" alt=""> -->
<!--                                 <div class="single_product_text"> -->
<!--                                     <h4>Quartz Belt Watch</h4> -->
<!--                                     <h3>$150.00</h3> -->
<!--                                     <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-sm-6"> -->
<!--                             <div class="single_product_item"> -->
<!--                                 <img src="img/product/product_2.png" alt=""> -->
<!--                                 <div class="single_product_text"> -->
<!--                                     <h4>Quartz Belt Watch</h4> -->
<!--                                     <h3>$150.00</h3> -->
<!--                                     <a href="#" class="add_cart">+ add to cart<i class="ti-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                        <div class="col-lg-12">
                            <div class="pageination">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <i class="ti-angle-double-left"></i>
                                            </a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                                        <li class="page-item"><a class="page-link" href="#">6</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <i class="ti-angle-double-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Category Product Area =================-->

    <!-- product_list part start-->
    <section class="product_list best_seller">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>Best Sellers <span>shop</span></h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-12">
                    <div class="best_product_slider owl-carousel">
                        <div class="single_product_item">
                            <img src="img/product/product_1.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="img/product/product_2.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="img/product/product_3.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="img/product/product_4.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="img/product/product_5.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product_list part end-->
  <!--::footer_part start::-->
	<jsp:include page="/WEB-INF/subviews/footer.jsp"/>
  <!--::footer_part end::-->

  

    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="js/slick.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="js/stellar.js"></script>
    <script src="js/price_rangs.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
