/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao.impl;

import foodiesquad.dao.SaleDao;
import foodiesquad.entity.Sale;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public class SaleDaoImpl  extends BaseDao implements SaleDao{

    @Override
    public boolean addSale(Sale Sale) {
       if (Sale == null) {
			System.out.println("the entity is null!");
			return false;
		}
    String sql="insert into Sale (sName,sDescription,sBegin,sEnd,cId) values(?,?,?,?,?,?)";
		List<Object> params1 = new ArrayList<Object>();/*装了对象的list表，表里面装的是是该对象的全部信息*/
	         params1.add(Sale.getsName());
                params1.add(Sale.getsDescription());      
		params1.add(Sale.getsBegin());
                params1.add(Sale.getsEnd());
               return operUpdate(sql, params1); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delSale(int sId) {
       String sql = "delete from Sale where sId=" + sId;
		return operUpdate(sql, null);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateSale(Sale Sale) {
        String sql="update Sale set sName=?,sDescription=?,sBegin=?,sEnd=?,cId=? where sId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(Sale.getsName());
		params.add(Sale.getsDescription());
		params.add(Sale.getsBegin());
                params.add(Sale.getsEnd());
		params.add(Sale.getcId());
                params.add(Sale.getsId());
		return operUpdate(sql,params); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Sale> queryAllSale() {
        String sql = "select * from Sale";
		List<Sale> list=null;
		try {
			list = operQuery(sql, null, Sale.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Sale querySaleBysId(int sId) {
          String sql="select * from Sale where sId="+sId;
		List<Sale> list=null;
		try {
			list = operQuery(sql, null,Sale.class);
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
    public List<Sale> querySaleBycId(int sId) {
       String sql="select * from Sale where sId="+sId;
		List<Sale> list=null;
		try {
			list = operQuery(sql, null,Sale.class);
			if(list.size() == 0){
				return null;
			}else{
				return list;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;  //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Sale> querySaleBysName(String sName) {
       String sql = "select uId from Sale where sName=? ";
		List<Object> params = new ArrayList<Object>();
		params.add(sName);
		List<Sale> list = null;
		try {
			list = operQuery(sql,params,Sale.class);

			if(list.size() == 0){
				return null;
			}else{
				return list;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;//To change body of generated methods, choose Tools | Templates.
    }
    
}
