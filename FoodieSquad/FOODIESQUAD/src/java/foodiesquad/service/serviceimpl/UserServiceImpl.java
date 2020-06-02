/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package foodiesquad.service.serviceimpl;

import foodiesquad.dao.UserDao;
import foodiesquad.dao.impl.UserDaoImpl;
import foodiesquad.entity.User;
import foodiesquad.service.UserService;

/**
 *
 * @author hmqhmq
 */
public class UserServiceImpl implements UserService{

   private UserDao mUserDao;
	public UserServiceImpl() {
		mUserDao=new UserDaoImpl();				
	}
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return mUserDao.queryUser(user);
	}
    

	public int register(User user) {
		// TODO Auto-generated method stub
		User u = mUserDao.queryUserByName(user.getuName());
		if (u == null) {
			boolean res_add = mUserDao.addUser(user);
			if (res_add) {
				return 1;//注册成功
			} else {
				return 2;//注册失败
			}

		}
		return 3;//注册失败-用户名已存在
	}
     

	@Override
	public User queryUserByName(String uName) {
		// TODO Auto-generated method stub
		return mUserDao.queryUserByName(uName);
	}
	@Override
	public boolean updateUserPass(User user,String pass) {
		// TODO Auto-generated method stub
		return mUserDao.updateUserPass(user,pass);
	}
	@Override
	public User queryUser(User user) {
		// TODO Auto-generated method stub
		return mUserDao.queryUser(user);
	}
	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return mUserDao.updateUser(user);
	}
	@Override
	public User queryUserByid(int uid) {
		// TODO Auto-generated method stub
		return mUserDao.queryUserByid(uid);
	}
          public User queryUserByTele(String Tele) {
              return mUserDao.queryUserByTele(Tele);}

    @Override
    public boolean addUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delUser(int uid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
 
}
   
