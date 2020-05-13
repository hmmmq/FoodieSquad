package com.niit.mapper;

import com.niit.pojo.Cart;
import java.util.List;

public interface CartMapper {
    int deleteByPrimaryKey(Integer cartId);

    int insert(Cart record);

    Cart selectByPrimaryKey(Integer cartId);

    List<Cart> selectAll();

    
}