<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<!-- Header start -->
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>	
<!-- Header end -->
<style>
hr.style-four {
    width:85%;
    height: 12px;
    border: 0;
    box-shadow: inset 0 12px 12px -12px rgba(0,0,0,0.5);
}

</style>

<body>

  <!--================Single Product Area =================-->
  <div class="product_image_area single_padding_top">
    <div class="container">
      <div class="row s_product_inner justify-content-between">
        <div class="col-lg-7 col-xl-7">
          <div class="product_slider_img">
            <div id="vertical">
            <c:forEach items="${SingleProduct}" var="Item">
              <div data-thumb="img/product/HRoomProduct/product_${Item.id}.png">
                <img src="img/product/HRoomProduct/product_${Item.id}.png" height="100%"/>
              </div>
              </c:forEach>
<!--               <div data-thumb="img/product/single-product/product_1.png"> -->
<!--                 <img src="img/product/single-product/product_1.png" /> -->
<!--               </div> -->
<!--               <div data-thumb="img/product/single-product/product_1.png"> -->
<!--                 <img src="img/product/single-product/product_1.png" /> -->
<!--               </div> -->
<!--               <div data-thumb="img/product/single-product/product_1.png"> -->
<!--                 <img src="img/product/single-product/product_1.png" /> -->
<!--               </div> -->
            </div>
          </div>
        </div>
        <div class="col-lg-5 col-xl-4">
          <div class="s_product_text">
          <c:forEach items="${SingleProduct}" var="Item">
            <h3>${Item.name}</h3>
            <h2>$ <span>${Item.cost}</span></h2>
            <input type="hidden" name="productId" class="productId" value="${Item.id}">
            <ul class="list">
              <li>                
                  <span>品牌：${Item.brand}</span><span> | ${Item.color}</span>
              </li>
              <li>
                <span class="active">庫存：${Item.stock}</span>
              </li>
            </ul>
            <p>
              ${Item.description}
            </p>
            </c:forEach>
            <div class="card_area d-flex justify-content-between align-items-center">
              <div class="product_count">
                <span class="inumber-decrement"> <i class="ti-minus"></i></span>
                <input class="input-number" type="text" value="1" min="0" max="10">
                <span class="number-increment"> <i class="ti-plus"></i></span>
              </div>
              <a href="#" class="btn_3 add_cart">加入購物車</a>
              <a class="like_us"> <i class="ti-heart"></i> </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--================End Single Product Area =================-->
<hr class="style-four">
  <!--================Product Description Area =================-->
  <section class="product_description_area">
    <div class="container">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
            aria-selected="true" >商品描述</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
            aria-selected="false" >商品規格</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
          <p>
            &emsp;&emsp;Beryl Cook is one of Britain’s most talented and amusing artists
            .Beryl’s pictures feature women of all shapes and sizes enjoying
            themselves .Born between the two world wars, Beryl Cook eventually
            left Kendrick School in Reading at the age of 15, where she went
            to secretarial school and then into an insurance office. After
            moving to London and then Hampton, she eventually married her next
            door neighbour from Reading, John Cook. He was an officer in the
            Merchant Navy and after he left the sea in 1956, they bought a pub
            for a year before John took a job in Southern Rhodesia with a
            motor company. Beryl bought their young son a box of watercolours,
            and when showing him how to use it, she decided that she herself
            quite enjoyed painting. John subsequently bought her a child’s
            painting set for her birthday and it was with this that she
            produced her first significant work, a half-length portrait of a
            dark-skinned lady with a vacant expression and large drooping
            breasts. It was aptly named ‘Hangover’ by Beryl’s husband and
          </p>
          <p>
            &emsp;&emsp;It is often frustrating to attempt to plan meals that are designed
            for one. Despite this fact, we are seeing more and more recipe
            books and Internet websites that are dedicated to the act of
            cooking for one. Divorce and the death of spouses or grown
            children leaving for college are all reasons that someone
            accustomed to cooking for more than one would suddenly need to
            learn how to adjust all the cooking practices utilized before into
            a streamlined plan of cooking that is more efficient for one
            person creating less
          </p>
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
          <div class="table-responsive">
            <table class="table">
              <tbody>
              <c:forEach items="${SingleProduct}" var="Item">
                <tr>
                  <td>
                    <h5>寬度</h5>
                  </td>
                  <td>
                    <h5>${Item.width}</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>高度</h5>
                  </td>
                  <td>
                    <h5>${Item.height}</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>長度</h5>
                  </td>
                  <td>
                    <h5>${Item.depth}</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>重量</h5>
                  </td>
                  <td>
                    <h5>${Item.weight}</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>目前庫存</h5>
                  </td>
                  <td>
                    <h5>${Item.stock}</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>訂單交期</h5>
                  </td>
                  <td>
                    <h5>${Item.delivery} 天</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>適用宅配</h5>
                  </td>
                  <td>
                    <h5>適用</h5>
                  </td>
                </tr>
                <tr>
                  <td>
                    <h5>鑑賞期</h5>
                  </td>
                  <td>
                    <h5>7 天</h5>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End Product Description Area =================-->

  <!-- product_list part start-->
<!--   <section class="product_list best_seller"> -->
<!--     <div class="container"> -->
<!--       <div class="row justify-content-center"> -->
<!--         <div class="col-lg-12"> -->
<!--           <div class="section_tittle text-center"> -->
<!--             <h2>熱銷商品 <span>商城</span></h2> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="row align-items-center justify-content-between"> -->
<!--         <div class="col-lg-12"> -->
<!--           <div class="best_product_slider owl-carousel"> -->
<%-- 					<c:forEach items="${popularList}" var="popularItem" --%>
<%--  						varStatus="status"> --%>
<!-- 						<div class="single_product_item"> -->
<%--  							<h4 style="color: red">Top ${status.count}</h4> --%>
<%-- 							<img src="img/product/HRoomProduct/product_${popularItem.id}.png" --%>
<!--  								alt=""> -->
<!--  							<div class="single_product_text"> -->
<%--  								<h4>${popularItem.name}</h4>  --%>
<%--  								<h3>$ ${popularItem.cost}</h3> --%>
<!-- 								<a class="add_cart">+ 加入購物車<i class="ti-heart"></i></a> <input -->
<%-- 									type="hidden" class="productId" value="${popularItem.id}"> --%>
<!--  									<a class="check-product" href="defaultSingleProduct.html">商品詳細資訊</a> -->
<!-- 							</div>  -->
<!--  						</div>  -->
<%--  					</c:forEach>  --%>
<!--            </div> -->
<!--          </div> -->
<!--        </div> -->
<!--     </div>  -->
<!--    </section>  -->
  <!-- product_list part end-->

  <!--::footer_part start::-->
  <jsp:include page="/WEB-INF/subviews/footer.jsp" />
  <!--::footer_part end::-->
  <script>
	  $("#home-tab").click();
</script>
</body>

</html>