package com.niit.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.Cart;
import com.niit.pojo.CartItem;
import com.niit.pojo.Dish;
import com.niit.service.CartService;

@Controller
@RequestMapping("/submitOrder")
public class SubmitOrderController {
	@Autowired
	private CartService cartService;
	//submitOrder/test.do
	@RequestMapping("/test.do")
	public ModelAndView test() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("hello");
		Cart cart=cartService.selectByPrimaryKey(1);
		BigDecimal totalPrice = new BigDecimal("0"); 
		BigDecimal singlePrice=new BigDecimal("0");
		
		List<CartItem> CartItemlist=cart.getCartItemId();
		for(CartItem ci:CartItemlist) {
			System.out.println(ci.getDishId().getDishId()+" "+ci.getDishId().getDishName()+" "+ci.getDishId().getDishPrice()+" "+ci.getDishCount());
			singlePrice=	ci.getDishId().getDishPrice().multiply(new BigDecimal(ci.getDishCount()));
			totalPrice=	totalPrice.add(singlePrice);
			
		}	
		System.out.println("totalPrice "+totalPrice);
	    return mv;
	}
}
