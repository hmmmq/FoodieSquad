package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.Canteen;
import com.niit.pojo.Dish;
import com.niit.pojo.Favorite;
import com.niit.pojo.Window;
import com.niit.service.CanteenService;
import com.niit.service.DishService;
import com.niit.service.FavoriteService;
import com.niit.service.UserService;
import com.niit.service.WindowService;

@Controller
@RequestMapping("/canteen")
public class CanteenController {
	
	
@Autowired 
private CanteenService canteenService;	

@Autowired 
private DishService dishService;

@Autowired 
private WindowService windowService;

@Autowired
private UserService userService;

@Autowired
private FavoriteService favoriteService;
//canteen/testshowCanteenPage.do?userId=1
@RequestMapping("/testshowCanteenPage.do")
//@PathVariable("userId") Integer uId,
public ModelAndView testshowCanteenPage(@RequestParam("userId") Integer uId) {
	System.out.println("response calling");
	Favorite f=favoriteService.selectByUserId(uId);
	List<Dish> dishlist=f.getFavoriteId();
	ModelAndView mv=new ModelAndView();
	mv.setViewName("chooseCanteenPage");
	List<Canteen> canteenlist=canteenService.selectAll();
	mv.addObject("canteenlist", canteenlist);
	mv.addObject("fdishlist", dishlist);
	return mv;
}

@RequestMapping("/showCanteenPage/{userId}.do")
public ModelAndView showCanteenPage(@PathVariable("userId") Integer uId) {
	System.out.println("response calling");
	Favorite f=favoriteService.selectByUserId(uId);
	List<Dish> dishlist=f.getFavoriteId();
	ModelAndView mv=new ModelAndView();
	mv.setViewName("chooseCanteenPage");
	List<Canteen> canteenlist=canteenService.selectAll();
	mv.addObject("canteenlist", canteenlist);
	mv.addObject("fdishlist", dishlist);
	return mv;
}

@RequestMapping("/test.do")
public String test() {
	System.out.println("response calling");
	return "hello";
}

//canteen/search.do?search=
@RequestMapping("/search/{search}.do")
public ModelAndView search(@PathVariable("search") String searchname) {
	ModelAndView mv=new ModelAndView();
	//如果搜索为空返回全部餐厅名单
	List<Canteen> canteenlist=canteenService.searchCanteenByName(searchname);
	//如果搜索为空返回null;
	List<Dish> dishlist=dishService.searchByDishName(searchname);
	List<Window> windowlist=new ArrayList<Window>();
	//如果搜了菜，将菜的餐厅加到list，同时加上菜单
	if(dishlist.size()!=0)		
	{
		mv.addObject("dishlist", dishlist);
		for(Dish d:dishlist) {
			Window e=windowService.selectByPrimaryKey(d.getWindowId());
			windowlist.add(e);
			}
			
			for(Window e:windowlist) {
				Canteen c=canteenService.selectByPrimaryKey(e.getCanteenId());
				canteenlist.add(c);
			
			}
	}
	mv.addObject("canteenlist", canteenlist);
mv.setViewName("chooseCanteenPage");
return mv;
}
// canteen/testsearch.do?search=tom
@RequestMapping("/testsearch.do")
public ModelAndView testsearch(@RequestParam("search") String searchname) {
	ModelAndView mv=new ModelAndView();
	//如果搜索为空返回全部餐厅名单
	List<Canteen> canteenlist=canteenService.searchCanteenByName(searchname);
	//如果搜索为空返回null;
	List<Dish> dishlist=dishService.searchByDishName(searchname);
	List<Window> windowlist=new ArrayList<Window>();
	//如果搜了菜，将菜的餐厅加到list，同时加上菜单
	if(dishlist.size()!=0)		
	{
		mv.addObject("dishlist", dishlist);
		for(Dish d:dishlist) {
			Window e=windowService.selectByPrimaryKey(d.getWindowId());
			windowlist.add(e);
			}
			
			for(Window e:windowlist) {
				Canteen c=canteenService.selectByPrimaryKey(e.getCanteenId());
				canteenlist.add(c);
			
			}
	}
	mv.addObject("canteenlist", canteenlist);
mv.setViewName("chooseCanteenPage");
return mv;
}






}
