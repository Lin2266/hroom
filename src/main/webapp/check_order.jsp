<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>

  <div class="container check_order">
    <table class="table table-striped table-hover">
      <thead>
      <tr>
        <th scope="col">No.</th>
        <th scope="col">訂購時間</th>
        <th scope="col">付款方式</th>
        <th scope="col">總金額</th>
        <th scope="col">處理狀態</th>
        <th scope="col">檢視</th>
      </tr>
      </thead>
      <tbody>

      </tbody>
    </table>

  </div>

<jsp:include page="/WEB-INF/subviews/footer.jsp"/>
<script src="js/check_order.js"></script>