<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<!-- banner part start-->
<section class="banner_part">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<div class="banner_slider owl-carousel">
					<!-- part1 start -->
					<div class="single_banner_slider">
						<div class="row">
							<div class="col-lg-5 col-md-8">
								<div class="banner_text">
									<div class="banner_text_iner">
										<h1>12月最新商品</h1>
										<h3>
											三人座沙發
											<p>亞麻布／藍色／座椅長度114cm／座椅高度41cm</p>
										</h3>
										<a href="#" class="btn_2">立即購買</a>
									</div>
								</div>
							</div>
							<div class="banner_img d-none d-lg-block">
								<img src="img/banner_img.png" alt="">
							</div>
						</div>
					</div>
					<div class="single_banner_slider">
						<!-- part2 start -->
						<div class="row">
							<div class="col-lg-5 col-md-8">
								<div class="banner_text">
									<div class="banner_text_iner">
										<h1>12月最新商品</h1>
										<h3>
											三人座沙發
											<p>亞麻布／藍色／座椅長度114cm／座椅高度41cm</p>
										</h3>
										<a href="#" class="btn_2">立即購買</a>
									</div>
								</div>
							</div>
							<div class="banner_img d-none d-lg-block">
								<img src="img/banner_img.png" alt="">
							</div>
						</div>
					</div>
					<!-- part3 start -->
					<div class="single_banner_slider">
						<div class="row">
							<div class="col-lg-5 col-md-8">
								<div class="banner_text">
									<div class="banner_text_iner">
										<h1>12月最新商品</h1>
										<h3>
											三人座沙發
											<p>亞麻布／藍色／座椅長度114cm／座椅高度41cm</p>
										</h3>
										<a href="#" class="btn_2">立即購買</a>
									</div>
								</div>
							</div>
							<div class="banner_img d-none d-lg-block">
								<img src="img/banner_img.png" alt="">
							</div>
						</div>
					</div>
					<!-- <div class="single_banner_slider">
                            <div class="row">
                                <div class="col-lg-5 col-md-8">
                                    <div class="banner_text">
                                        <div class="banner_text_iner">
                                            <h1>Cloth $ Wood Sofa</h1>
                                            <p>Incididunt ut labore et dolore magna aliqua quis ipsum
                                                suspendisse ultrices gravida. Risus commodo viverra</p>
                                            <a href="#" class="btn_2">buy now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="banner_img d-none d-lg-block">
                                    <img src="img/banner_img.png" alt="">
                                </div>
                            </div>
                        </div> -->
				</div>
				<div class="slider-counter"></div>
			</div>
		</div>
	</div>
</section>
<!-- banner part start-->

<!-- feature_part start-->
<section class="feature_part padding_top">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="section_tittle text-center">
					<h2>精選設計專案</h2>
				</div>
			</div>
		</div>
		<div class="row align-items-center justify-content-center">
			<div class="col-lg-7 col-sm-6">
				<div class="single_feature_post_text">
					<p>主推專案-小家庭</p>
					<h3>溫馨豪華</h3>
					<a href="#" class="feature_btn">EXPLORE NOW <i
						class="fas fa-play"></i></a> <img src="img/feature/product2.png"
						alt="" height="80%">
				</div>
			</div>
			<div class="col-lg-5 col-sm-6">
				<div class="single_feature_post_text">
					<p>小資必備</p>
					<h3>簡約時尚風</h3>
					<a href="#" class="feature_btn">EXPLORE NOW <i
						class="fas fa-play"></i></a> <img src="img/feature/product1.png"
						alt="" height="70%">
				</div>
			</div>
			<!--                 <div class="col-lg-5 col-sm-6"> -->
			<!--                     <div class="single_feature_post_text"> -->
			<!--                         <p>精選傢俱</p> -->
			<!--                         <h3>Latest foam Sofa</h3> -->
			<!--                         <a href="#" class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a> -->
			<!--                         <img src="img/feature/feature_3.png" alt="" > -->
			<!--                     </div> -->
			<!--                 </div> -->
			<div class="col-lg-7 col-sm-6">
				<div class="single_feature_post_text">
					<p>奢華享受</p>
					<h3>華麗城堡</h3>
					<a href="#" class="feature_btn">EXPLORE NOW <i
						class="fas fa-play"></i></a> <img src="img/feature/product3.png"
						alt="" height="70%">
				</div>
			</div>
		</div>
	</div>
