package foodiesquad.service;

import foodiesquad.entity.User;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hmqhmq
 */
public interface UserService {
        public boolean addUser(User user);//增加增加用户，参数为用户实体，返回布尔变量
	public boolean delUser(int uid);//删除用户，参数为用户id，返回布尔变量
	public boolean updateUser(User user);//更新用户,参数为用户实体，返回布尔变量
	public boolean updateUserPass(User user ,String pass);//更新用户密码，参数为用户实体和密码，返回布尔变量
        public User login(User user);//登录用户 public int register(User user);//注册用户
        public User queryUser(User user);//返回用户
	public User queryUserByName(String uName);//根据名字查找id
	public User queryUserByid(int uId);//根据id查找用户
         public User queryUserByTele(String Tele);
}
