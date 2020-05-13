package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.Canteen;
import com.niit.pojo.Dish;
import com.niit.pojo.Window;
import com.niit.service.CanteenService;
import com.niit.service.DishService;
import com.niit.service.WindowService;

@Controller
@RequestMapping("/chooseFood")
public class ChooseFoodController {
	@Autowired
	private WindowService windowService;
	@Autowired
	private DishService dishService;
	@Autowired
	private CanteenService canteenService;
	@RequestMapping("/test.do")
	public ModelAndView test(@Param("canteenId") Integer canteenId) {
		System.out.println(canteenId);
		System.out.println("response calling");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("chooseFoodPage");
		
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
		
		Canteen c=canteenService.selectByPrimaryKey(canteenId);
		System.out.println(c.getCanteenName());
		mv.addObject("canteen",c);
		mv.addObject("dishListList", dishListList);
		return mv;
	}
}
