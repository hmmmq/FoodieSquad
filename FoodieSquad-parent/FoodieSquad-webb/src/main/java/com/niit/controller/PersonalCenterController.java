package com.niit.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.niit.pojo.UserAddress;
import com.niit.pojo.UserTele;
import com.niit.service.UserService;
import com.niit.util.UserUtil;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/personalCenter")
public class PersonalCenterController {
	@Autowired
	UserService userService;
	
	@RequestMapping("/test.do")
	public ModelAndView test(HttpSession session) {
		User u=(User)session.getAttribute("u");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("personalCenterPage");
		mv.addObject("user", u);
		List<UserTele> userTeleList = userService.selectuserTeleByUserId(u.getUserId());
		List<UserAddress> userAddressList=userService.selectuserAddressByUserId(u.getUserId());
		List<UserUtil> userUtilList=new ArrayList<UserUtil>();
		int t=0;
		int teleSize=userTeleList.size();
		int addressSize=userAddressList.size();
		if((teleSize==0)||(addressSize==0)) {
			mv.addObject("userUtilList", null);
		}
		else {
			if(teleSize>addressSize)
			{
				t=teleSize-addressSize;
				for(int i=0;i<addressSize;i++)
				{
					UserUtil uu=new UserUtil(u);
					uu.setUserAddress(userAddressList.get(i));
					uu.setUserTele(userTeleList.get(i));
					userUtilList.add(uu);
					
				}
				for(int i=addressSize;i<teleSize;i++)
				{
					UserUtil uu=new UserUtil(u);
					uu.setUserAddress(userAddressList.get(0));
					uu.setUserTele(userTeleList.get(i));
					userUtilList.add(uu);
				}
			}
			else if(teleSize==addressSize)
			{
				for(int i=0;i<addressSize;i++)
				{
					UserUtil uu=new UserUtil(u);
					uu.setUserAddress(userAddressList.get(i));
					uu.setUserTele(userTeleList.get(i));
					userUtilList.add(uu);
					
				}
			}
			else
			{
				t=addressSize-teleSize;
				for(int i=0;i<teleSize;i++)
				{
					UserUtil uu=new UserUtil(u);
					uu.setUserAddress(userAddressList.get(i));
					uu.setUserTele(userTeleList.get(i));
					userUtilList.add(uu);
					
				}
				for(int i=teleSize;i<addressSize;i++)
				{
					UserUtil uu=new UserUtil(u);
					uu.setUserAddress(userAddressList.get(i));
					uu.setUserTele(userTeleList.get(0));
					userUtilList.add(uu);
				}
			}
			mv.addObject("userUtilList", userUtilList);
		}
		return mv;
	}
	
	
	@RequestMapping("/addUserAddress.do")
	public ModelAndView addUserAddress(HttpSession session){
		User u=(User)session.getAttribute("u");
		ModelAndView mv=new ModelAndView();
		mv.addObject("user",u);
		mv.setViewName("addUserAddress");
		return mv;
	}
	
	
	@RequestMapping("/addAddress.do")
	public ModelAndView addAddress(HttpSession session,HttpServletRequest request){
		User u=(User)session.getAttribute("u");
		
		UserTele userTele=new UserTele();
		UserAddress userAddress=new UserAddress();
		userTele.setUserId(u.getUserId());
		userAddress.setUserId(u.getUserId());
		userTele.setUserTele(request.getParameter("userphone"));
		userAddress.setUserAddress(request.getParameter("address"));
		userService.insertuserAddress(userAddress);
		userService.insertuserTele(userTele);
		ModelAndView mv=new ModelAndView();

		return test(session);
	}
	
	
	@RequestMapping("/editUserAddress.do")
	public ModelAndView editUserAddress(@Param("teleId") Integer teleId,@Param("addressId") Integer addressId,HttpSession session){
		User u=(User)session.getAttribute("u");
		UserAddress userAddress=userService.selectuserAddressByPrimaryKey(addressId, u.getUserId());
		UserTele userTele=userService.selectuserTeleByPrimaryKey(teleId, u.getUserId());
		ModelAndView mv=new ModelAndView();
		mv.addObject("user",u);
		mv.addObject("tele", userTele.getUserTele());
		mv.addObject("address", userAddress.getUserAddress());
		mv.addObject("teleId", userTele.getUserTeleId());
		mv.addObject("addressId", userAddress.getUserAddressId());
		mv.setViewName("editUserAddress");
		return mv;
	}
	
