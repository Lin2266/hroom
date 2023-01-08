<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>

<section class="tracking_box_area padding_top">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-12">
        <div class="tracking_box_inner">
          <p>要追蹤您的訂單進度請在下面輸入您的訂單ID跟信箱。</p>
          <form class="row tracking_form" action="#" method="post" novalidate="novalidate">
            <div class="col-md-12 form-group">
              <input type="text" class="form-control" id="order" name="order" placeholder="訂單ID">
            </div>
            <div class="col-md-12 form-group">
              <input type="email" class="form-control" id="email" name="email" placeholder="信箱">
            </div>
            <div class="col-md-12 form-group">
              <button type="submit" value="submit" class="btn_3">確定</button>
            </div>
          </form>
        </div>
      </div>

    </div>

  </div>
</section>

<jsp:include page="/WEB-INF/subviews/footer.jsp"/>
