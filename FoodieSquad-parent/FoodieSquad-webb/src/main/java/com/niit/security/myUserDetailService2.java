package com.niit.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.niit.mapper.UserMapper;
import com.niit.mapper.UserTeleMapper;
import com.niit.pojo.Permission;
import com.niit.pojo.User;
import com.niit.pojo.UserTele;

public class myUserDetailService2 implements UserDetailsService {
	{
		System.out.println("---------------------注入2------------------------------");
	}
private Logger logger=Logger.getLogger(myUserDetailService.class);
	@Autowired
	private UserMapper userMapper;
	@Autowired 
	private UserTeleMapper userTeleMapper;
	
	public UserDetails loadUserByUsername(String mobile) throws UsernameNotFoundException {  
		User u= new User();
	System.out.println("--------------entering2-------------------------------------------------------------------------------------------------------------------------------");
	UserTele ut=userTeleMapper.selectUserIdByUserTele(mobile);
	 if(ut==null) {
		  System.out.println("new user!");
			u=  userMapper.selectByPrimaryKey(0);
		}else { 
			u=  userMapper.selectByPrimaryKey(ut.getUserId());
		}
		  
	 String username= u.getUsername();
	 
		System.out.println("String username"+username);
		com.niit.pojo.User user= userMapper.findByUsername(username);
			  List<Permission> pl= userMapper.findPermissionByUsername(username);
			  List<GrantedAuthority> authorities =new ArrayList<GrantedAuthority>();
			  for(Permission p:pl) {
				  GrantedAuthority authority=new SimpleGrantedAuthority(p.getPermtag());
				  authorities.add(authority);
			  }
			  user.setAuthorities(authorities);
			  logger.info("当前用户："+user);	
		return user; 
	}
	
}