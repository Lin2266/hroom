<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- breadcrumb start-->
	
	<%   
  String uri = request.getRequestURI(); 
  uri = uri.substring(uri.lastIndexOf("/")+1);
  String second = "";
  String secondName = "";
  String secondUri = "";
  
  if("order.jsp".equals(uri)){
	  uri = "商品結帳";
      second = "y";
      secondName = "購物車";
      secondUri = "cart.jsp";
  }else if("order_items.jsp".equals(uri)){
	  uri = "訂單明細";
      second = "y";
      secondName = "訂單查詢";
      secondUri = "check_order.jsp";
  }else if("check_order.jsp".equals(uri)){
	  uri = "訂單查詢";
  }else if("contact.jsp".equals(uri)){
      uri = "聯繫我們";
  }else if("category.jsp".equals(uri)){
      uri = "商品分類";
  }else if("cart.jsp".equals(uri)){
      uri = "購物車";
  }else if("single-product.jsp".equals(uri)){
      uri = "商品資訊";
      second = "y";
      secondName = "商品分類";
      secondUri = "category.jsp";
  }    
  %>  
  
<nav class="breadcrumb">
	<a class="breadcrumb-item" href="${pageContext.request.contextPath}/index.jsp">首頁</a>
	<%if (second == "y") {%>
	<a class="breadcrumb-item" href="${pageContext.request.contextPath}/<%= secondUri %>"><%= secondName %></a>
	<%} %>  
	<span	class="breadcrumb-item active"><%= uri %></span>
</nav>