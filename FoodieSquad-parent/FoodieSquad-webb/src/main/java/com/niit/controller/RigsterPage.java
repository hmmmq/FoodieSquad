package com.niit.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.pojo.User;
import com.niit.pojo.UserAddress;
import com.niit.pojo.UserTele;
import com.niit.service.UserService;

@Controller
@RequestMapping("/register")
public class RigsterPage {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/register.do")
	public ModelAndView register(@Param("userPhone") String userPhone) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("user/registerPage");
	    mv.addObject("userPhone", userPhone);
		return mv;
	}
	@RequestMapping("/submit.do")
	public ModelAndView submit(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		User user=new User();
		user.setUserName(request.getParameter("username"));
		user.setUserPassword(request.getParameter("password"));
		user.setUserStudentNum(request.getParameter("stunum"));
		user.setUserGender(request.getParameter("gender"));
		UserAddress userAddress=new UserAddress();
		userAddress.setUserAddress(request.getParameter("address"));
		UserTele userTele=new UserTele();
		userTele.setUserTele(request.getParameter("tel"));
		List<UserAddress> userAddressList=new ArrayList<UserAddress>();
		List<UserTele> userTeleList=new ArrayList<UserTele>();
		userAddressList.add(userAddress);
		userTeleList.add(userTele);
		user.setUserAddress(userAddressList);
		user.setUserTele(userTeleList);
		user.setUserType(0);
		user.setEnabled(true);
		user.setAccountNonExpired(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		
		BigDecimal userBalance=new BigDecimal(100);
		user.setUserBalance(userBalance);
		int status=userService.insert(user);
		if(status==0) {
			System.out.println("手机号已经被注册或注册成功啦！");
			mv.setViewName("user/alreadyhavephone");
			return mv;
		}else {
			mv.setViewName("user/loginPage");
			return mv;
		}
		
	}
}
