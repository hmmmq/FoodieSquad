package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.Canteen;
import com.niit.pojo.Dish;
import com.niit.pojo.Favorite;
import com.niit.pojo.FavoriteCanteen;
import com.niit.pojo.FavoriteDish;
import com.niit.pojo.FavoriteWindow;
import com.niit.pojo.Window;
import com.niit.service.CanteenService;
import com.niit.service.DishService;
import com.niit.service.FavoriteService;
import com.niit.service.UserService;
import com.niit.service.WindowService;
@SessionAttributes(value= {"userId"})
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
//    canteen/testshowCanteenPage.do?userId=1

@RequestMapping("/testshowCanteenPage.do")
//@PathVariable("userId") Integer uId,

public String testshowCanteenPage(@Param("userId") Integer userId,Model m,HttpSession session) {
	System.out.println("userId:"+userId);
	m.addAttribute("userId",userId);
	System.out.println("response calling");
// logincontroller里session已经加入
//	  List<FavoriteCanteen>	fcl=favoriteService.selectFavoriteCanteenByUserId(userId);
//	  List<FavoriteWindow> fwl=favoriteService.selectFavoriteWindowByUserId(userId);
//       List<FavoriteDish>  fdl=favoriteService.selectFavoriteDishByUserId(userId);
//需重写该部分以及jsp页面
//	Favorite f=favoriteService.selectByUserId(userId);
//	if(f==null) {
//		m.addAttribute("fdishlist",null);
//	    
//	}
//	else {
//		List<Dish> dishlist=f.getFavoriteId();
//		m.addAttribute("fdishlist",dishlist);
//		session.setAttribute("fdishlist",dishlist);
//	}
	
	
	List<Canteen> canteenlist=canteenService.selectAll();
	
	m.addAttribute("canteenlist", canteenlist);
	session.setAttribute("canteenlist", canteenlist);
	
	return "chooseCanteenPage";
}

@RequestMapping("/showCanteenPage/{userId}.do")
public ModelAndView showCanteenPage(@PathVariable("userId") Integer uId) {
	System.out.println("response calling");
	//需重写该部分以及jsp页面
//	Favorite f=favoriteService.selectByUserId(uId);
//	List<Dish> dishlist=f.getFavoriteId();
	ModelAndView mv=new ModelAndView();
	mv.setViewName("chooseCanteenPage");
	List<Canteen> canteenlist=canteenService.selectAll();
	mv.addObject("canteenlist", canteenlist);
	//mv.addObject("fdishlist", dishlist);
	return mv;
}

@RequestMapping("/test.do")
public String test() {
	System.out.println("response calling");
	return "hello";
}


//
//@ResponseBody
//@RequestMapping("/restful/{searchstr}.do")//执行查询
//public List<String> selectUser(@PathVariable("searchstr") String searchstr) {

@RequestMapping("/testsearch2/{searchstr}.do")
public ModelAndView testsearch2(@PathVariable("searchstr") String searchstr) {

	System.out.println("@RequestMapping(\"/testsearch2/{searchstr}.do\")");
	System.out.println("String searchstr"+searchstr);
    ModelAndView mv=new ModelAndView();
	mv.setViewName("canteenTest");
	//System.out.println("response:/restful/{searchstr}");
	//List<String> liststring=new ArrayList<String>();
    if(searchstr==null||searchstr=="") {
		return mv;
	}else {
		List<Canteen> canteenlist=canteenService.searchCanteenByName(searchstr);
		if(canteenlist!=null) 
			for(Canteen c:canteenlist) mv.addObject("canteenlist",canteenlist);
	         
			
		
			
		List<Window> windowlist=windowService.searchWindowByName(searchstr);
		if(windowlist!=null) 
			for(Window w:windowlist) 
				mv.addObject("windowlist",windowlist);
			
		List<Dish> dishlist=dishService.searchByDishName(searchstr);
		if(dishlist!=null) 
			for(Dish d:dishlist) 
				mv.addObject("dishlist", dishlist);
	}
      return mv;
}

// canteen/testsearch.do?search=tom
@RequestMapping("/testsearch.do")
public ModelAndView testsearch(@Param("searchtext") String searchtext) {
	System.out.println("searchtext"+searchtext);
	ModelAndView mv=new ModelAndView();
	mv.setViewName("chooseCanteenPage");
	if(searchtext==null||searchtext=="") {
		return mv;
	}
	//如果搜索为空返回全部餐厅名单
	List<Canteen> canteenlist=canteenService.searchCanteenByName(searchtext);
	//如果搜索为空返回null;
	List<Dish> dishlist=dishService.searchByDishName(searchtext);
	List<Window> windowlist=new ArrayList<Window>();
	//如果搜了菜，将菜的餐厅加到list，同时加上菜单
	if(dishlist.size()!=0)		
	{System.out.println("dishlist不为空");
		for(Dish d:dishlist) {
			System.out.println("windowid:"+d.getWindowId());
			Window e=windowService.selectByPrimaryKey(d.getWindowId());
			System.out.println("canteenid:"+e.getCanteenId());
			windowlist.add(e);
			
			}
		for(Window e:windowlist) {
				Canteen c=canteenService.selectByPrimaryKey(e.getCanteenId());
				canteenlist.add(c);
			}
			
		mv.addObject("dishlist", dishlist);
	}else {
		mv.addObject("dishlist", null);
		System.out.println("dishlist为空");
	}
	  mv.addObject("canteenlist", canteenlist);
     return mv;
}

// canteen/tocanteentest
@RequestMapping("/tocanteentest.do")
public String toTestRESTful() {
	//System.out.println("response");
    return "canteenTest";
}


@ResponseBody
@RequestMapping("/restful/{searchstr}.do")//执行查询
public List<String> selectUser(@PathVariable("searchstr") String searchstr) {
	System.out.println("response:/restful/{searchstr}");
	List<String> liststring=new ArrayList<String>();
    if(searchstr==null||searchstr=="") {
		liststring.add("");
		return liststring;
	}else {
		List<Canteen> canteenlist=canteenService.searchCanteenByName(searchstr);
		if(canteenlist!=null) {
			for(Canteen c:canteenlist) 
				liststring.add(c.getCanteenName());
			
		}
		
		List<Window> windowlist=windowService.searchWindowByName(searchstr);
		if(windowlist!=null) {
			for(Window w:windowlist) 
				liststring.add(w.getWindowName());
			
		}
		
		
		List<Dish> dishlist=dishService.searchByDishName(searchstr);
		if(dishlist!=null) {
			for(Dish d:dishlist) 
			  liststring.add(d.getDishName());
				
		}
	}
    return liststring;
    
		
	}



   





}
