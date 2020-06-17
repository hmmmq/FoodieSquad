package com.niit.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class myAutheticationFailedHandler implements AuthenticationFailureHandler{
	private ObjectMapper objectMapper=new ObjectMapper();
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		Map result =new HashMap();
		result.put("success", false);
		String json=objectMapper.writeValueAsString(result);
	    response.setContentType("text/json;charset=utf-8");
	    response.getWriter().write(json);	
		
	}

}
