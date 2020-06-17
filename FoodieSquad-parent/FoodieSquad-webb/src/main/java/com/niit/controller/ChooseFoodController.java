package com.niit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.Canteen;
import com.niit.pojo.Cart;
import com.niit.pojo.CartItem;
import com.niit.pojo.Dish;
import com.niit.pojo.User;
import com.niit.pojo.Window;
import com.niit.service.CanteenService;
import com.niit.service.CartService;
import com.niit.service.DishService;
import com.niit.service.WindowService;
@SessionAttributes(value= {"orderType"})
@Controller
@RequestMapping("/chooseFood")
public class ChooseFoodController {
	@Autowired
	private WindowService windowService;
	@Autowired 
	private CanteenService canteenService;	
	@Autowired
	private DishService dishService;
	@Autowired
	private CartService cartService;
	
	
	@RequestMapping("/test.do")
	public ModelAndView test(@Param("canteenId") Integer canteenId,@Param("orderType") String orderType,Model model) {
		
		System.out.println("orderType"+orderType);
		model.addAttribute("orderType", orderType);
		System.out.println("response calling");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("user/chooseFoodPage");
		Canteen canteen=canteenService.selectByPrimaryKey(canteenId);
		mv.addObject("canteenName", canteen.getCanteenName());
		List<Window> windowList=windowService.selectByCanteenId(canteenId);
		mv.addObject("windowList", windowList);
		List<List<Dish>> dishListList=new ArrayList<List<Dish>>();
		int i=0;
		for(Window win: windowList)
		{
			List<Dish> dishList=dishService.selectByWindowId(win.getWindowId());
			dishListList.add(dishList);
			i++;
		}
		mv.addObject("dishListList", dishListList);
		return mv;
	}
	// /chooseFood/go_choose_food.do
	@RequestMapping("/go_choose_food.do")
	public ModelAndView go_choose_food(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("user/chooseFoodPage");
		HashMap<String, Object> three_map= (HashMap<String, Object>) session.getAttribute("three_map");
		
		Canteen choosen_canteen=(Canteen)three_map.get("choosen_canteen");
		
		Window choosen_window=(Window)three_map.get("choosen_window");
		
		Dish choosen_dish=(Dish)three_map.get("choosen_dish");
		
		
	   mv.addObject("choosen_window",choosen_window);
	   mv.addObject("choosen_dish",choosen_dish);
	 
	    mv.addObject("canteenName", choosen_canteen.getCanteenName());
		
		List<Window> windowList=windowService.selectByCanteenId(choosen_canteen.getCanteenId());
		
		mv.addObject("windowList", windowList);
		
		List<List<Dish>> dishListList=new ArrayList<List<Dish>>();
		int i=0;
		
		for(Window win: windowList)
		{
			List<Dish> dishList=dishService.selectByWindowId(win.getWindowId());
			dishListList.add(dishList);
			i++;
		}
		
		mv.addObject("dishListList", dishListList);
		return mv;
	}

	@RequestMapping("/submit.do")
	public void submit(@RequestParam("menu") List<String> menu,HttpServletRequest request , HttpServletResponse response,HttpSession session) {
		//Integer userId=(Integer)request.getAttribute("userId");
	      User u=(User)session.getAttribute("u");
	      int cartId=u.getUserId();
		String orderType="堂食";
		
		request.setAttribute("orderType", orderType);
		
		
		for(String str:menu)
		{
			System.out.println("menu:菜单："+str);
		}
		List<CartItem> cartItemId=new ArrayList<CartItem>();
		
		for(int i=0;i<menu.size();)
		{
			Integer dish_id=Integer.parseInt(menu.get(i));
			Integer dish_count=Integer.parseInt(menu.get(i+1));
			System.out.println("cartService.insertOneItem("+cartId+","+ dish_id+","+dish_count+";");
		
		    cartService.insertOneItem(cartId, dish_id, dish_count);
			i+=2;
		}
		
		
		try {
			request.getRequestDispatcher("../submitOrder/test.do").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
