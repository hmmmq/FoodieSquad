package com.niit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.Cart;
import com.niit.pojo.CartItem;
import com.niit.pojo.HistoryItem;
import com.niit.pojo.Order;
import com.niit.pojo.User;
import com.niit.service.CartService;
import com.niit.service.HistoryService;
import com.niit.service.OrderService;
import com.niit.service.UserService;

@Controller
@RequestMapping("/successPaid")

public class SuccessPaidController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	@Autowired
	private HistoryService historyService;
	@RequestMapping("/test.do")
	// ../successPaid/test.do
	public String test(@ModelAttribute("order") Order o,HttpSession session) {
		
		List<User> deliverList=userService.selectByUserType(1);
		
	    int userId=o.getUserId();
	    
		//String   orderType=(String)session.getAttribute("orderType");
		
		System.out.println("SuccessPaidController -userId:"+userId);
		
		User user=userService.selectByPrimaryKey(userId);
		
		ModelAndView mv=new ModelAndView();
		
//		mv.setViewName("successPaidPage");
		
		String verifyCode = "A"+String.valueOf(new Random().nextInt(8999) + 1000);
		session.setAttribute("verifyCode", verifyCode);
		
		
		//插入order表 骑手暂不随机生成
		Order order=new Order(userId, o.getOrderType(), deliverList.get(0).getUserId(),o.getOrderPrice(), 
				o.getOrderPayType(),o.getOrderAddress(), verifyCode, o.getOrderUserTele(), null, null);
		orderService.insert(order);
		
		
		Cart cart=cartService.selectByPrimaryKey(userId);
		
		//System.out.println("List<CartItem> cartItemlist=cart.getCartItemId();");
		List<CartItem> cartItemlist=cart.getCartItemId();
		
		
		//System.out.println("cartItemlist.size()"+cartItemlist.size());
		
		//历史订单赋值
		List<HistoryItem> historyItemlist=new ArrayList<HistoryItem>();
		for(CartItem ci:cartItemlist) {
			HistoryItem hi=new HistoryItem(null, ci.getCartId(), order.getOrderId(), ci.getDishId(), ci.getDishCount());
			historyItemlist.add(hi);
		}
		
		
		mv.addObject("verifyCode", verifyCode);
		mv.addObject("phoneNumber", user.getUserTele().get(0).getUserTele());
		mv.addObject("cartItemList", cartItemlist);
		mv.addObject("totalPrice", order.getOrderPrice());
		mv.addObject("orderNumber", order.getOrderId());
		//System.out.println("cartService.cleanByPrimaryKey(userId);");
		
		//插入历史订单；
		historyService.insertHistoryItemsByOrderId(historyItemlist);
		//更新session
		session.setAttribute("historyItemlist", historyItemlist);
		//清空购物车
		cartService.cleanByPrimaryKey(userId);
		
		///go_to_order_detail.do/orderId/{orderId}/userId/{userId}.do
		//获取最新订单号
		Order new_order=orderService.selectLatestOrder(userId);
		
		return "redirect:/myOrder/go_to_order_detail.do/orderId/"+new_order.getOrderId()+"/userId/"+userId+".do";
	}
	
}
