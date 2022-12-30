<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

<!-- Header start -->
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<!-- Header end -->
  <!--================Home Banner Area =================-->
  <!-- breadcrumb start-->
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>
<!--================Cart Area =================-->
  <section class="cart_area padding_top">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th></th>
                <th scope="col">產品</th>
                <th scope="col">單價</th>
                <th scope="col">數量</th>
                <th scope="col">總計</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <div class="d-flex">
                    <img src="img/product/single-product/cart-1.jpg" alt="" />
                  </div>
                </td>
                <td>
                  <div class="media-body">
                    <p>Minimalistic shop for multipurpose use</p>
                  </div>
                <td>
                  <h5>$360.00</h5>
                </td>
                <td>
                  <div class="form-outline">
                    <input type="number" id="typeNumber" class="form-control" value="1" min="1" max="10"/>
                  </div>
                </td>
                <td class="total">
                  <h5>$720.00</h5>
                </td>
                <td>
                  <button type="button" class="deleteBtn" title="刪除">X</button>
                </td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>
                  <h5>小計</h5>
                </td>
                <td>
                  <h5>$2160.00</h5>
                </td>
              </tr>
              <tr class="shipping_area">
                <td></td>
                <td></td>
                <td></td>
                <td>
                  <h5>運費</h5>
                </td>
                <td>
                  <ul class="list">
                    <li>
                      <a href="#">免運費</a>
                    </li>
                  </ul>
                </td>
              </tr>
              <tr class="bottom_button">
                <td>
                  <a class="btn_1" href="#">繼續購物</a>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <a class="btn_1" href="#">進行結帳</a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        </div>
      </div>
  </section>
  <!--================End Cart Area =================-->

  <!--::footer_part start::-->
	<jsp:include page="/WEB-INF/subviews/footer.jsp"/>
  <!--::footer_part end::-->

  <!-- jquery plugins here-->
  <!-- jquery -->
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
