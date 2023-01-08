package com.example.demo.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class OrderItems {
	private int id;
	private int quantity;
	private int orderId;
	private ProductBean products;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public ProductBean getProducts() {
		return products;
	}
	public void setProducts(ProductBean products) {
		this.products = products;
	}


	@Override
	public String toString() {
		return "OrderItems{" +
				"id=" + id +
				", quantity=" + quantity +
				", orderId=" + orderId +
				", products=" + products +
				'}';
	}
}
