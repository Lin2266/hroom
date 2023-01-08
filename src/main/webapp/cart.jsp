<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="accountId" scope="session" value="${sessionScope.user.id}"/>
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
                <th scope="col">商品</th>
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
                    <h5 class="shipping"></h5>
                  </li>
                </ul>
              </td>
            </tr>
            <tr class="bottom_button">
              <td>
                <a class="btn_1" id="updateCart" href="#">修改購物車</a>
              </td>
              <td>
                <a class="btn_1" href="${pageContext.request.contextPath}/defaultCategory.html">繼續購物</a>
              </td>
              <td></td>
              <td></td>
              <td >
                  <a class="btn_1" id="checkOut" href='${pageContext.request.contextPath}${accountId ne null ? "/order.jsp":"/login.jsp"}'>進行結帳</a>
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
