package com.niit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.mapper.CartMapper;
import com.niit.mapper.UserAddressMapper;
import com.niit.mapper.UserMapper;
import com.niit.mapper.UserTeleMapper;
import com.niit.pojo.Cart;
import com.niit.pojo.Order;
import com.niit.pojo.User;
import com.niit.pojo.UserAddress;
import com.niit.pojo.UserTele;
@Service
public class UserService {
	@Autowired 
	private UserMapper userMapper;
	@Autowired
	private UserAddressMapper userAddressMapper;
	@Autowired
	private UserTeleMapper userTeleMapper;
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private CartService cartService;
	public	int deleteByPrimaryKey(Integer userId) {
		userAddressMapper.deleteByUserId(userId);
		userTeleMapper.deleteByUserId(userId);
		return userMapper.deleteByPrimaryKey(userId);
	}

	public int insert(User record){
		//自动增加主键，自动在相关表中插入数据；
		List<User> Userlist=userMapper.selectAll();
		int userId=Userlist.size()+1;
		record.setUserId(userId);
		Cart cart=new Cart(userId, null);
		cartService.insert(cart);
		record.setCartId(cart);
		List<UserAddress> UserAddresslist=record.getUserAddress();
		List<UserTele> UserTelelist=record.getUserTele();
		int userAddressId;
		int userTeleId;
		for(UserAddress userAddress:UserAddresslist) {
			userAddressId=getUserAddressLatestIdByUserId(userId);
			System.out.println(userAddressId);
			userAddress.setUserAddressId(userAddressId);
			userAddress.setUserId(userId);
			userAddressMapper.insert(userAddress);
		}
			
		for(UserTele userTele:UserTelelist)
		 {
			userTeleId=getUserTeleLatestIdByUserId(userId);
			userTele.setUserTeleId(userTeleId);
			userTele.setUserId(userId);
			userTeleMapper.insert(userTele);
		}
		 return userMapper.insert(record);
	 }
	
	
	
	public  User selectByPrimaryKey(Integer userId){
		  return userMapper.selectByPrimaryKey(userId);
	  }
	public  List<User> selectAll(){
		  return userMapper.selectAll();
	  }
	public int updateByPrimaryKey(User record){
		
		return userMapper.updateByPrimaryKey(record);
	}
	
	public	 int deleteuserAddressByPrimaryKey(@Param("userAddressId") Integer userAddressId, @Param("userId") Integer userId) {
		 return userAddressMapper.deleteByPrimaryKey(userAddressId, userId);
	 }

	public int insertuserAddress(UserAddress record) {
		 return userAddressMapper.insert(record);
	 }

	public UserAddress selectuserAddressByPrimaryKey(@Param("userAddressId") Integer userAddressId, @Param("userId") Integer userId) {
		return userAddressMapper.selectByPrimaryKey(userAddressId, userId);
	}

	public List<UserAddress> selectuserAddressByUserId(@Param("userId") Integer userId) {
		 return userAddressMapper.selectByUserId(userId);
	 }

	public int updateuserAddressByPrimaryKey(UserAddress record) {
		 return userAddressMapper.updateByPrimaryKey(record);
	 }
	 
	 
	public int deleteuserTeleByPrimaryKey(@Param("userTeleId") Integer userTeleId, @Param("userId") Integer userId) {
		 return userTeleMapper.deleteByPrimaryKey(userTeleId, userId);
	 }

	public int insertuserTele(UserTele record) {
	    	return userTeleMapper.insert(record);
	    }

	public UserTele selectuserTeleByPrimaryKey(@Param("userTeleId") Integer userTeleId, @Param("userId") Integer userId) {
	    	return userTeleMapper.selectByPrimaryKey(userTeleId, userId);
	    }

	public List<UserTele> selectuserTeleByUserId(@Param("userId") Integer userId) {
	    	return userTeleMapper.selectByUserId(userId);
	    }

	public  int updateuserTeleByPrimaryKey(UserTele record) {
		//不可更新电话和地址
	    	return userTeleMapper.updateByPrimaryKey(record);
	    }
	
	
	 private Integer getUserAddressLatestIdByUserId(int userId) {
			List<UserAddress> list=userAddressMapper.selectByUserId(userId);
          System.out.println(list.size());
		     if(list.size()==0) {
		    	 String num=userId+"00";
		    	 int a=Integer.parseInt(num);
		    	 return a+1;
		     }
		     else {
		    	 UserAddress o= list.get(list.size()-1);
		    	 return o.getUserAddressId()+1;
		     }
		    
	 }
	 
	 private Integer getUserTeleLatestIdByUserId(int userId) {
			List<UserTele> list=userTeleMapper.selectByUserId(userId);
       System.out.println(list.size());
		     if(list.size()==0) {
		    	 String num=userId+"00";
		    	 int a=Integer.parseInt(num);
		    	 return a+1;
		     }
		     else {
		    	 UserTele o=  list.get(list.size()-1);
		    	 
		    	 return o.getUserTeleId()+1;
		     }
		    
	 }
	
	
	
	
}
