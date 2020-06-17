package com.niit.service.test;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.niit.pojo.*;
import com.niit.service.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/application*.xml")
public class servicetest {

	@Autowired
	private CanteenService canteenService;

	@Autowired
	private CartService cartService;

	@Autowired
	private DishService dishService;
	
	@Autowired
	private FavoriteService favoriteService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private UserService userService;

	@Autowired
	private WindowService windowService;

	@Autowired
	private HistoryService historyService;
	
	

//@Test
	public void testfavorite() {
		// favoriteService.delectAllFavorites(34);
		// favoriteService.insertFavorite(new Favorite(34, 34));

	}

//@Test
	public void testhistory() {

//	List<HistoryItem> historyItemlist=historyService.selectByUserId(1);
//	for(HistoryItem hi:historyItemlist)
//	System.out.println(hi.getUserId()+" "+hi.getOrderId()+" "+hi.getDishId().getDishName());

		List<HistoryItem> historyItemlist = historyService.selectByOrderId(101);
		for (HistoryItem hi : historyItemlist)
			System.out.println(hi.getUserId() + " " + hi.getOrderId() + " " + hi.getDishId().getDishName());

	}

//@Test
	public void TestCart() {
		// cartService.insert(13);
		// cartService.deleteByPrimaryKey(13);

		// insert1
//		Cart record2=cartService.selectByPrimaryKey(2);
//		List<CartItem>	CartItemlist=record2.getCartItemId();
//		Cart record=new Cart();
//		record.setCartItemId(CartItemlist);
//		cartService.insert(record);
//		//insert
//		Cart record=new Cart();
//		cartService.insert(record);
//		//select
//	Cart record2=cartService.selectByPrimaryKey(2);
//	List<CartItem>	CartItemlist=record2.getCartItemId();
//	for(CartItem c:CartItemlist) {
//		System.out.println(c.getCartId()+" "+c.getDishCount()+" "+c.getDishId().getDishId()+" "+c.getDishId().getDishName());
//	}
//	for(CartItem c:CartItemlist) {
//   		c.setCartItemId(null);
//   		}
//	   //delete
//	    cartService.deleteByPrimaryKey(11);
//        //insert2
//       Cart record=new Cart();
//       record.setCartItemId(CartItemlist);
//       cartService.insert(record);
		// update
//	
//	  
//       record.setCartItemId(CartItemlist);
//       int i= cartService.update(record);
//	   System.out.println(i);

	}
	// @Test

	// @Test
	public void TestCanteen() {
		Canteen c = canteenService.selectByPrimaryKey(1);
		List<Canteen> list = canteenService.selectAll();
		System.out.println(c.getCanteenName());
		for (Canteen m : list) {
			System.out.println(m.getCanteenName());
		}
	}

//@Test
	public void TestOrder() {
		//BigDecimal bigd = new BigDecimal("25");
		// orderService.deleteByPrimaryKey(104, 1, 1);
		// orderService.insert(1, "外卖", 2, bigd, "微信", "海南大学图书馆");
		// orderService.selectAll();
		// orderService.selectByPrimaryKey(101, 1, 1) ;
		// orderService.selectByUserId(1);
		// orderService.selectLatestOrder(1);
		//Order record = orderService.selectLatestOrder(1);
		//orderService.updateByPrimaryKey(record);
	orderService.deleteByUserId(38);
	}

//@Test
	public void TestUser() {
//	for(int i=1;i<9;i++)
//userService.deleteByPrimaryKey(101);
 List<UserTele> userTelelist=new ArrayList<UserTele>();
 List<UserAddress> userAddress=new ArrayList<UserAddress>();
for(int i=1;i<3;i++)
    userTelelist.add(new UserTele(null,"1371418628"+i));
 for(int i=1;i<3;i++)
	userAddress.add(new UserAddress(null,"address1"+i)) ;
 BigDecimal big=new BigDecimal("0");
//User record=new User(10101,null, "10101","123", userTelelist,"m", userAddress,big, 2);
User record=new User("2012839899004", "快递员","1234", userTelelist,"m", userAddress,big, 1);

//User record=new User("2012839899001", "管理员2","123", userTelelist,"m", userAddress,big, 3);

//User record=new User("2012839899001", "用户1","123", userTelelist,"m", userAddress,big, 0);
userService.insert(record);
	}

}
