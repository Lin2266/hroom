<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- breadcrumb start-->
	
	<%   
  String uri = request.getRequestURI();   
  uri = uri.substring(uri.lastIndexOf("/")+1);   
  
  if("order.jsp".equals(uri)){
	  uri = "商品結帳";
  }else if("order_items.jsp".equals(uri)){
	  uri = "訂單明細";
  }else if("tracking.jsp".equals(uri)){
	  uri = "追蹤訂單";
  }else if("contact.jsp".equals(uri)){
      uri = "聯繫我們";
  }else if("category.jsp".equals(uri)){
      uri = "商品分類";
  }else if("cart.jsp".equals(uri)){
      uri = "購物車";
  }
  %>  
  
<nav class="breadcrumb">
	<a class="breadcrumb-item" href="./index.jsp">首頁</a> 
	<span	class="breadcrumb-item active"><%= uri %></span>
</nav>