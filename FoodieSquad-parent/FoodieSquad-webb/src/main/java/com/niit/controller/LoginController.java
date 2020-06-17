package com.niit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.niit.exception.RecordNotFoundException;
import com.niit.pojo.Dish;
import com.niit.pojo.Favorite;
import com.niit.pojo.FavoriteCanteen;
import com.niit.pojo.FavoriteDish;
import com.niit.pojo.FavoriteWindow;
import com.niit.pojo.HistoryItem;
import com.niit.pojo.Order;
import com.niit.pojo.User;
import com.niit.pojo.UserTele;
import com.niit.service.FavoriteService;
import com.niit.service.HistoryService;
import com.niit.service.OrderService;
import com.niit.service.UserService;
import com.niit.util.ProcessTime;

@SessionAttributes(value="{u}",types= {User.class})
@Controller
@RequestMapping("/login")
public class LoginController {
	
@Autowired
UserService userService;
@Autowired
OrderService orderService;
@Autowired
private FavoriteService favoriteService;

@Autowired
private HistoryService historyService;
private ProcessTime processTime=new ProcessTime();

public String select(User u,Model m,HttpSession session) {
	session.setMaxInactiveInterval(60*60*24);
	int userId=u.getUserId();
	List<FavoriteCanteen>	fcl=favoriteService.selectFavoriteCanteenByUserId(userId);
	List<FavoriteWindow> fwl=favoriteService.selectFavoriteWindowByUserId(userId);
    List<FavoriteDish>  fdl=favoriteService.selectFavoriteDishByUserId(userId);
	String date=processTime.getStringNowTimeWithDate();
	List<HistoryItem> historyItemlist=historyService.selectByUserId(u.getUserId());
	session.setAttribute("historyItemlist", historyItemlist);
		for(HistoryItem hi:historyItemlist)
			System.out.println(hi.getUserId()+" "+hi.getOrderId()+" "+hi.getDishId().getDishName());
	m.addAttribute("historyItemlist", historyItemlist);
	session.setAttribute("historyItemlist", historyItemlist);
	m.addAttribute("u", u);
	m.addAttribute("date", date);
	
 return "user/homePage";
}
@RequestMapping(value="/selectByMobile.do")
public String selectByusername(@Param("mobile") String mobile,Model m,HttpSession session) {
	UserTele ut=userService.selectUserIdByUserTele(mobile);
	int userId=ut.getUserId();
	session.setAttribute("userId", userId);
	User u=userService.selectByPrimaryKey(userId);
	session.setAttribute("userphone", mobile);
	return select(u,m,session);
}
@RequestMapping(value="/selectByUsername.do")
public String selectByUsername(@Param("username") String username,Model m,HttpSession session) {
	if(username==null) {
		System.out.println("999999999999999999999999999999999999999999999999999999");
		username=(String)session.getAttribute("username");
		System.out.println("999999999999999999999999999999999999999999999999999999"+username);
	}
	User u = userService.selectByStuNum(username); 
	session.setAttribute("u", u);
	return select(u,m,session);
}

@RequestMapping(value="usePhone.do")
	public String usePhone() {
		return "user/login/loginPage";
}


	@RequestMapping(value="useStuNumber.do")
public String useStuNumber() {
	return "user/login/loginByIdPwdPage";
}

}
