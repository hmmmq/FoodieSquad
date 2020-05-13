/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao;

import foodiesquad.entity.Order;

/**
 *
 * @author wolf
 */
public interface OrderDao {
        public boolean addOrder(Order order);//增加订单，参数为订单实体，返回布尔变量
	public boolean delOrder(Order order);//删除订单，参数为订单实体，返回布尔变量
	public boolean updateOrder(Order order);//更新订单,参数为订单实体，返回布尔变量
        public Order queryOrder(Order order);//查询订单，参数为订单实体，返回订单实体
}
