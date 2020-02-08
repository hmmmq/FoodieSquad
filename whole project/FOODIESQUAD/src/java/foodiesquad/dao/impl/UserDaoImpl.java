/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao.impl;

import foodiesquad.dao.UserDao;
import foodiesquad.entity.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hmqhmq
 */

public class UserDaoImpl extends BaseDao implements UserDao{

	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		if(user == null) {
			return false;
		}
		String sql="insert into User (uId,uName,uPass,uTele,uGender,uAddress1,uAddress2,uAddress3,uBalance,uType,fId) values(?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
                params.add(user.getuId());
		params.add(user.getuName());
		params.add(user.getuPass());
		params.add(user.getuTele());
		params.add(user.getuGender());
                params.add(user.getuAddress1());
                params.add(user.getuAddress2());
                params.add(user.getuAddress3());
                params.add(user.getuBalance());
                params.add(user.getuType());
                params.add(user.getfId());
		return operUpdate(sql, params);
	}

	@Override
	public boolean delUser(int uId) {
		// TODO Auto-generated method stub
		String sql="delete from User where uId="+uId;
		
		return operUpdate(sql, null);
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		String sql="update User set uName=?,uPass=?,uTele=?,uGender=?,uAddress1=?,uAddress2=?,uAddress3=?,uBalance=?,uType=?,fId=? where uId=?";
		List<Object> params = new ArrayList<Object>();	
		params.add(user.getuName());
		params.add(user.getuPass());
		params.add(user.getuTele());
		params.add(user.getuGender());
                params.add(user.getuAddress1());
                params.add(user.getuAddress2());
                params.add(user.getuAddress3());
                params.add(user.getuBalance());
                params.add(user.getuType());
                params.add(user.getfId());
                params.add(user.getuId());
		return operUpdate(sql,params);
	}

	@Override
	public User queryUser(User user) {
		// TODO Auto-generated method stub
		String sql = "select * from User where uName=? and uPass=? and uType=?";
		List<Object> params = new ArrayList<Object>();
		params.add(user.getuName());
		params.add(user.getuPass());
		params.add(user.getuType());
		List<User> list = null;
		try {
			list = operQuery(sql,params,User.class);			
			if(list.size() == 0){
                               System.out.println("没找到！");
				return null;
			}else{
                            System.out.println("找到了！");
				return list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User queryUserByName(String uName) {
		// TODO Auto-generated method stub
		String sql = "select uId from User where uName=? ";
		List<Object> params = new ArrayList<Object>();
		params.add(uName);
		List<User> list = null;
		try {
			list = operQuery(sql,params,User.class);

			if(list.size() == 0){
				return null;
			}else{
				return list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public boolean updateUserPass(User user,String pass) {
		// TODO Auto-generated method stub
		String sql="update User set uPass=? where uName=?";
		List<Object> params = new ArrayList<Object>();
		params.add(pass);
		params.add(user.getuName());
		return operUpdate(sql,params);
	}

	@Override
	public User queryUserByid(int uid) {
		// TODO Auto-generated method stub
		String sql="select * from User where uId="+uid;
		List<User> list=null;
		try {
			list = operQuery(sql, null,User.class);
			if(list.size() == 0){
				return null;
			}else{
				return list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
        public User queryUserByTele(String Tele) {
		// TODO Auto-generated method stub
		String sql="select * from User where uTele="+Tele;
		List<User> list=null;
		try {
			list = operQuery(sql, null,User.class);
			if(list.size() == 0){
				return null;
			}else{
				return list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

    
}
