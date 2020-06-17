package com.niit.security;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.niit.mapper.UserMapper;
import com.niit.pojo.Permission;

public class myUserDetailService implements UserDetailsService {
	{
		System.out.println("---------------------注入------------------------------");
	}
private Logger logger=Logger.getLogger(myUserDetailService.class);
	@Autowired
	private UserMapper userMapper;
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {  
		System.out.println("--------------entering-------------------------------------------------------------------------------------------------------------------------------");
		 
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