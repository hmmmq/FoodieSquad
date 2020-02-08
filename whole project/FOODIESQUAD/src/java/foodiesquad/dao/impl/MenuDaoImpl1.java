/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao.impl;

import foodiesquad.dao.MenuDao;
import foodiesquad.entity.Menu;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wolf
 */
public class MenuDaoImpl1 extends BaseDao implements MenuDao{

    @Override
    public boolean addMenu(Menu menu) {
        if(menu == null) {
			return false;
		}
		String sql="insert into Menu (mId,mName,mPirce,mDescription,mType,mPicture,cId) values(?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
                params.add(menu.getmId());
                params.add(menu.getmName());
                params.add(menu.getmPirce());
                params.add(menu.getmDescription());
                params.add(menu.getmType());
                params.add(menu.getmPicture());
                params.add(menu.getcId());
                return operUpdate(sql, params);
    }

    @Override
    public boolean delMenu(Menu menu) {
        String sql="delete from Menu where mId="+menu.getmId();		
	return operUpdate(sql, null);
    }

    @Override
    public boolean updateMenu(Menu menu) {
                String sql="update Menu set mName=?,mPirce=?,mDescription=?,mType=?,mPicture=?,cId=? where mId=?";
		List<Object> params = new ArrayList<Object>();	
                params.add(menu.getmName());
                params.add(menu.getmPirce());
                params.add(menu.getmDescription());
                params.add(menu.getmType());
                params.add(menu.getmPicture());
                params.add(menu.getcId());
                params.add(menu.getmId());
		return operUpdate(sql,params); 
    }

    @Override
    public Menu queryMenu(Menu menu) {
                String sql = "select * from Menu where mId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(menu.getmId());
		List<Menu> list = null;
		try {
			list = operQuery(sql,params,Menu.class);			
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
