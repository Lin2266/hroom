<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


            </tbody>
            <tfoot>
            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td>
                <h5>小計</h5>
              </td>
              <td>
                <h5 class="subTotal"></h5>
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
                <a class="btn_1" id="updateCart" href="#">修改購物車</a>
              </td>
              <td>
                <a class="btn_1" href="${pageContext.request.contextPath}/category.jsp">繼續購物</a>
              </td>
              <td></td>
              <td></td>
              <td>
                  <a class="btn_1" href='${pageContext.request.contextPath}${sessionScope.user.account ne null ? "/order.jsp":"/login.jsp"}'>進行結帳</a>
              </td>
            </tr>
            </tfoot>
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
