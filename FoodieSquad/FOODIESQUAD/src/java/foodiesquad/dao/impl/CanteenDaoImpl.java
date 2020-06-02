/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao.impl;

import foodiesquad.dao.CanteenDao;
import foodiesquad.entity.Canteen;
import foodiesquad.entity.Menu;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public class CanteenDaoImpl extends BaseDao implements CanteenDao {

    @Override
    public boolean addCanteen(Canteen Canteen) {
     if (Canteen == null) {
			System.out.println("the entity is null!");
			return false;
		}
    String sql="insert into Canteen (cName,cTele,cAddress,cPayType) values(?,?,?,?)";
		List<Object> params1 = new ArrayList<Object>();/*装了对象的list表，表里面装的是是该对象的全部信息*/
		params1.add(Canteen.getcName());      
		params1.add(Canteen.getcTele());
                params1.add(Canteen.getcAddress());      
		params1.add(Canteen.getcPayType());
		return operUpdate(sql, params1);
    }

    @Override
    public boolean delCanteen(int cId) {
      	String sql = "delete from Canteen where cId=" + cId;
		return operUpdate(sql, null);//执行sql语句，将数据库里指定的数据删掉。 //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateCanteen(Canteen Canteen) {
      String sql="update Canteen set cName=?,cTele=?,cAddress=?,cPayType=? where cId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(Canteen.getcName());
		params.add(Canteen.getcTele());
		params.add(Canteen.getcAddress());
		params.add(Canteen.getcPayType());
		params.add(Canteen.getcId());
            return operUpdate(sql,params); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Canteen> queryAllCanteen() {
       String sql = "select * from Canteen";
		List<Canteen> list=null;
		try {
			list = operQuery(sql, null, Canteen.class);
                         System.out.println("表单已找到！餐厅");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
                         System.out.println("表单未找到！餐厅");
		}
		return list; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Canteen queryCanteenById(int cId) {
       String sql="select * from Canteen where Canteen="+cId;
		List<Canteen> list=null;
		try {
			list = operQuery(sql, null,Canteen.class);
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
     public List<Menu> queryMenuById(int cId){
            String sql = "select * from Menu where cId="+cId;
            System.out.println(sql);
		List<Menu> list=null;
		try {
			list = operQuery(sql, null, Menu.class);
                        System.out.println("表单已找到！菜单");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
                           System.out.println("表单未找到！菜单");
		}
		return list; //To change body of generated methods, choose Tools | Templates.
     }

    @Override
    public List<Canteen> queryCanteenByCanteenName(String cName) {
       return null; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Canteen> queryCanteenByCanteenAddress(String cAddress) {
       return null;//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Canteen> queryCanteenByCanteenNameAndCanteenAddress(String cName, String cAddress) {
         return null; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Canteen queryCanteen(Canteen Canteen) {
          return null;//To change body of generated methods, choose Tools | Templates.
    }
    
}
