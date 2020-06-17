package com.niit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class myLogoutSuccessHandler implements  LogoutSuccessHandler {
	{
		System.out.println("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
		System.out.println("register");
		System.out.println("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
	}

	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		request.getRequestDispatcher("/index/test.do").forward(request, response);
		// TODO Auto-generated method stub
		
		System.out.println("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
		System.out.println("logout");
		System.out.println("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
		
	}

}
