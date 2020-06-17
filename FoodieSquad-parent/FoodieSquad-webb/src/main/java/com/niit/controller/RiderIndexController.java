package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/rider/test")
public class RiderIndexController {
	@RequestMapping("/index.do")
	public String index() {
	return "rider/riderIndexPage";
	}
	@RequestMapping("/login.do")
	public String login() {
	return "rider/riderLoginPage";
	}
	@RequestMapping("/login2.do")
	public String login2() {
	return "rider/riderLoginByIdPwdPage";
	}
	@RequestMapping("/type.do")
	public String type() {
	return "rider/riderTypeCaptchaPage";
	}
}

