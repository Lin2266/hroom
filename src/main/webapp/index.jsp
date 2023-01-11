<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<style>
.productBtn {
	background-color: white;
	border: none;
	color: #797979;
	text-transform: uppercase;
	font-size: 18px;
	font-weight: 500;
	display: block;
	margin-top: 10px;
}

#bg-video {
	min-width: 100%;
	min-height: 100%;
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
}
</style>
<section class="banner_part">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<div class="banner_slider owl-carousel">
					<!-- part1 start -->
					<div class="single_banner_slider">
						<video autoplay muted loop id="bg-video"
							style="padding-left: 2px; padding-right: 2px;">
							<source src="img/HamRu.mp4" type="video/mp4" />
						</video>
					</div>
					<!-- part2 start -->
					<div class="single_banner_slider">
						<div class="row">
							<div class="col-lg-5 col-md-8">
								<div class="banner_text">
									<div class="banner_text_iner">
										<h1
											style="font-family: '微軟正黑體', sans-serif; font-size: 2.5rem; background: -webkit-linear-gradient(16deg, #ff005a 0%, #ff5d2d 64%, #ffba00 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">12月新品上市</h1>
										<h3>
											三人座沙發
											<p>亞麻布／藍色／座椅長度114cm／座椅高度41cm</p>
										</h3>
										<form action="SingleProductServlet?method=SingleProduct1" method="POST">
				                     	<Input type="submit" class="btn_2" value="立即購買" style="border:none;">
				                    	</form >
<!-- 										<a -->
<!-- 											href="http://localhost:8080/hroom/SingleProductServlet?method=SingleProduct1" -->
<!-- 											class="btn_2">立即購買</a> -->
									</div>
								</div>
							</div>
							<div class="banner_img d-none d-lg-block">
								<img src="img/banner_img.png" alt="" style="padding-right: 2px;">
							</div>
						</div>
					</div>
					<!-- part3 start -->
					<div class="single_banner_slider">
						<div class="row">
							<div class="col-lg-5 col-md-8">
								<div class="banner_text">
									<div class="banner_text_iner">
										<h1
											style="font-family: '微軟正黑體', sans-serif; font-size: 2.5rem; background: -webkit-linear-gradient(16deg, #ff005a 0%, #ff5d2d 64%, #ffba00 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">客製化設計</h1>
										<h4>涵潤設計師到府評估，與您共同討論設計需求</h4>
										<br> <br> <br> <br> 
										<a class="btn_2"
											id="btn_20" style="color: white;">客製化設計</a>
									</div>
								</div>
							</div>
							<div class="banner_img d-none d-lg-block">
								<img src="img/product/blog/post-img2.jpg"
									style="padding-right: 180px;">
							</div>
						</div>
					</div>
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
			<div class="col-lg-5 col-sm-6">
				<div class="single_feature_post_text">
					<p>主推專案-小家庭</p>
					<h3>溫馨豪華</h3>
					<form action="SingleProductServlet?method=SingleProject2"
						method="POST">
						<Input type="submit" class="feature_btn" value="EXPLORE NOW"
							Style="background-color: transparent; border: none;">
					</form>
					<img src="img/feature/product2.png" alt="" height="80%">
				</div>
			</div>
			<div class="col-lg-5 col-sm-6">
				<div class="single_feature_post_text">
					<p>小資必備</p>
					<h3>簡約時尚風</h3>
					<form action="SingleProductServlet?method=SingleProject1"
						method="POST">
						<Input type="submit" class="feature_btn" value="EXPLORE NOW"
							Style="background-color: transparent; border: none;">
					</form>
					<img src="img/feature/product1.png" alt="" height="70%">
				</div>
			</div>
			<div class="col-lg-6 col-sm-6">
				<div class="single_feature_post_text">
					<p>奢華享受</p>
					<h3>華麗城堡</h3>
					<form action="SingleProductServlet?method=SingleProject3"
						method="POST">
						<Input type="submit" class="feature_btn" value="EXPLORE NOW"
							Style="background-color: transparent; border: none;">
					</form>
					<!-- 					<a -->
					<!-- 						href="http://localhost:8080/hroom/SingleProductServlet?method=SingleProject3" -->
					<!-- 						class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a> -->
					<img src="img/feature/product3.png" alt="" height="80%">
				</div>
			</div>
		</div>
	</div>