	@RequestMapping("/editAddress.do")
	public ModelAndView editAddress(HttpSession session,HttpServletRequest request){
		User u=(User)session.getAttribute("u");
		
		UserTele userTele=new UserTele();
		UserAddress userAddress=new UserAddress();
		userTele.setUserId(u.getUserId());
		userAddress.setUserId(u.getUserId());
		userTele.setUserTele(request.getParameter("userphone"));
		userAddress.setUserAddress(request.getParameter("address"));
		userTele.setUserTeleId(Integer.parseInt(request.getParameter("teleId")));
		userAddress.setUserAddressId(Integer.parseInt(request.getParameter("addressId")));
		userService.updateuserAddressByPrimaryKey(userAddress);
		userService.updateuserTeleByPrimaryKey(userTele);
		ModelAndView mv=new ModelAndView();
		return test(session);
	}
	
	
	
	
	@RequestMapping("/modifyInfo.do")
	public ModelAndView modifyInfo(HttpSession session) {
		User u=(User)session.getAttribute("u");
		List<UserTele> userTeleList = userService.selectuserTeleByUserId(u.getUserId());
		ModelAndView mv=new ModelAndView();
		mv.setViewName("modifyInfo");
		mv.addObject("user",u);
		mv.addObject("userpassword",u.getUserPassword());
		mv.addObject("userphone",userTeleList.get(0).getUserTele());
		return mv;
	}
	
