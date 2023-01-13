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
<%--             </c:forEach> --%>
           <c:if test="${Item.stock != 0}">
            <div class="card_area d-flex justify-content-between align-items-center">
              <div class="product_count">
                <span class="inumber-decrement"> <i class="ti-minus"></i></span>
                <input class="input-number" type="text" value="1" min="1" max="${Item.stock}">
                <span class="number-increment"> <i class="ti-plus"></i></span>
              </div>
              <a href="#" class="btn_3 add_cart">加入購物車</a>
              <a class="like_us"> <i class="ti-heart"></i> </a>
            </div>
            </c:if>
            <c:if test="${Item.stock == 0}">
              <p>很抱歉，目前商品尚無庫存</p>
              <a href="defaultCategory.html" class="btn_3">繼續購物</a>
              </c:if>
            </c:forEach>
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
            &emsp;&emsp;一張好的彈簧床是由優質材料製成的支撐又舒適的床墊，同時具備一組堅固的框架和一組強大的線圈系統，
            提供良好的支撐和運動隔離。床墊層透氣度為世界級，鋪上一層冷卻層，以幫助調節體溫。 此商品不含床罩組，建議瀏覽本商場商品一同加購。
          </p><br>
          <p>
            &emsp;&emsp;城堡風格是十分豪華的，享受奢華和富裕的榮耀。 材料使用天鵝絨和絲綢等豐富的面料凸顯獨特品味。 華麗的家具，如雕刻的椅子和桌子，一進門即感受到富麗堂皇的氛圍。 牆壁上應懸掛大型掛毯和繪畫，以增添歷史感和宏偉感。 
            設計枝形吊燈和其他照明設備營造溫馨宜人的氣息。 地板鋪上高級的地毯和地毯，以增加舒適和溫暖的感覺。溫馨家庭設計以舒適和溫暖為主。 從暖色調的中性調色板開始，例如米色、灰褐色和奶油色。 使用木材、石材和羊毛等天然材料添加紋理。 
            搭配舒適的家具，例如豪華沙發、扶手椅和腳凳。 懸掛家庭照片和旅遊照片以個性化空間。 添加一些裝飾物，例如彩色地毯、抱枕和一些植物，為房間增添生機。 結合頭頂照明、任務照明和重點照明，在照明上分層，營造溫馨誘人的氛圍。
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