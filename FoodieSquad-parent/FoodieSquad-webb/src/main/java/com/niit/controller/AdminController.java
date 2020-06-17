package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/admin")
public class AdminController {
//	@Autowired
	// 不可使用
//	private AdminService adminService;
//	@RequestMapping("/selectadmin.do")
//	public String selectadmin() {
//		adminService.selectByPrimaryKey(1);
//		return "hello";
//	}

	@RequestMapping("/test.do")
	public String test() {

		return "admin/adminTest";
	}

	@RequestMapping(value = "/search.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String get() {
		System.out.println("search.do/get");

		return "success";
	}

	@RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody Object add() {
		JSONObject js = new JSONObject();
		js.put("msg", "success");
		System.out.println(js);
		return js;
	}

}
