package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/rider/test")
public class RiderIndexController {
	@RequestMapping("/index.do")
	public String index() {
	return "riderIndexPage";
	}
	@RequestMapping("/login.do")
	public String login() {
	return "riderLoginPage";
	}
	@RequestMapping("/login2.do")
	public String login2() {
	return "riderLoginByIdPwdPage";
	}
	@RequestMapping("/type.do")
	public String type() {
	return "riderTypeCaptchaPage";
	}
}

