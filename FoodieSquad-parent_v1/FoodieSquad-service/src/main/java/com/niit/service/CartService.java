package com.niit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.mapper.CartItemMapper;
import com.niit.mapper.CartMapper;
import com.niit.pojo.Cart;
import com.niit.pojo.CartItem;
@Service
public class CartService {
	@Autowired
	CartMapper cartMapper;
	@Autowired
	CartItemMapper cartItemMapper;
	
	
public	 int deleteByPrimaryKey(Integer cartId) {
		 return cartMapper.deleteByPrimaryKey(cartId);
	 }
public	 int cleanByPrimaryKey(Integer cartId) {
	Cart c=cartMapper.selectByPrimaryKey(cartId);
	
	List<CartItem> itemlist=c.getCartItemId();
	
	for(CartItem ci:itemlist) {
		cartItemMapper.deleteByPrimaryKey(ci.getCartItemId());
	}
	
	 return 1;
}


public int insert(Cart record) {
	List<Cart> cartlist=cartMapper.selectAll();
	record.setCartId(cartlist.size()+1);
	List<CartItem> cartItemlist=record.getCartItemId();
	
    if(cartItemlist!=null)
	    for(CartItem c:cartItemlist) {
	    	    c.setCartId(record.getCartId());
	    	    //CartItem c1=cartItemMapper.TestIfHasIt(c.getCartItemId()); 
	    	    //如果c1已存在，insert_sql语句里面没有插入c1，则可以直接插入c1
	    		cartItemMapper.insert(c);
	       }
	
	return cartMapper.insert(record);
	    }



public	Cart selectByPrimaryKey(Integer cartId) {
	    	return cartMapper.selectByPrimaryKey(cartId);
	    }



public  List<Cart> selectAll(){
	    	return cartMapper.selectAll();
	    }



public int update(Cart record) {
	List<CartItem> cartItemlist=record.getCartItemId();
	 for(CartItem c:cartItemlist) 
	    	c.setCartId(record.getCartId());
	if(cartItemlist!=null) 
	    for(CartItem c:cartItemlist) {
	    	if(c.getCartItemId()==null) {
	    		cartItemMapper.insert(c);
	    		continue;
	    	}
	    	CartItem c1=cartItemMapper.TestIfHasIt(c.getCartItemId()); 
	    	if(c1!=null)
	    	cartItemMapper.updateByPrimaryKey(c);
	    	else
	    	cartItemMapper.insert(c);}
   return 1;
	
	//表示无更新；
}


	
	

	    
	    
	    
}
