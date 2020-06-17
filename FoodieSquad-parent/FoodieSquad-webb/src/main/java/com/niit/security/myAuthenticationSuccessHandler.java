package com.niit.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class myAuthenticationSuccessHandler implements AuthenticationSuccessHandler{
private ObjectMapper objectMapper=new ObjectMapper();
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		Map result =new HashMap();
		result.put("success", true);
		String json=objectMapper.writeValueAsString(result);
	  System.out.println("**************request.getRequestDispatcher(\"/login/selectByUsername.do\").forward(request, response);****************************");
		//request.getRequestDispatcher("");
		response.sendRedirect(request.getContextPath()+"/login/selectByUsername.do");
		
	}

}
