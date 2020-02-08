/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao.impl;

import foodiesquad.dao.OrderDao;
import foodiesquad.entity.Order;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wolf
 */
public class OrderDaoImpl extends BaseDao implements OrderDao{

    @Override
    public boolean addOrder(Order order) {
        if(order == null) {
			return false;
		}
		String sql="insert into Order (oId,oStatus,oOrderTime,oTakeTime,oType,oArriveTIme,oAddress,dId,uId) values(?,?,?,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
                params.add(order.getoId());
                params.add(order.getoStatus());
                params.add(order.getoOrderTIme());
                params.add(order.getoTakeTime());
                params.add(order.getoType());
                params.add(order.getoAddress());
                params.add(order.getdId());
                params.add(order.getuId());
                return operUpdate(sql, params);
    }

    @Override
    public boolean delOrder(Order order) {
            String sql="delete from Order where oId="+order.getoId();
		
	return operUpdate(sql, null);
    }

    @Override
    public boolean updateOrder(Order order) {
                String sql="update Order set oStatus=?,oOrderTime=?,oTakeTime=?,oType=?,oArriveTIme=?,oAddress=?,dId=?,uId=? where oId=?";
		List<Object> params = new ArrayList<Object>();	
                params.add(order.getoStatus());
                params.add(order.getoOrderTIme());
                params.add(order.getoTakeTime());
                params.add(order.getoType());
                params.add(order.getoAddress());
                params.add(order.getdId());
                params.add(order.getuId());
                params.add(order.getoId());
		return operUpdate(sql,params);    }

    @Override
    public Order queryOrder(Order order) {
                String sql = "select * from Order where oId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(order.getoId());
		
		List<Order> list = null;
		try {
			list = operQuery(sql,params,Order.class);			
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
    
}
