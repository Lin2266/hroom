<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>
  <!--================Checkout Area =================-->
  <section class="checkout_area padding_top">
    <div class="container">
      <div class="billing_details">
        <div class="row">
          <div class="col-lg-8">
            <div class="row">
              <h3>購買人資料</h3>
            </div>

<%--            <form class="row contact_form">--%>
              <div class="row payer">
                <div class="col-md-6 form-group p_star">
                  <input type="text" class="form-control" id="name" name="name" placeholder="姓名"  value="${sessionScope.user.member.name}" readonly/>
                </div>
                <div class="col-md-6 form-group p_star">
                  <input type="text" class="form-control" id="phone" name="phone" placeholder="電話" value="${sessionScope.user.member.phone}" readonly/>
                </div>
                <div class="col-md-12 form-group p_star">
                  <input type="text" class="form-control" id="email" name="email" placeholder="信箱" value="${sessionScope.user.member.email}" readonly/>
                </div>
                <div class="col-md-12 form-group">
                  <div id="twzipcode">
                    <input id="city" value="${sessionScope.user.member.city}" hidden>
                    <input id="county" value="${sessionScope.user.member.county}" hidden>
                  </div>
                </div>
                <div class="col-md-12 form-group p_star">
                  <input type="text" class="form-control" id="address" name="address" placeholder="地址" value="${sessionScope.user.member.address}" readonly/>
                </div>
                <div class="col-md-12 form-group p_star">
                   <label>付費方式</label>
                   <div class="pay col-md-12 form-group p_star">
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="0" checked>
                      <label class="form-check-label" for="creditCard">
                          信用卡
                      </label>
                    </div>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="paymentMethod" id="cashOnDelivery" value="1">
                      <label class="form-check-label" for="cashOnDelivery">
                          貨到付款
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group p_star">
                  <input type="checkbox" id="checkReceiver" name="checkReceiver" />
                   <label for="checkReceiver">收貨人與購買人不同請勾選，並填妥以下資料</label>
                </div>
              </div>
              <div class="open-close-address">
                <div class="row addressee">
                  <div class="col-md-6 form-group p_star">
                    <input type="text" class="form-control" id="receiver" name="receiver" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = '姓名'" placeholder="姓名"/>
                  </div>
                  <div class="col-md-6 form-group p_star">
                    <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = '電話'" placeholder="電話"/>
                  </div>
                  <div class="col-md-12 form-group p_star">
                    <input type="text" class="form-control" id="receiverEmail" name="receiverEmail" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = '信箱'" placeholder="信箱"/>
                  </div>
                  <div class="col-md-12 form-group">
                  	<div id="twzipcode2"></div>
                  </div>
                  <div class="col-md-12 form-group p_star">
                    <input type="text" class="form-control" id="receiverAddress" name="receiverAddress" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = '地址'" placeholder="地址"/>
                  </div>
                </div>
              </div>

              <div class="row message">
                <div class="col-md-12 form-group">
                  <textarea class="form-control" name="info" id="info" rows="3" onfocus="this.placeholder = ''"
                            onblur="this.placeholder = '備註'" placeholder="備註"></textarea>
                </div>
                <button id="OrderSub" class="btn_3">送出</button>
              </div>
              
<%--            </form>--%>
          </div>
          <div class="col-lg-4">
            <div class="order_box">
              <input id="shipping" value="${param.shipping}" hidden>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--================End Checkout Area =================-->
  <!--::footer_part start::-->
  <jsp:include page="/WEB-INF/subviews/footer.jsp"/>
  <script src="js/order.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.js"></script>