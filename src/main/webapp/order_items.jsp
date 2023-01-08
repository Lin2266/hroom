<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>	
  <!--================ confirmation part start =================-->
  <section class="confirmation_part padding_top">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>訂單訊息</h4>
            <ul>
              <li>
                <p>訂單編號:</p><span>60235</span>
              </li>
              <li>
                <p>日期:</p><span>Oct 03, 2017</span>
              </li>
              <li>
                <p>總額:</p><span>USD 2210</span>
              </li>
              <li>
                <p>付款方式:</p><span>信用卡</span>
              </li>
              <li>
                <p>備註:</p><span>111</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>購買人訊息:</h4>
            <ul>
              <li>
                <p>購買人:</p><span>jerry</span>
              </li>
              <li>
                <p>縣市:</p><span>新北市</span>
              </li>
              <li>
                <p>鄉鎮市區:</p><span>汐止區</span>
              </li>
              <li>
                <p>巷弄:</p><span>新台五路一段1號</span>
              </li>
              <li>
                <p>郵遞區號:</p><span>36952</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>收件人訊息</h4>
            <ul>
              <li>
                <p>收件人:</p><span>Marry</span>
              </li>
              <li>
                <p>縣市:</p><span>新北市</span>
              </li>
              <li>
                <p>鄉鎮市區:</p><span>汐止區</span>
              </li>
              <li>
                <p>巷弄:</p><span>新台五路一段1號</span>
              </li>
              <li>
                <p>郵遞區號:</p><span>36952</span>
              </li>
            </ul>
          </div>
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
                <tr>
                  <th colspan="2"><span>Pixelstore fresh Blackberry</span></th>
                  <th>x02</th>
                  <th> <span>$720.00</span></th>
                </tr>
                <tr>
                  <th colspan="2"><span>Pixelstore fresh Blackberry</span></th>
                  <th>x02</th>
                  <th> <span>$720.00</span></th>
                </tr>
                <tr>
                  <th colspan="2"><span>Pixelstore fresh Blackberry</span></th>
                  <th>x02</th>
                  <th> <span>$720.00</span></th>
                </tr>
                <tr>
                  <th colspan="3">小計</th>
                  <th> <span>$2160.00</span></th>
                </tr>
                <tr>
                  <th colspan="3">運費</th>
                  <th> <span>$50.00</span></th>
                </tr>
              </tbody>
              <tfoot>
                <tr>
                  <th scope="col" colspan="3">總額</th>
                  <th scope="col">$2210.00</th>
                </tr>
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