package com.niit.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
	private Integer orderId;

	private Integer userId;

	private Date orderStartTime;

	private Date orderEndTime;

	private Integer orderStatus;

	private String orderCode;

	private String orderUserTele;
	
	public String getOrderUserTele() {
		return orderUserTele;
	}

	public void setOrderUserTele(String orderUserTele) {
		this.orderUserTele = orderUserTele;
	}

	public String getOrderDriverTele() {
		return orderDriverTele;
	}

	public void setOrderDriverTele(String orderDriverTele) {
		this.orderDriverTele = orderDriverTele;
	}

	public String getOrderWindowTele() {
		return orderWindowTele;
	}

	public void setOrderWindowTele(String orderWindowTele) {
		this.orderWindowTele = orderWindowTele;
	}

	private String orderDriverTele;
	
	private String orderWindowTele;
	
	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	private String orderType;

	private Date orderArriveTime;

	private String orderAddress;

	private Integer deliverId;

	private BigDecimal orderPrice;

	private String orderPayType;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getOrderStartTime() {
		return orderStartTime;
	}

	public void setOrderStartTime(Date orderStartTime) {
		this.orderStartTime = orderStartTime;
	}

	public void setOrderStartTimeWithNowTime() {
		java.sql.Date nowTime = new java.sql.Date(new Date().getTime());
		this.orderStartTime = nowTime;
	}

	public void setOrderEndTimeWithNowTime() {
		java.sql.Date nowTime = new java.sql.Date(new Date().getTime());
		this.orderEndTime = nowTime;
	}

	public void setOrderArriveTimeWithNowTime() {
		java.sql.Date nowTime = new java.sql.Date(new Date().getTime());
		this.orderArriveTime = nowTime;
	}

	public Date getOrderEndTime() {
		return orderEndTime;
	}

	public void setOrderEndTime(Date orderEndTime) {
		this.orderEndTime = orderEndTime;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public Date getOrderArriveTime() {
		return orderArriveTime;
	}

	public void setOrderArriveTime(Date orderArriveTime) {
		this.orderArriveTime = orderArriveTime;
	}

	public Integer getDeliverId() {
		return deliverId;
	}

	public void setDeliverId(Integer deliverId) {
		this.deliverId = deliverId;
	}

	public BigDecimal getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(BigDecimal orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderPayType() {
		return orderPayType;
	}

	public void setOrderPayType(String orderPayType) {
		this.orderPayType = orderPayType;
	}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(Integer userId,String orderType,Integer deliverId,BigDecimal orderPrice,String orderPayType,String orderAddress, String orderCode) {
		super();
        this.userId = userId;
        this.orderType = orderType;
		this.orderAddress = orderAddress;
		this.deliverId = deliverId;
		this.orderPrice = orderPrice;
		this.orderPayType = orderPayType;
		this.orderCode = orderCode;
	
	}
	
	

	public Order(Integer userId,String orderType,Integer deliverId,BigDecimal orderPrice,String orderPayType,String orderAddress, String orderCode,String orderUserTele, String orderDriverTele, String orderWindowTele) {
		super();
        this.userId = userId;
        this.orderType = orderType;
		this.orderAddress = orderAddress;
		this.deliverId = deliverId;
		this.orderPrice = orderPrice;
		this.orderPayType = orderPayType;
		this.orderCode = orderCode;
		this.orderUserTele = orderUserTele;
		this.orderDriverTele = orderDriverTele;
		this.orderWindowTele = orderWindowTele;
	
	}

	

}