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
            <h3>購買人資料</h3>
            <form class="row contact_form" action="#" method="post">
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="name" name="name" required/>
                <span class="placeholder" data-placeholder="姓名"></span>
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="phone" name="phone" required/>
                <span class="placeholder" data-placeholder="電話"></span>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="email" name="email" required/>
                <span class="placeholder" data-placeholder="信箱"></span>
              </div>
              <div class="col-md-4 form-group p_star">
                <select class="country_select">
                  <option value="1">縣市</option>
                  <option value="2"></option>
                </select>
              </div>
              <div class="col-md-4 form-group p_star">
                <select class="country_select">
                  <option value="1">鄉鎮市區</option>
                  <option value="2"></option>
                </select>
              </div>
              <div class="col-md-4 form-group p_star">
                <input type="text" class="form-control circle" id="zip" name="zip" value="" disabled required/>
                <span class="placeholder" data-placeholder="郵遞區號"></span>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="add" name="add" required/>
                <span class="placeholder" data-placeholder="地址"></span>
              </div>
              <div class="col-md-12 form-group p_star">
                 <label for="f-option3">付費方式</label>
                 <div class="pay col-md-12 form-group p_star">
		              <div class="form-check form-check-inline">
								  	<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
								  	<label class="form-check-label" for="exampleRadios1">
								    		信用卡
								  	</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
									  <label class="form-check-label" for="exampleRadios2">
									    	帳戶轉帳
									  </label>
									</div>
								</div>
              </div>
              
              <div class="col-md-12 form-group p_star">
                <input type="checkbox" id="f-option3" name="selector" />
                 <label for="f-option3">收貨人與購買人不同請勾選，並填妥以下資料</label>
              </div>
               <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="name" name="name" required/>
                <span class="placeholder" data-placeholder="姓名"></span>
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="phone" name="phone" required/>
                <span class="placeholder" data-placeholder="電話"></span>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="email" name="email" required/>
                <span class="placeholder" data-placeholder="信箱"></span>
              </div>
              <div class="col-md-4 form-group p_star">
                <select class="country_select">
                  <option value="1">縣市</option>
                  <option value="2"></option>
                </select>
              </div>
              <div class="col-md-4 form-group p_star">
                <select class="country_select">
                  <option value="1">鄉鎮市區</option>
                  <option value="2"></option>
                </select>
              </div>
              <div class="col-md-4 form-group p_star">
                <input type="text" class="form-control circle" id="zip" name="zip" value="" disabled required/>
                <span class="placeholder" data-placeholder="郵遞區號"></span>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="add" name="add" required/>
                <span class="placeholder" data-placeholder="地址"></span>
              </div>
              <div class="col-md-12 form-group">
                <textarea class="form-control" name="message" id="message" rows="1"
                  placeholder="備註"></textarea>
              </div>
              <button class="btn_3" type="submit">送出</button>
            </form>
          </div>
          <div class="col-lg-4">
            <div class="order_box">
              <h2>您的訂單</h2>
              <ul class="list">
                <li>
                  <a href="#">產品
                    <span>價格</span>
                  </a>
                </li>
                <li>
                  <a href="#">Fresh Blackberry
                    <span class="middle">x 02</span>
                    <span class="last">$720.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">Fresh Tomatoes
                    <span class="middle">x 02</span>
                    <span class="last">$720.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">Fresh Brocoli
                    <span class="middle">x 02</span>
                    <span class="last">$720.00</span>
                  </a>
                </li>
              </ul>
              <ul class="list list_2">
                <li>
                  <a href="#">小計
                    <span>$2160.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">運費
                    <span>$50.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">總額
                    <span>$2210.00</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->

  <!--::footer_part start::-->
  <jsp:include page="/WEB-INF/subviews/footer.jsp"/>