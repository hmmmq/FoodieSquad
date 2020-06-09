package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.HistoryItem;
import com.niit.pojo.Order;
import com.niit.pojo.User;
import com.niit.service.HistoryService;
import com.niit.service.OrderService;
import com.niit.service.UserService;
import com.niit.service.WindowService;
import com.niit.util.OrderUtil;

@Controller
@RequestMapping("/myOrder")

public class MyOrderController {
	

@Autowired
OrderService orderService;
	
@Autowired
HistoryService historyService;
	
@Autowired
WindowService windowService;
	
@Autowired
UserService userService;




	@RequestMapping("/test.do")
     public ModelAndView test(HttpSession session) {
		
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("historyOrder");
		
		User u=(User)session.getAttribute("u");
		System.out.println("user:id:"+u.getUserId());
		mv.addObject("userId", u.getUserId());
		List<Order> orderlist=orderService.selectByUserId(u.getUserId());
		
		List<HistoryItem> historyItemlist=historyService.selectByUserId(u.getUserId());

		List<OrderUtil> orderUtilList=new ArrayList<OrderUtil>();
		 if(orderlist.size()==0) {
				
				
				mv.addObject("orderUtilList",null);
			}
			else {
				
				
				for(Order o:orderlist)
				{
					System.err.println("----------ENTER-----------");
					System.out.println("ORder:"+o.getOrderId());
					System.err.println("----------ENTER-----------");
					OrderUtil ou=new OrderUtil();
					List<HistoryItem> hl=new ArrayList<HistoryItem>();
					int count=0;
					for(HistoryItem hi:historyItemlist)
					{
						System.err.println("----------ENTER-----------");
						System.out.println(hi.getOrderId());
						System.err.println("----------ENTER-----------");
						if(o.getOrderId().equals(hi.getOrderId()))
						{

							System.out.println(hi.getDishCount());
							hl.add(hi);
							count++;
						}
					}
					ou.setHistoryItemlist(hl);
					String dishName=hl.get(0).getDishId().getDishName();
					Integer winId=hl.get(0).getDishId().getWindowId();
					String name=windowService.selectByPrimaryKey(winId).getWindowName();
					ou.setCanteenName(name.substring(0, 3));
					ou.setWindowName(name.substring(3));
					ou.setOrder(o);
					ou.setDishCount(count);
					ou.setFirstDishName(dishName);
					orderUtilList.add(ou);
					System.out.println(ou.getCanteenName()+":"+ou.getWindowName());
					System.out.println(ou.getOrder().getOrderCode());
				}
				mv.addObject("orderUtilList",orderUtilList);
			}
		
		
		
		
	
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	public ModelAndView testOrder(@PathVariable("orderId") Integer orderId,@PathVariable("userId") Integer userId) {
		
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("orderDetail");
		OrderUtil orderUtil=new OrderUtil();
		Order order=orderService.selectByPrimaryKey(orderId, userId);
		
		List<HistoryItem> historyItemlist=historyService.selectByOrderId(order.getOrderId());
		orderUtil.setOrder(order);
		orderUtil.setHistoryItemlist(historyItemlist);
		
		mv.addObject("orderUtil", orderUtil);
	
		
		return mv;
	}
	

	@RequestMapping("/go_to_order_detail.do/orderId/{orderId}/userId/{userId}.do")
	//  myOrder/testOrder.do
	public ModelAndView go_to_order_detail(@PathVariable("orderId") Integer orderId,@PathVariable("userId") Integer userId) {
		
		ModelAndView mv=new ModelAndView();
		
	
		OrderUtil orderUtil=new OrderUtil();
		Order order=orderService.selectByPrimaryKey(orderId, userId);
	
	
		
		List<HistoryItem> historyItemlist=historyService.selectByOrderId(order.getOrderId());
		orderUtil.setOrder(order);
		orderUtil.setHistoryItemlist(historyItemlist);
		
		mv.addObject("orderUtil", orderUtil);
	
		
		if(order.getOrderType().equals("外卖")) {
			return testOrder2(orderId,userId);
			
		}else {
			return testOrder(orderId,userId);
		}
		
	}
	
	
	
	public ModelAndView testOrder2(@PathVariable("orderId") Integer orderId,@PathVariable("userId") Integer userId) {
		
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("orderDetail2");
		OrderUtil orderUtil=new OrderUtil();
		Order order=orderService.selectByPrimaryKey(orderId, userId);
		User deliver=userService.selectByPrimaryKey(order.getDeliverId());
		List<HistoryItem> historyItemlist=historyService.selectByOrderId(order.getOrderId());
		orderUtil.setOrder(order);
		orderUtil.setHistoryItemlist(historyItemlist);
		mv.addObject("deliver", deliver);
		mv.addObject("orderUtil", orderUtil);
	
		
		return mv;
	}
	
	
	@RequestMapping("/deleteOrder.do/orderId/{orderId}/userId/{userId}.do")
	//  myOrder/testOrder.do
	public ModelAndView deleteOrder(@PathVariable("orderId") Integer orderId,@PathVariable("userId") Integer userId,HttpSession session) {	
		ModelAndView mv=new ModelAndView();	
		historyService.deleteHistoryItemsByOrderId(orderId);
	orderService.deleteByPrimaryKey(orderId, userId);
return test(session);

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