	@RequestMapping("/modify.do")
	public ModelAndView modify(HttpSession session,HttpServletRequest request) {
		User u=(User)session.getAttribute("u");
		UserTele userTeleObject = userService.selectuserTeleByUserId(u.getUserId()).get(0);
		String pwd=request.getParameter("userpassword");
		String userName=request.getParameter("username");
		String usrTele=request.getParameter("userphone");
		u.setUserName(userName);
		u.setUserPassword(pwd);
		userTeleObject.setUserTele(usrTele);
		userService.updateByPrimaryKey(u);
		userService.updateuserTeleByPrimaryKey(userTeleObject);
		session.invalidate();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("indexPage");
		return mv;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("indexPage");
		return mv;
	}
	@RequestMapping("/deleteAccount.do")
	public ModelAndView deleteAccount(HttpSession session) {
		User u=(User)session.getAttribute("u");
		userService.deleteByPrimaryKey(u.getUserId());
		session.invalidate();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("indexPage");
		return mv;
	}
	
//	@RequestMapping("/test.do")
//	public ModelAndView test(HttpSession session) {
//	    User u=(User)session.getAttribute("u");
//		ModelAndView mv=new ModelAndView();
//		mv.setViewName("personalCenterPage");
////		if(flag.equals("home")){    //从homePage.jsp过来的
//			System.out.println(u.getUserId());//39
//			String username = userService.selectByPrimaryKey(u.getUserId()).getUserName();
//			List<UserTele> userTeleList = userService.selectuserTeleByUserId(u.getUserId());
//			List<Map<String,String>> infoList=new LinkedList<Map<String, String>>();
//			for (int i=0;i<userTeleList.size();i++) {
//				Map<String,String> info=new HashMap<String, String>();
//				info.put("username",username);
//				for (UserTele userTele : userTeleList) {
//					info.put("userphone",userTele.getUserTele());
//					String address = userService.selectuserAddressByPrimaryKey(userTele.getUserTeleId(), u.getUserId()).getUserAddress();
//					info.put("address",address);
//				}
//				infoList.add(info);
//			}
//			mv.addObject("u",u);
//			session.setAttribute("infoList",infoList);
//			mv.addObject("infoList",infoList);
//     System.out.println(mv);
//		return mv;
//	}
//
//	@RequestMapping("/modifyInfo.do")
//	public ModelAndView modifyInfo(HttpSession session) {
//		User u=(User)session.getAttribute("u");
//		List<UserTele> userTeleList = userService.selectuserTeleByUserId(u.getUserId());
//		String userphone=userService.selectuserTeleByPrimaryKey(userTeleList.get(0).getUserTeleId(),u.getUserId()).getUserTele();
//		ModelAndView mv=new ModelAndView();
//		mv.setViewName("hello");
//		mv.addObject("u",u);
//		String pwd="";
//		for(int i=0;i<u.getUserPassword().length();i++) pwd+="*";
//		mv.addObject("userpassword",pwd);
//		mv.addObject("userphone",userphone);
//		return mv;
//	}
//	@RequestMapping("/addUserAddress.do")
//	public ModelAndView addUserAddress(HttpSession session){
//		User u=(User)session.getAttribute("u");
//		ModelAndView mv=new ModelAndView();
////		List<User> infoList= (List<User>) ;
//		if(session.getAttribute("infoList")==null){
//			Map<Integer,List<User>> map = new HashMap<Integer, List<User>>();
//			List<User> infoList = (List<User>) new UserService().selectByPrimaryKey(u.getUserId());
//			map.put(u.getUserId(),infoList);
//			session.setAttribute("infoList",infoList);
//			mv.addObject("infoList",infoList);
//		}else{
//			List<User> infoList= (List<User>) session.getAttribute("infoList");
//			mv.addObject("infoList",infoList);
//		}
//		mv.addObject("u",u);
//		mv.setViewName("addUserAddress");
//		return mv;
//	}
//
//	@RequestMapping("/addUserAddressHandle.do")
//	public void addUserAddressHandle(@Param("user")User user, HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
//		userService.insert(user);
//		req.getRequestDispatcher("/test.do?flag=addAddress").forward(req,resp);
//	}
//
//	@RequestMapping("/editUserAddress.do")
//	public ModelAndView editUserAddress(@Param("username")String username,@Param("userphone") String userphone,@Param("address")String address,@Param("index") int index, HttpSession session){
//		User u=(User)session.getAttribute("u");
//		ModelAndView mv=new ModelAndView();
//		List<User> infoList= (List<User>) session.getAttribute("infoList");
//		mv.addObject("username",username);
//		mv.addObject("userphone",userphone);
//		mv.addObject("address",address);
//		mv.addObject("index",index);
//		mv.addObject("infoList",infoList);
//		mv.addObject("u",u);
//		mv.setViewName("editUserAddress");
//		return mv;
//	}
//
//	@RequestMapping("/editUserAddressHandle.do")
//	public String editUserAddressHandle(@Param("user")User user, HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
//		userService.updateByPrimaryKey(user);
//		return "redirect:/personalCenter/test.do?flag=editUser";
//	}
//	
//	@RequestMapping("/logout.do")
//	public ModelAndView logout(HttpSession session) {
//		session.invalidate();
//		ModelAndView mv=new ModelAndView();
//		mv.setViewName("loginPage");
//		return mv;
//	}
//
//	@RequestMapping("/deleteAccount.do")
//	public ModelAndView deleteAccount(HttpSession session) {
//		User u=(User)session.getAttribute("u");
//		userService.deleteByPrimaryKey(u.getUserId());
//		session.invalidate();
//		ModelAndView mv=new ModelAndView();
//		mv.setViewName("indexPage");
//		return mv;
//	}
//弃用
//	@RequestMapping("/modifyInfoHandle.do")
//	public ModelAndView modifyInfoHandle(String username,String userpassword,HttpSession session) throws ServletException, IOException {
//	ModelAndView mv=new ModelAndView();
//	System.out.println("--------------in----------------");
//	mv.setViewName("hello");
////		User u = (User) session.getAttribute("u");
////		u.setUserName(username);
////		u.setUserPassword(userpassword);
////		userService.updateByPrimaryKey(u);
////		session.setAttribute("u",u);
////		System.out.println("-------------------------enter-------------------------------------");
////    mv.setViewName("personalCenterPage");
////        List<UserTele> userTeleList = userService.selectuserTeleByUserId(u.getUserId());
////		List<Map<String,String>> infoList=new LinkedList<Map<String, String>>();
////		for (int i=0;i<userTeleList.size();i++) {
////		Map<String,String> info=new HashMap<String, String>();
////		info.put("username",username);
////		for (UserTele userTele : userTeleList) {
////					info.put("userphone",userTele.getUserTele());
////					String address = userService.selectuserAddressByPrimaryKey(userTele.getUserTeleId(), u.getUserId()).getUserAddress();
////					info.put("address",address);
////				}
////				infoList.add(info);
////			}
////		mv.addObject("u",u);
////	    session.setAttribute("infoList",infoList);
////		mv.addObject("infoList",infoList);
////	   System.out.println("------------------------end----------------------");
////		System.out.println(mv);
//	return mv;
//
//	
//	}
}
