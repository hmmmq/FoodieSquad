package com.niit.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String submit(@ModelAttribute("user")User user,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		PasswordEncoder passwordwordEncoder=new BCryptPasswordEncoder();
    	user.setUserPassword(passwordwordEncoder.encode(user.getUserPassword()));
		user.setPassword(user.getUserPassword());
		user.setUsername(user.getUserStudentNum());
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
			return "user/alreadyhavephone";
			
		}else {
			return "redirect:/personalCenter/logout.do";
			
		}
		
	}
}
