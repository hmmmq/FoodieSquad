package com.niit.controller;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.niit.pojo.UserAddress;
import com.niit.pojo.UserTele;
import com.niit.service.UserService;
import com.niit.util.UserUtil;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
		mv.setViewName("user/personalCenterPage");
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
		mv.setViewName("user/addUserAddress");
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
		mv.setViewName("user/editUserAddress");
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
		mv.setViewName("user/modifyInfo");
		mv.addObject("user",u);
		mv.addObject("userpassword",u.getUserPassword());
		mv.addObject("userphone",userTeleList.get(0).getUserTele());
		return mv;
	}
	
	@RequestMapping("/modify.do")
	public String modify(HttpSession session,HttpServletRequest request, ServletResponse response) {
		User u=(User)session.getAttribute("u");
		UserTele userTeleObject = userService.selectuserTeleByUserId(u.getUserId()).get(0);
		String pwd=request.getParameter("userpassword");
		String userName=request.getParameter("username");
		String usrTele=request.getParameter("userphone");
		u.setUserName(userName);
		PasswordEncoder passwordwordEncoder=new BCryptPasswordEncoder();
    	u.setUserPassword(passwordwordEncoder.encode(pwd));
		userTeleObject.setUserTele(usrTele);
		userService.updateByPrimaryKey(u);
		userService.updateuserTeleByPrimaryKey(userTeleObject);
		session.invalidate();
		
		return "redirect:/personalCenter/logout.do";
		
		
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("user/login/indexPage");
		return mv;
	}
	@RequestMapping("/deleteAccount.do")
	public String deleteAccount(HttpSession session,HttpServletRequest request, ServletResponse response) {
		User u=(User)session.getAttribute("u");
		userService.deleteByPrimaryKey(u.getUserId());
		session.invalidate();
		return "redirect:/personalCenter/logout.do";
		
	}
}
