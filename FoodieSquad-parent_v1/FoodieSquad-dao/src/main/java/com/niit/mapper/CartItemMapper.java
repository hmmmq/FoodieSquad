package com.niit.mapper;

import com.niit.pojo.CartItem;
import java.util.List;

public interface CartItemMapper {
    int deleteByPrimaryKey(Integer cartItemId);

    int insert(CartItem record);

    CartItem selectByPrimaryKey(Integer cartItemId);

    List<CartItem> selectAll();

    int updateByPrimaryKey(CartItem record);
    
    CartItem TestIfHasIt(Integer cartItemId);
    
    
}