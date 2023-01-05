package com.example.demo.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.sql.Date;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Order {
	private int id;
	private Date orderTime;
	private double amount;
	private String receiver;
	private String receiverPhone;
	private String receiverEmail;
	private String city;
	private String county;
	private String zipcode;
	private String address;
	private String info;
	private int parmentMethod;
	private int paystate;
	private int memberId;
	private int shipping;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getReceiverEmail() {
		return receiverEmail;
	}
	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getParmentMethod() {
		return parmentMethod;
	}
	public void setParmentMethod(int parmentMethod) {
		this.parmentMethod = parmentMethod;
	}
	public int getPaystate() {
		return paystate;
	}
	public void setPaystate(int paystate) {
		this.paystate = paystate;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}

	@Override
	public String toString() {
		return "Order{" +
				"id=" + id +
				", orderTime=" + orderTime +
				", amount=" + amount +
				", receiver='" + receiver + '\'' +
				", receiverPhone='" + receiverPhone + '\'' +
				", receiverEmail='" + receiverEmail + '\'' +
				", city='" + city + '\'' +
				", county='" + county + '\'' +
				", zipcode='" + zipcode + '\'' +
				", address='" + address + '\'' +
				", info='" + info + '\'' +
				", parmentMethod=" + parmentMethod +
				", paystate=" + paystate +
				", memberId=" + memberId +
				", shipping=" + shipping +
				'}';
	}
}
