package com.niit.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.Canteen;
import com.niit.pojo.Cart;
import com.niit.pojo.CartItem;
import com.niit.pojo.Dish;
import com.niit.pojo.Order;
import com.niit.pojo.User;
import com.niit.pojo.UserAddress;
import com.niit.pojo.UserTele;
import com.niit.pojo.Window;
import com.niit.service.CanteenService;
import com.niit.service.CartService;

import com.niit.service.OrderService;
import com.niit.service.UserService;
import com.niit.service.WindowService;

@Controller
@RequestMapping("/submitOrder")
public class SubmitOrderController {
	@Autowired
	private CartService cartService;
	@Autowired 
	private CanteenService canteenService;	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private WindowService windowService;
	
	
	
	
	//submitOrder/test.do
	@RequestMapping("/test.do")
	public ModelAndView test(HttpSession session) {
		
		Integer  userId=(Integer)session.getAttribute("userId");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("submitOrderPage");
		
		System.out.println("userId:"+userId);
		
		//计算订单总价
		Cart cart=cartService.selectByPrimaryKey(userId);
		BigDecimal orderPrice = new BigDecimal("0"); 
		BigDecimal singlePrice=new BigDecimal("0");
		System.out.println("List<CartItem> CartItemlist=cart.getCartItemId();");
		List<CartItem> CartItemlist=cart.getCartItemId();
		System.out.println("CartItemlist.size()"+CartItemlist.size());
		List<Dish> dishList=new ArrayList<Dish>();
		for(CartItem ci:CartItemlist) {
			System.out.println("dishList.add(ci.getDishId());");
			dishList.add(ci.getDishId());
			System.out.println(ci.getDishId().getDishId()+" "+ci.getDishId().getDishName()+" "+ci.getDishId().getDishPrice()+" "+ci.getDishCount());
			singlePrice=ci.getDishId().getDishPrice().multiply(new BigDecimal(ci.getDishCount()));
			orderPrice=	orderPrice.add(singlePrice);
			
		}
		
		
		//加入选中食堂
		//String test = dishList.get(0).getDishId()+"";
		//int first = Integer.parseInt(test.substring(0,1));
		//Canteen canteen=canteenService.selectByPrimaryKey(first);
		HashMap<String, Object> three_map= (HashMap<String, Object>) session.getAttribute("three_map");
		Canteen choosen_canteen=(Canteen)three_map.get("choosen_canteen");
		
		//加入用户号码
		List<UserTele> telelist=userService.selectuserTeleByUserId(userId);
		
		//加入用户地址
	List<UserAddress>	addresslist=	userService.selectuserAddressByUserId(userId);
		
		
		mv.addObject("canteen", choosen_canteen.getCanteenName());
		mv.addObject("cartItemList", CartItemlist);
		mv.addObject("dishList",dishList);
		mv.addObject("orderPrice",orderPrice);
		mv.addObject("telelist",telelist);
		mv.addObject("addresslist",addresslist);
		
        //orderType需要选择完后插入暂定为null
		//deliverId暂时不可用暂定为null
		//orderPayType需要选择完后插入暂定为null
		//orderCode暂定为null
		//需要数据太少，暂不插入。
		//orderService.insert(new Order(userId, null, null, orderPrice, null, null, null, null, null, null));
	    return mv;
	}
}
