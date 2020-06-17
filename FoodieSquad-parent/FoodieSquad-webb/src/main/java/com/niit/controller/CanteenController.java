package com.niit.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.niit.pojo.User;
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

//# 进入测试页面
@RequestMapping("/tocanteentest.do")
public String toTestRESTful(HttpSession session,Model m) {
	
	//System.out.println("response");
	// logincontroller里session已经加入
//	      User u=(User)session.getAttribute("u");
//	      int userId=u.getUserId();
	int userId=38;
		  List<FavoriteCanteen>	fcl=favoriteService.selectFavoriteCanteenByUserId(userId);
		  List<FavoriteWindow> fwl=favoriteService.selectFavoriteWindowByUserId(userId);
	      List<FavoriteDish>  fdl=favoriteService.selectFavoriteDishByUserId(userId);
	      session.setAttribute("fcl",fcl);
	      session.setAttribute("fwl",fwl);
	      session.setAttribute("fdl",fdl);
 return "user/canteenTest";
}


//## 测试页面点击搜索
//记得改


//## 测试页面点击
//## 测试页面收藏

//## 测试页面取消收藏




// # 进入餐厅页面
@RequestMapping("testshowCanteenPage.do")
public String showCanteenPage(@Param("userId") Integer userId,Model m,HttpSession session) {
	System.out.println("userId:"+userId);
	m.addAttribute("userId",userId);
	System.out.println("response calling");
	  List<FavoriteCanteen>	fcl=favoriteService.selectFavoriteCanteenByUserId(userId);
	  List<FavoriteWindow> fwl=favoriteService.selectFavoriteWindowByUserId(userId);
      List<FavoriteDish>  fdl=favoriteService.selectFavoriteDishByUserId(userId);
      session.setAttribute("fcl",fcl);
      session.setAttribute("fwl",fwl);
      session.setAttribute("fdl",fdl);
	
	List<Canteen> canteenlist=canteenService.selectAll();
	
	m.addAttribute("canteenlist", canteenlist);
	session.setAttribute("canteenlist", canteenlist);
	
	return "user/chooseCanteenPage";
}
//## 收藏或取消收藏后进入页面后进入页面（弃用）
@RequestMapping("reshowCanteenPage.do")
public String reshowCanteenPage(HttpSession session,Model m) {
	
    User u=(User)session.getAttribute("u");
    int userId=u.getUserId();
	System.out.println("userId:"+userId);
	m.addAttribute("userId",userId);
	System.out.println("response calling");
	  List<FavoriteCanteen>	fcl=favoriteService.selectFavoriteCanteenByUserId(userId);
	  List<FavoriteWindow> fwl=favoriteService.selectFavoriteWindowByUserId(userId);
      List<FavoriteDish>  fdl=favoriteService.selectFavoriteDishByUserId(userId);
      session.setAttribute("fcl",fcl);
      session.setAttribute("fwl",fwl);
      session.setAttribute("fdl",fdl);
	
	List<Canteen> canteenlist=canteenService.selectAll();
	
	m.addAttribute("canteenlist", canteenlist);
	session.setAttribute("canteenlist", canteenlist);
	
	return "user/chooseCanteenPage";
}
//## ajax 收藏或取消收藏后进入页面 
@ResponseBody
@RequestMapping("reshowCanteenPage_ajax.do")
public HashMap<String, Object> reshowCanteenPage_ajax(HttpSession session,Model m) {
	HashMap<String, Object> favor_map=new HashMap<String, Object>();
    User u=(User)session.getAttribute("u");
    int userId=u.getUserId();
	System.out.println("userId:"+userId);
	m.addAttribute("userId",userId);
	System.out.println("response calling");
	  List<FavoriteCanteen>	fcl=favoriteService.selectFavoriteCanteenByUserId(userId);
	  List<FavoriteWindow> fwl=favoriteService.selectFavoriteWindowByUserId(userId);
      List<FavoriteDish>  fdl=favoriteService.selectFavoriteDishByUserId(userId);
     
      session.setAttribute("fcl",fcl);
      session.setAttribute("fwl",fwl);
      session.setAttribute("fdl",fdl);
     
      favor_map.put("fcl",fcl);
      favor_map.put("fwl",fwl);
      favor_map.put("fdl",fdl);
	
      List<Canteen> canteenlist=canteenService.selectAll();
	m.addAttribute("canteenlist", canteenlist);
	session.setAttribute("canteenlist", canteenlist);
	
	return favor_map;
}


//canteen/testshowCanteenPage/38.do
//弃用
@RequestMapping("/showCanteenPage/{userId}.do")
public ModelAndView showCanteenPage(@PathVariable("userId") Integer uId) {
System.out.println("response calling");
//需重写该部分以及jsp页面
//Favorite f=favoriteService.selectByUserId(uId);
//List<Dish> dishlist=f.getFavoriteId();
ModelAndView mv=new ModelAndView();
mv.setViewName("user/chooseCanteenPage");
List<Canteen> canteenlist=canteenService.selectAll();
mv.addObject("canteenlist", canteenlist);
//mv.addObject("fdishlist", dishlist);
return mv;
}


