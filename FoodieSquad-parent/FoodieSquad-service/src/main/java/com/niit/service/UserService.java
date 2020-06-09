package com.niit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.mapper.CartMapper;
import com.niit.mapper.CommentsMapper;
import com.niit.mapper.FavoriteMapper;
import com.niit.mapper.HistoryItemMapper;
import com.niit.mapper.OrderMapper;
import com.niit.mapper.UserAddressMapper;
import com.niit.mapper.UserMapper;
import com.niit.mapper.UserTeleMapper;
import com.niit.pojo.Cart;
import com.niit.pojo.Favorite;
import com.niit.pojo.FavoriteCanteen;
import com.niit.pojo.Order;
import com.niit.pojo.User;
import com.niit.pojo.UserAddress;
import com.niit.pojo.UserTele;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserAddressMapper userAddressMapper;
	@Autowired
	private UserTeleMapper userTeleMapper;
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private CartService cartService;
	@Autowired
	private HistoryItemMapper historyitemMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private FavoriteMapper favoriteMapper;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private CommentsMapper commentsMapper;
	
	

	public int deleteByPrimaryKey(Integer userId) {
		commentsMapper.deleteByUserId(userId);
		userAddressMapper.deleteByUserId(userId);
		userTeleMapper.deleteByUserId(userId);
		cartMapper.deleteByPrimaryKey(userId);
		cartService.cleanByPrimaryKey(userId);
		historyitemMapper.deleteHistoryItemByUserId(userId);
		orderMapper.deleteByUserId(userId);
		favoriteService.delectAllFavorites(userId);
		return userMapper.deleteByPrimaryKey(userId);
	}

	public int insert(User record) {
		int userId;
		UserTele oldusertele = selectUserIdByUserTele(record.getUserTele().get(0).getUserTele());
		if (oldusertele != null) {
			System.out.println("已有用户注册！");
			return 0;
		}
		User u =new User(record.getUserStudentNum(), record.getUserName(), record.getUserPassword(), record.getUserGender(), record.getUserBalance(), record.getUserType());
	   User u2=new User();
		
		
		//商家 id即为windowid 10101~79999
		if(u.getUserType()==2) {
			
			userId = record.getUserId();
	    	   
	    	  }else if(u.getUserType()==3) {//管理员 50～100为管理员
				List<User> adminlist=userMapper.selectByUserType(3);
				if(adminlist.size()!=0) {
					u2= adminlist.get(adminlist.size() - 1);
					userId = u2.getUserId()+1;
					
				
				}else {
					userId=50;
					
				}
				
			
			}
		else if(u.getUserType()==1) {//快递员 101～1000为快递员
			
			List<User> driverlist=userMapper.selectByUserType(1);
			if(driverlist.size()!=0) {
				u2= driverlist.get(driverlist.size() - 1);
				userId = u2.getUserId()+1;
				
			}else {
				System.out.println("第一个快递员");
				userId=101;
				}
		
			
			
			}
			else {//用户1~49,1001～10100 、 80000～+）
				List<User> userlist=userMapper.selectByUserType(0);
				if(userlist.size()!=0) {
					 userlist=userMapper.selectByUserType(0);
						u2= userlist.get(userlist.size() - 1);
						userId = u2.getUserId()+1;
					//如果userId破10101，自动跳过商家id
						if(userId==10101) {
							userId=80000;
						}else if(userId==50){
							userId=1001;
						}
					
					
				}else {userId=1;}
		
			}
		u.setUserId(userId);
		
		userMapper.insert(u);
		
		// 自动增加主键，自动在相关表中插入数据；
		favoriteMapper.insert(new Favorite(userId, userId));
		cartService.insert(userId);
		List<UserAddress> UserAddresslist = record.getUserAddress();
		List<UserTele> UserTelelist = record.getUserTele();
		int userAddressId;
		int userTeleId;
		for (UserAddress userAddress : UserAddresslist) {
			userAddressId = getUserAddressLatestIdByUserId(userId);
			System.out.println(userAddressId);
			userAddress.setUserAddressId(userAddressId);
			userAddress.setUserId(userId);
			userAddressMapper.insert(userAddress);
		}

		for (UserTele userTele : UserTelelist) {
			userTeleId = getUserTeleLatestIdByUserId(userId);
			userTele.setUserTeleId(userTeleId);
			userTele.setUserId(userId);
			userTeleMapper.insert(userTele);
		}
		return 1;
	}

	public User selectByPrimaryKey(Integer userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	public List<User> selectAll() {
		return userMapper.selectAll();
	}

	public	List<User> selectByUserType(Integer userType) {
		return userMapper.selectByUserType(userType);
	}

	public int updateByPrimaryKey(User record) {

		return userMapper.updateByPrimaryKey(record);
	}

	public int deleteuserAddressByPrimaryKey(@Param("userAddressId") Integer userAddressId,
			@Param("userId") Integer userId) {
		return userAddressMapper.deleteByPrimaryKey(userAddressId, userId);
	}

	public int insertuserAddress(UserAddress record) {
		return userAddressMapper.insert(record);
	}

	public UserAddress selectuserAddressByPrimaryKey(@Param("userAddressId") Integer userAddressId,
			@Param("userId") Integer userId) {
		return userAddressMapper.selectByPrimaryKey(userAddressId, userId);
	}

	public List<UserAddress> selectuserAddressByUserId(@Param("userId") Integer userId) {
		return userAddressMapper.selectByUserId(userId);
	}

	public int updateuserAddressByPrimaryKey(UserAddress record) {
		return userAddressMapper.updateByPrimaryKey(record);
	}

	public int deleteuserTeleByPrimaryKey(@Param("userTeleId") Integer userTeleId, @Param("userId") Integer userId) {
		return userTeleMapper.deleteByPrimaryKey(userTeleId, userId);
	}

	public int insertuserTele(UserTele record) {
		return userTeleMapper.insert(record);
	}

	public UserTele selectuserTeleByPrimaryKey(@Param("userTeleId") Integer userTeleId,
			@Param("userId") Integer userId) {
		return userTeleMapper.selectByPrimaryKey(userTeleId, userId);
	}

	public List<UserTele> selectuserTeleByUserId(@Param("userId") Integer userId) {
		return userTeleMapper.selectByUserId(userId);
	}

	public int updateuserTeleByPrimaryKey(UserTele record) {
		// 不可更新电话和地址
		return userTeleMapper.updateByPrimaryKey(record);
	}
	
	
	public int insertUserAddressByUserId(int userId,String userAddressString) {
		UserAddress userAddress=new UserAddress(userId, userAddressString);
	    int	userAddressId = getUserAddressLatestIdByUserId(userId);
		System.out.println(userAddressId);
		userAddress.setUserAddressId(userAddressId);
	    userAddressMapper.insert(userAddress);  
		return 1;
	}
	
    public int insertUserTeleByUserId(int userId,String userTeleString) {
    	UserTele userTele=new UserTele(userId, userTeleString);
        int	userTeleId = getUserTeleLatestIdByUserId(userId);
		userTele.setUserTeleId(userTeleId);
	    userTeleMapper.insert(userTele);
		return 1;
	}

	private Integer getUserAddressLatestIdByUserId(int userId) {
		List<UserAddress> list = userAddressMapper.selectByUserId(userId);
		System.out.println(list.size());
		if (list.size() == 0) {
			String num = userId + "00";
			int a = Integer.parseInt(num);
			return a + 1;
		} else {
			UserAddress o = list.get(list.size() - 1);
			return o.getUserAddressId() + 1;
		}

	}

	private Integer getUserTeleLatestIdByUserId(int userId) {
		List<UserTele> list = userTeleMapper.selectByUserId(userId);
		System.out.println(list.size());
		if (list.size() == 0) {
			String num = userId + "00";
			int a = Integer.parseInt(num);
			return a + 1;
		} else {
			UserTele o = list.get(list.size() - 1);

			return o.getUserTeleId() + 1;
		}

	}

	public UserTele selectUserIdByUserTele(String userTele) {
		return userTeleMapper.selectUserIdByUserTele(userTele);
	}

	public User selectByStuNumAndPwd(@Param("userStudentNum") String userStudentNum,
			@Param("userPassword") String userPassword) {
		return userMapper.selectByStuNumAndPwd(userStudentNum, userPassword);
	}

}