</section>
<!-- upcoming_event part start-->
<table border="1">
	<c:forEach items="${rtnList}" var="ListItem">
		<tr>
			<td>${ListItem.id}</td>
			<td>${ListItem.kind}</td>
			<td>${ListItem.brand}</td>
			<td>${ListItem.name}</td>
			<td>${ListItem.color}</td>
			<td>${ListItem.width}</td>
			<td>${ListItem.height}</td>
			<td>${ListItem.depth}</td>
			<td>${ListItem.weight}</td>
			<td>${ListItem.delivery}</td>
			<td>${ListItem.stock}</td>
			<td>${ListItem.date}</td>
		</tr>
	</c:forEach>
</table>
<!-- product_list start-->
<section class="product_list section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="section_tittle text-center">
					<h2>
						精選商品 <span>商城</span>
					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="product_list_slider owl-carousel">
					<div class="single_product_list_slider">
						<div class="row align-items-center justify-content-between">
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_1.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_2.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_3.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_4.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_5.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_6.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_7.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_8.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="single_product_list_slider">
						<div class="row align-items-center justify-content-between">
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_1.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_2.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_3.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_4.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_5.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_6.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_7.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="single_product_item">
									<img src="img/product/product_8.png" alt="">
									<div class="single_product_text">
										<h4>餐椅</h4>
										<h3>$150.00</h3>
										<a href="#" class="add_cart">+ 加入購物車<i class="ti-heart"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- product_list part start-->

<!-- awesome_shop start-->
<section class="our_offer section_padding">
	<div class="container">
		<div class="row align-items-center justify-content-between">
			<div class="col-lg-6 col-md-6">
				<div class="offer_img">
					<img src="img/offer_img.png" alt="">
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="offer_text">
					<h2 align="center">本週促銷商品</h2>
					<p align="center">6折優惠</p>
					<div class="date_countdown">
						<div id="timer">
							<div id="days" class="date"></div>
							<div id="hours" class="date"></div>
							<div id="minutes" class="date"></div>
							<div id="seconds" class="date"></div>
						</div>
					</div>
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="enter email address"
							aria-label="Recipient's username" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<a href="#" class="input-group-text btn_2" id="basic-addon2">馬上搶購</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- awesome_shop part start-->

<!-- product_list part start-->
<section class="product_list best_seller section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="section_tittle text-center">
					<h2>
						熱門商品 <span>商城</span>
					</h2>
				</div>
			</div>
		</div>
		<div class="row align-items-center justify-content-between">
			<div class="col-lg-12">
				<div class="best_product_slider owl-carousel">
					<div class="single_product_item">
						<img src="img/product/product_1.png" alt="">
						<div class="single_product_text">
							<h4>餐椅</h4>
							<h3>$155.00</h3>
						</div>
					</div>
					<div class="single_product_item">
						<img src="img/product/product_2.png" alt="">
						<div class="single_product_text">
							<h4>餐椅</h4>
							<h3>$150.00</h3>
						</div>
					</div>
					<div class="single_product_item">
						<img src="img/product/product_3.png" alt="">
						<div class="single_product_text">
							<h4>餐椅</h4>
							<h3>$150.00</h3>
						</div>
					</div>
					<div class="single_product_item">
						<img src="img/product/product_4.png" alt="">
						<div class="single_product_text">
							<h4>餐椅</h4>
							<h3>$150.00</h3>
						</div>
					</div>
					<div class="single_product_item">
						<img src="img/product/product_5.png" alt="">
						<div class="single_product_text">
							<h4>餐椅</h4>
							<h3>$150.00</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- product_list part end-->

<!-- subscribe_area part start-->
<section class="subscribe_area section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-7">
				<div class="subscribe_area_text text-center">
					<h5>訂閱涵潤</h5>
					<h2>掌握最新商品資訊</h2>
					<h3>促銷商品不錯過！</h3>
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="enter email address"
							aria-label="Recipient's username" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<a href="#" class="input-group-text btn_2" id="basic-addon2">訂閱</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--::subscribe_area part end::-->

<!-- subscribe_area part start-->
<section class="client_logo padding_top">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_1.png" alt="">
				</div>
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_2.png" alt="">
				</div>
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_3.png" alt="">
				</div>
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_4.png" alt="">
				</div>
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_5.png" alt="">
				</div>
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_3.png" alt="">
				</div>
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_1.png" alt="">
				</div>
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_2.png" alt="">
				</div>
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_3.png" alt="">
				</div>
				<div class="single_client_logo">
					<img src="img/client_logo/client_logo_4.png" alt="">
				</div>
			</div>
		</div>
	</div>
</section>
<!--::subscribe_area part end::-->

<jsp:include page="/WEB-INF/subviews/footer.jsp" />