<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>	
  <!--================ confirmation part start =================-->

<section class="confirmation_part padding_top">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-lx-4 orderInfo">

        </div>
        <div class="col-lg-6 col-lx-4 memberInfo">

        </div>
        <div class="col-lg-6 col-lx-4 receiverInfo">

        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="order_details_iner">
            <h3>訂單明細</h3>
            <table class="table table-borderless">
              <thead>
                <tr>
                  <th scope="col" colspan="2">產品</th>
                  <th scope="col">數量</th>
                  <th scope="col">價格</th>
                </tr>
              </thead>
              <tbody>

              </tbody>
              <tfoot>

              </tfoot>
            </table>
          </div>
        </div>
      </div>
    </div>
    <input id="orderId" name="orderId" value="${param.orderId}" hidden>
  </section>
  <!--================ confirmation part end =================-->

 <jsp:include page="/WEB-INF/subviews/footer.jsp"/>
 <script src="js/order_items.js"></script>