</section>
<!-- upcoming_event part start-->
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
					<c:forEach items="${rtnList}" var="ListItem" varStatus="status">
						<div class="single_product_item">
							<span style="color: #ff3368;">Top ${status.count}</span> <img
								src="img/product/HRoomProduct/product_${ListItem.id}.png" alt="">
							<div class="single_product_text">
								<h4>${ListItem.name}</h4>
								<h3>
									$ <span>${ListItem.cost}</span>
								</h3>
								<a class="add_cart">+ 加入購物車<i class="ti-heart"></i></a> <input
									type="hidden" name="productId" class="productId"
									value="${ListItem.id}"> <input type="hidden"
									name="productCost" class="productCost"
									value="${ListItem.stock}">
								<form action="SingleProductServlet?method=SingleProduct"
									method="POST">
									<input class="productBtn" type="submit" value="商品詳細資訊">
									<input type="hidden" name="SentproductId"
										value="${ListItem.id}">
								</form>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>
</section>

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
					<h2
						style="font-family: '微軟正黑體', sans-serif; font-size: 3.0rem; font-weight: bold; color: #2F4F4F;">本月促銷商品</h2>
					<h5>
						<span style="color: red">下殺&darr;</span>6折優惠
					</h5>
					<div class="date_countdown">
						<div id="timer">
							<div id="days" class="date"></div>
							<div id="hours" class="date"></div>
							<div id="minutes" class="date"></div>
							<div id="seconds" class="date"></div>
						</div>
					</div>
					<div class="input-group">
						<div class="input-group-append">
					<form action="SingleProductServlet?method=SingleProduct2" method="POST">
					<Input type="submit" class="input-group-text btn_2" id="basic-addon2" value="馬上搶購">
					</form >
<!-- 							<a -->
<!-- 								href="http://localhost:8080/hroom/SingleProductServlet?method=SingleProduct2" -->
<!-- 								class="input-group-text btn_2" id="basic-addon2">馬上搶購</a> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


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
				<h3>本網頁僅練習使用，參考網站與圖檔分享來自於:</h3>
				<a href="https://ciaocasa.com.tw/projects/link3lgkv8fj">巧寓舍計 :
					https://ciaocasa.com.tw/projects/link3lgkv8fj</a><br> <a
					href="https://www.wood-house.com.tw/">原木工坊 :
					https://www.wood-house.com.tw/</a><br> <a
					href="https://www.junpindesign.com/">郡品室內設計 :
					https://www.junpindesign.com/</a><br> <a
					href="https://www.ikea.com.tw/zh">IKea :
					https://www.ikea.com.tw/zh</a><br> <a
					href="https://www.nitori-net.tw/">宜得利 :
					https://www.nitori-net.tw/</a><br> <a
					href="https://www.lifewarehouse.net/">生活倉庫 :
					https://www.lifewarehouse.net/</a><br> <a
					href="https://www.pexels.com/zh-tw/">Pexels素材:
					https://www.pexels.com/zh-tw/</a><br> <a
					href="https://www.88tph.com/">88素材 : https://www.88tph.com/</a><br>
				<a href="https://zh.pngtree.com/">PNG素材 :
					https://zh.pngtree.com/</a><br> <a href="https://616pic.com/">616素材
					: https://616pic.com/</a><br>
			</div>
		</div>
	</div>
</section>
<!--::subscribe_area part end::-->
<script>
	document.getElementById("btn_20").addEventListener("click", function() {
		window.scrollTo(0, 600);
	});
</script>
<jsp:include page="/WEB-INF/subviews/footer.jsp" />