//## 点击搜索 ajax局部刷新
@ResponseBody
@RequestMapping("/testsearch2_ajax/{searchstr}.do")
public HashMap<String, Object> testsearch2_ajax(@PathVariable("searchstr") String searchstr,HttpSession session) {

	HashMap<String, Object> map=new HashMap<String, Object>();
	
if(searchstr.isEmpty()) {
	List<Canteen> canteenlist=canteenService.selectAll();
	map.put("canteenlist",canteenlist);
		
	}else {
		List<Canteen> canteenlist=canteenService.searchCanteenByName(searchstr);
		if(canteenlist!=null) 
			map.put("canteenlist",canteenlist);
	     List<Window> windowlist=windowService.searchWindowByName(searchstr);
		if(windowlist!=null) 
			map.put("windowlist",windowlist);
			
		List<Dish> dishlist=dishService.searchByDishName(searchstr);
		if(dishlist!=null) 
			map.put("dishlist", dishlist);
	
	}
  return map;
}











//## 点击搜索 弃用
@RequestMapping("/testsearch2/{searchstr}.do")
public ModelAndView testsearch2(@PathVariable("searchstr") String searchstr,HttpSession session) {

	System.out.println("@RequestMapping(\"/testsearch2/{searchstr}.do\")");
	System.out.println("String searchstr"+searchstr);
ModelAndView mv=new ModelAndView();
	mv.setViewName("user/chooseCanteenPage");
//mv.setViewName("canteenTest");
	//System.out.println("response:/restful/{searchstr}");
	//List<String> liststring=new ArrayList<String>();
if(searchstr.isEmpty()) {
	List<Canteen> canteenlist=canteenService.selectAll();
	mv.addObject("canteenlist",canteenlist);
		return mv;
	}else {
		List<Canteen> canteenlist=canteenService.searchCanteenByName(searchstr);
		if(canteenlist!=null) 
			 mv.addObject("canteenlist",canteenlist);
	     List<Window> windowlist=windowService.searchWindowByName(searchstr);
		if(windowlist!=null) 
		     mv.addObject("windowlist",windowlist);
			
		List<Dish> dishlist=dishService.searchByDishName(searchstr);
		if(dishlist!=null) 
		     mv.addObject("dishlist", dishlist);
		
	//防止收藏完成后页面刷新导致没有搜索内容；	
		session.setAttribute("canteenlist",canteenlist);
		session.setAttribute("windowlist",windowlist);
		session.setAttribute("dishlist", dishlist);
	}
  return mv;
}
//### ajax 输入出现关键字段
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



//## ajax 页面点击
@ResponseBody
@RequestMapping("/chooseFood/type/{type}/id/{id}.do")//执行查询
public HashMap<String, Object> chooseFood(@PathVariable("type") int type,@PathVariable("id") int id,HttpSession session) {
	HashMap<String, Object> map=new HashMap<String, Object>();
	if(type==0) {
		//点击实体为菜
		Dish dish=dishService.selectByPrimaryKey(id);
		Window window=windowService.selectByPrimaryKey(dish.getWindowId());
		Canteen canteen=canteenService.selectByPrimaryKey(window.getCanteenId());
		map.put("choosen_canteen",canteen);
		map.put("choosen_window",window);
		map.put("choosen_dish", dish);
		
	}else if(type==1) {
		//实体为window
		Window window=windowService.selectByPrimaryKey(id);
		Canteen canteen=canteenService.selectByPrimaryKey(window.getCanteenId());
		map.put("choosen_canteen",canteen);
		map.put("choosen_window",window);
	
	}else {
		//实体为canteen
		Canteen canteen=canteenService.selectByPrimaryKey(id);
		map.put("choosen_canteen",canteen);
	}
	
	session.setAttribute("three_map", map);
	
	return map;
	
}


//## ajax 页面取消收藏

@ResponseBody
@RequestMapping("/cancel_collection/type/{type}/id/{id}.do") 
public HashMap<String, Object> cancel_collection(@PathVariable("type") int type,@PathVariable("id") int id,HttpSession session,Model m) {
	HashMap<String, Object> map=new HashMap<String, Object>();
	User u=(User)session.getAttribute("u");
	int userId=u.getUserId();
	if(type==0) {
		//点击实体为菜
		
		favoriteService.deleteByUserIdAndDishId(id, userId);
		
	}else if(type==1) {
		//实体为window
	
	  
		favoriteService.deleteByUserIdAndWindowId(id, userId);
	
	}else {
		//实体为canteen
		
		favoriteService.deleteByUserIdAndCanteenId(userId, id);
		
	}

	return reshowCanteenPage_ajax(session,m);
	
}

//## ajax 页面收藏
@ResponseBody
@RequestMapping("/collection/type/{type}/id/{id}.do") 
public HashMap<String, Object> collection(@PathVariable("type") int type,@PathVariable("id") int id,HttpSession session,Model m) {
	HashMap<String, Object> map=new HashMap<String, Object>();
	User u=(User)session.getAttribute("u");
	int userId=u.getUserId();
	if(type==0) {
		//点击实体为菜
		FavoriteDish favoriteDish=new FavoriteDish(dishService.selectByPrimaryKey(id),	userId);
		favoriteService.insert(favoriteDish);
		
	}else if(type==1) {
		//实体为window
	
	   FavoriteWindow favoriteWindow=new FavoriteWindow(windowService.selectByPrimaryKey(id),userId);
		favoriteService.insert(favoriteWindow);
	
	}else {
		//实体为canteen
		FavoriteCanteen favoriteCanteen=new FavoriteCanteen(userId, canteenService.selectByPrimaryKey(id));
		favoriteService.insert(favoriteCanteen);
		
	}

	return reshowCanteenPage_ajax(session,m);
	
}

















}
