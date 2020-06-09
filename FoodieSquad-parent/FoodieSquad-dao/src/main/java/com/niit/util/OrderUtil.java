package com.niit.util;

import java.util.List;

import com.niit.pojo.HistoryItem;
import com.niit.pojo.Order;

public class OrderUtil{
	private String canteenName;
	private String windowName;
	private Order order;
	private	List<HistoryItem> historyItemlist;
	
	private String firstDishName;
	private int dishCount;
	
	public String getFirstDishName() {
		return firstDishName;
	}
	public void setFirstDishName(String firstDishName) {
		this.firstDishName = firstDishName;
	}
	public int getDishCount() {
		return dishCount;
	}
	public void setDishCount(int dishCount) {
		this.dishCount = dishCount;
	}
	public String getCanteenName() {
		return canteenName;
	}
	public void setCanteenName(String canteenName) {
		this.canteenName = canteenName;
	}
	public String getWindowName() {
		return windowName;
	}
	public void setWindowName(String windowName) {
		this.windowName = windowName;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<HistoryItem> getHistoryItemlist() {
		return historyItemlist;
	}
	public void setHistoryItemlist(List<HistoryItem> historyItemlist) {
		this.historyItemlist = historyItemlist;
	}
	public OrderUtil() {
		super();
	}
}
