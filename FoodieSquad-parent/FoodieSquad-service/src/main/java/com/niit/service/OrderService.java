package com.niit.service;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.mapper.OrderMapper;

import com.niit.pojo.Order;


@Service 
public class OrderService {
	@Autowired
	private OrderMapper orderMapper;
	
	public int deleteByUserId(@Param("userId") Integer userId) {
		return orderMapper.deleteByUserId(userId);
	}
	
	public int deleteByPrimaryKey(@Param("orderId") Integer orderId, @Param("userId") Integer userId) {
		
		 return orderMapper.deleteByPrimaryKey(orderId, userId);
	 }

	 public  int insert(Order record){
		 //具体用法参见测试 自动填充下单时间
            int orderId=getOrderLatestIdByUserId(record.getUserId());
	    	record.setOrderId(orderId);
	        record.setOrderStartTimeWithNowTime();
	      return orderMapper.insert(record);
	    }

	 public    Order selectByPrimaryKey(@Param("orderId") Integer orderId, @Param("userId") Integer userId){
	    	//cartid=userid
	    	return orderMapper.selectByPrimaryKey(orderId, userId);
	    }

	 public   List<Order> selectAll(){
	    	return orderMapper.selectAll();
	    }

	 public   List<Order> selectByUserId(@Param("userId") Integer userId){
	    	return orderMapper.selectByUserId(userId);
	    }
	    
	 public   int updateByPrimaryKey(Order record){
		 //用户点击确认收货后更新该订单。
	    	record.setOrderEndTimeWithNowTime();
	    	record.setOrderArriveTimeWithNowTime();
	    	return orderMapper.updateByPrimaryKey(record);
	    }
	 public Order selectLatestOrder(@Param("userId") Integer userId) {
		 List<Order> list=selectByUserId(userId);
		 System.out.println(list.size());
		 Order o=list.get(list.size()-1);
		 return o;
	 }
	
	
	 private Integer getOrderLatestIdByUserId(int userId) {
			List<Order> list=orderMapper.selectByUserId(userId);
             System.out.println(list.size());
		     if(list.size()==0) {
		    	 String num=userId+"00";
		    	 int a=Integer.parseInt(num);
		    	 return a+1;
		     }
		     else {
		    	 Order o=  list.get(list.size()-1);
		    	 return o.getOrderId()+1;
		     }
		    
		     
		

	 }

}
