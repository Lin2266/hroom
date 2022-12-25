<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>
<div class="container">
  <section class="mt-4">
  <div class="row">
    <div class="col-12">
      <h2 class="contact-title">聯絡客服</h2>
    </div>
    <div class="col-lg-8">
      <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm"
            novalidate="novalidate">
        <div class="row">
          <div class="col-12">
            <div class="form-group">

                  <textarea class="form-control w-100" name="message" id="message" cols="30" rows="9"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '訊息'"
                            placeholder='訊息'></textarea>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group">
              <input class="form-control" name="name" id="name" type="text" onfocus="this.placeholder = ''"
                     onblur="this.placeholder = '姓名'" placeholder='姓名'>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group">
              <input class="form-control" name="email" id="email" type="email" onfocus="this.placeholder = ''"
                     onblur="this.placeholder = '信箱'" placeholder='信箱'>
            </div>
          </div>
          <div class="col-12">
            <div class="form-group">
              <input class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''"
                     onblur="this.placeholder = 'Enter Subject'" placeholder='主旨'>
            </div>
          </div>
        </div>
        <div class="form-group mt-3 contact-sendbtn">
          <a href="#" class="btn_3 button-contactForm">寄出訊息</a>
        </div>
      </form>
    </div>
    <div class="col-lg-4">
      <div class="media contact-info">
        <span class="contact-info__icon"><i class="ti-home"></i></span>
        <div class="media-body">
          <h3>新北市汐止區</h3>
          <p>新台五路一段93號32樓</p>
        </div>
      </div>
      <div class="media contact-info">
        <span class="contact-info__icon"><i class="ti-tablet"></i></span>
        <div class="media-body">
          <h3>886-2-7745-8888</h3>
          <p>週一至週五上午 9 點至下午 6 點</p>
        </div>
      </div>
      <div class="media contact-info">
        <span class="contact-info__icon"><i class="ti-email"></i></span>
        <div class="media-body">
          <h3>support@WistronITS.com</h3>
          <p>歡迎寄信與我們聯絡</p>
        </div>
      </div>
    </div>
  </div>
  </section>
</div>

  <!-- ================ contact section end ================= -->

  <!--::footer_part start::-->
<jsp:include page="/WEB-INF/subviews/footer.jsp"/>