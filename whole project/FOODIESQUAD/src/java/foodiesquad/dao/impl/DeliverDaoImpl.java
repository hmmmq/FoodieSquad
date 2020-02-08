/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao.impl;

import foodiesquad.dao.DeliverDao;
import foodiesquad.entity.Deliver;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public class DeliverDaoImpl extends BaseDao implements DeliverDao{

    @Override
    public boolean addDeliver(Deliver Deliver) {
        if (Deliver == null) {
			System.out.println("the entity is null!");
			return false;
		}
    String sql="insert into Deliver (dName,dTele) values(?,?)";
		List<Object> params1 = new ArrayList<Object>();/*装了对象的list表，表里面装的是是该对象的全部信息*/
		params1.add(Deliver.getdName());      
		params1.add(Deliver.getdTele());
               return operUpdate(sql, params1);
    } //To change body of generated methods, choose Tools | Templates.
    

    @Override
    public boolean delDeliver(int dId) {
     	String sql = "delete from Deliver where dId=" + dId;
		return operUpdate(sql, null);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateDeliver(Deliver Deliver) {
      String sql="update Deliver set dName=?,dTele=? where dId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(Deliver.getdName());
		params.add(Deliver.getdTele());
		params.add(Deliver.getdId());
		 return operUpdate(sql,params); //To change body of generated methods, choose Tools | Templates.
    }

   
    @Override
    public Deliver queryDeliverById(int dId) {
       String sql="select * from Deliver where Deliver="+dId;
		List<Deliver> list=null;
		try {
			list = operQuery(sql, null,Deliver.class);
			if(list.size() == 0){
				return null;
			}else{
				return list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Deliver queryDeliverBydName(String dName) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
