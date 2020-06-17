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

public class myAuthenticationSuccessHandler2 implements AuthenticationSuccessHandler{
private ObjectMapper objectMapper=new ObjectMapper();
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		Map result =new HashMap();
		result.put("success", true);
		String json=objectMapper.writeValueAsString(result);
	   // response.setContentType("text/json;charset=utf-8");
	   // response.getWriter().write(json);	
		request.getRequestDispatcher("/typeCaptcha/test.do").forward(request, response);
	}

}
