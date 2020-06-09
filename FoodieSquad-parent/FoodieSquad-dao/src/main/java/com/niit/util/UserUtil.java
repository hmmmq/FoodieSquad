package com.niit.util;

import com.niit.pojo.User;
import com.niit.pojo.UserAddress;
import com.niit.pojo.UserTele;

public class UserUtil {
	private User user;
	private UserAddress userAddress;
	private UserTele userTele;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserAddress getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}
	public UserTele getUserTele() {
		return userTele;
	}
	public void setUserTele(UserTele userTele) {
		this.userTele = userTele;
	}
	public UserUtil() {
		super();
	}
	@Override
	public String toString() {
		return "UserUtil [user=" + user + ", userAddress=" + userAddress + ", userTele=" + userTele + "]";
	}
	public UserUtil(User user) {
		super();
		this.user = user;
	}
	
	
	
	
}
