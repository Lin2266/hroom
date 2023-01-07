<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- Header start -->
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>
<!-- Header end -->
<!--================Home Banner Area =================-->
<!-- breadcrumb start-->
<style>
.listBtn {
  background-color: white;
  border: none;
  font-size: 14px;
  font-family: "Poppins", sans-serif;
  font-weight: normal;
  color: #797979;
  position: relative;
}
.productBtn {
  background-color: white;
  border: none;
/*   color: #ff3368; */
  color: #797979; 
  text-transform: uppercase;
  font-size: 18px;
  font-weight: 500;
   display: block;
   margin-top: 10px; 
}
</style>

<!--================Category Product Area =================-->
<!-- <section class="cat_product_area section_padding"> -->
<section class="cat_product_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="left_sidebar_area">
					<aside class="left_widgets p_filter_widgets2">
						<div class="l_w_title">
							<h3>產品目錄</h3>
						</div>
						<div class="widgets_inner">
							<ul class="list">
<!-- 								<li><a href="#" class="queryAll">所有商品</a> <span -->
<!-- 									id="pcount2"></span></li> -->
<!-- 								<li><a href="#" class="queryProject">精選方案</a> <span></span></li> -->
<!-- 								<li><a href="#" class="queryPopular">熱銷商品</a> <span></span></li> -->
<!-- 								<li><a href="#" class="queryDesk">沙發/桌子/椅子</a> <span></span></li> -->
<!-- 								<li><a href="#" class="queryBed">床組/寢具</a> <span></span></li> -->
								<li><form action="ProductServlet?method=AllProductsRender" method="POST">
										<input class="listBtn" type="submit" value="所有商品">
									</form></li>
								<li><form action="ProductServlet?method=ProjectProductsRender" method="POST">
										<input class="listBtn" type="submit" value="精選方案">
									</form></li>
								<li><form action="ProductServlet?method=HotProductsRender" method="POST">
										<input class="listBtn" type="submit" value="熱門商品">
									</form></li>
								<li><form action="ProductServlet?method=DeskProductsRender" method="POST">
										<input class="listBtn" type="submit" value="沙發/桌子/椅子">
									</form></li>
								<li><form action="ProductServlet?method=BedProductsRender" method="POST">
										<input class="listBtn" type="submit" value="床組/寢具">
									</form></li>
							</ul>
						</div>
					</aside>

					<aside class="left_widgets p_filter_widgets2">
						<div class="l_w_title">
							<h3>熱門品牌</h3>
						</div>
						<div class="widgets_inner">
							<ul class="list">
							    <li><form action="ProductServlet?method=BrandHroom" method="POST">
										<input class="listBtn" type="submit" value="涵潤 HamRu">
									</form></li>
								<li><form action="ProductServlet?method=BrandIkea" method="POST">
										<input class="listBtn" type="submit" value="Ikea">
									</form></li>
								<li><form action="ProductServlet?method=BrandEdli" method="POST">
										<input class="listBtn" type="submit" value="宜得利">
									</form></li>
								<li><form action="ProductServlet?method=BrandLife" method="POST">
										<input class="listBtn" type="submit" value="生活倉庫">
									</form></li>
							</ul>

						</div>
					</aside>

					<aside class="left_widgets p_filter_widgets2">
						<div class="l_w_title">
							<h3>顏色分類</h3>
						</div>
						<div class="widgets_inner">
							<ul class="list">
							    <li><form action="ProductServlet?method=ColorWhite" method="POST">
										<input class="listBtn" type="submit" value="白色">
									</form></li>
								<li><form action="ProductServlet?method=ColorBlack" method="POST">
										<input class="listBtn" type="submit" value="黑色">
									</form></li>
								<li><form action="ProductServlet?method=ColorBrown" method="POST">
										<input class="listBtn" type="submit" value="棕色">
									</form></li>
								<li><form action="ProductServlet?method=ColorOther" method="POST">
										<input class="listBtn" type="submit" value="其他">
									</form></li>
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
										<span>~</span> <input type="text" class="js-input-to"
											id="amount" readonly />
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
						<div
							class="product_top_bar d-flex justify-content-between align-items-center">
							<div class="single_product_menu">
								<p>
									總共找到<span> ${rtnList.size()} </span>件商品
								</p>
							</div>
							<div class="single_product_menu d-flex">
								<h5>short by :</h5>
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
				<!-- 				<div id="MainContent"></div> -->
				<div class="row align-items-center latest_product_inner">
					<c:forEach items="${rtnList}" var="ListItem">
						<div class="col-lg-4 col-sm-6">
							<div class="single_product_item">
								<img src="img/product/HRoomProduct/product_${ListItem.id}.png"
									alt="">
								<div class="single_product_text">
									<h4>${ListItem.name}</h4>
									<h3>
										$ <span>${ListItem.cost}</span>
									</h3>
									<%-- <h6>${ListItem.brand}|${ListItem.color}</h6> --%>
									<a class="add_cart">+ 加入購物車<i class="ti-heart"></i></a> 
                                    <input type="hidden" name="productId" class="productId" value="${ListItem.id}">
								<form action="SingleProductServlet?method=SingleProduct" method="POST">
								<input class="productBtn" type="submit" value="商品詳細資訊">
								<input type="hidden" name="SentproductId" value="${ListItem.id}">
								</form>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="col-lg-12">
						<div class="pageination">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <i class="ti-angle-double-left"></i>
									</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">6</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <i class="ti-angle-double-right"></i>
									</a></li>
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

<!-- <section class="product_list best_seller"> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row justify-content-center"> -->
<!-- 			<div class="col-lg-12"> -->
<!-- 				<div class="section_tittle text-center"> -->
<!-- 					<h2> -->
<!-- 						熱銷商品 <span>商城</span> -->
<!-- 					</h2> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div id="PopularContent"></div>  -->
<!-- 		<div class="row align-items-center justify-content-between"> -->
<!-- 			<div class="col-lg-12"> -->
<!-- 				<div class="best_product_slider owl-carousel"> -->
<%-- 					<c:forEach items="${HotProducts}" var="ListItem"> --%>
<!-- 						<div class="single_product_item"> -->
<%-- 							<img src="img/product/HRoomProduct/product_${ListItem.id}.png" --%>
<!-- 								alt=""> -->
<!-- 							<div class="single_product_text"> -->
<%-- 								<h4>${ListItem.name}</h4> --%>
<%-- 								<h3>$ <span>${ListItem.cost}</span></h3> --%>
<!-- 								<a class="add_cart">+ 加入購物車<i class="ti-heart"></i></a> -->
<%-- 								<input type="hidden" class="productId" value="${ListItem.id}"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </section> -->

<!-- product_list part end-->
<!-- <script src="js/category.js"></script> -->
<!--::footer_part start::-->
<jsp:include page="/WEB-INF/subviews/footer.jsp" />
<!--::footer_part end::-->

