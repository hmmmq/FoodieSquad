package com.niit.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.pojo.User;
import com.niit.service.UserService;

@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	UserService userservice;
	@RequestMapping("/test.do")
	public String test(HttpSession session,HttpServletRequest request) {
		User u=(User)session.getAttribute("u");
		if(u==null) {
			if(isRememberMeAuthenticated()) {
				session.setAttribute("username", getUser());
				System.out.println("7777777777777777777777777777777777"+getUser());
				 return "redirect:/login/selectByUsername.do";
			   	
			}
			else
				return "user/login/indexPage";}
	
		else
    return "redirect:/home/test.do";
	}
	
	
	private String getUser() {
		
		  Authentication authentication = SecurityContextHolder.getContext()
	                .getAuthentication();
		String username=authentication.getName();
		return username;
		
	}
	/**
     * 判断用户是否从Remember Me Cookie自动登录
     * @return
     */
    private boolean isRememberMeAuthenticated() {

        Authentication authentication = SecurityContextHolder.getContext()
                .getAuthentication();
        if (authentication == null) {
            return false;
        }

        return RememberMeAuthenticationToken.class
                .isAssignableFrom(authentication.getClass());
    }
}
