package com.niit.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails{

	

	private Integer userId;

	private String userStudentNum;

	private String userName;

	private String userPassword;
	
	private String password;
	
	private String username;
	
	private List<UserTele> userTele;

	private String userGender;

	private List<UserAddress> userAddress;

	private BigDecimal userBalance;

	private BigDecimal userIncome;

	private Integer userType;
	
    private boolean accountNonExpired;
    
    private boolean accountNonLocked;
    
    private boolean enabled;
    
    private boolean credentialsNonExpired;
    
    private List<GrantedAuthority> authorities =new ArrayList<GrantedAuthority>();
    
	public User(Integer userId, String userStudentNum, String userName, String userPassword, String password,
			String username2, List<UserTele> userTele, String userGender, List<UserAddress> userAddress,
			BigDecimal userBalance, BigDecimal userIncome, Integer userType, boolean accountNonExpired,
			boolean accountNonLocked, boolean enabled, boolean credentialsNonExpired,
			List<GrantedAuthority> authorities) {
		super();
		this.userId = userId;
		this.userStudentNum = userStudentNum;
		this.userName = userName;
		this.userPassword = userPassword;
		this.password = password;
		username = username2;
		this.userTele = userTele;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userBalance = userBalance;
		this.userIncome = userIncome;
		this.userType = userType;
		this.accountNonExpired = accountNonExpired;
		this.accountNonLocked = accountNonLocked;
		this.enabled = enabled;
		this.credentialsNonExpired = credentialsNonExpired;
		this.authorities = authorities;
	}

	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return this.accountNonExpired;
	}

	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return this.accountNonLocked;
	}

	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return this.credentialsNonExpired;
	}

	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return this.enabled;
	}
    
    
    public void setAuthorities(List<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	
    
    public List<GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public BigDecimal getUserIncome() {
		return userIncome;
	}

	public void setUserIncome(BigDecimal userIncome) {
		this.userIncome = userIncome;
	}

	public Integer getUserId() {
		return userId;
	}

	public User(String userStudentNum, String userName, String userPassword, String userGender, BigDecimal userBalance,
			Integer userType) {
		super();
		this.userStudentNum = userStudentNum;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userGender = userGender;
		this.userBalance = userBalance;
		this.userType = userType;

	}

	

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserStudentNum() {
		return userStudentNum;
	}

	public void setUserStudentNum(String userStudentNum) {
		this.userStudentNum = userStudentNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public BigDecimal getUserBalance() {
		return userBalance;
	}

	public void setUserBalance(BigDecimal userBalance) {
		this.userBalance = userBalance;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public List<UserTele> getUserTele() {
		return userTele;
	}

	public void setUserTele(List<UserTele> userTele) {
		this.userTele = userTele;
	}

	public List<UserAddress> getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(List<UserAddress> userAddress) {
		this.userAddress = userAddress;
	}

	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userStudentNum, String userName, String userPassword, List<UserTele> userTele, String userGender,
			List<UserAddress> userAddress, BigDecimal userBalance, Integer userType) {
		super();
		this.userId = null;
		this.userStudentNum = userStudentNum;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userTele = userTele;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userBalance = userBalance;
		this.userType = userType;

		this.userIncome = null;
	}

	public User(Integer userId, String userStudentNum, String userName, String userPassword, List<UserTele> userTele,
			String userGender, List<UserAddress> userAddress, BigDecimal userBalance, Integer userType) {
		super();
		this.userId = userId;
		this.userStudentNum = userStudentNum;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userTele = userTele;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userBalance = userBalance;
		this.userType = userType;

		this.userIncome = null;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userStudentNum=" + userStudentNum + ", userName=" + userName
				+ ", userPassword=" + userPassword + ", password=" + password + ", username=" + username + ", userTele="
				+ userTele + ", userGender=" + userGender + ", userAddress=" + userAddress + ", userBalance="
				+ userBalance + ", userIncome=" + userIncome + ", userType=" + userType + ", accountNonExpired="
				+ accountNonExpired + ", accountNonLocked=" + accountNonLocked + ", enabled=" + enabled
				+ ", credentialsNonExpired=" + credentialsNonExpired + ", authorities=" + authorities + "]";
	}


}