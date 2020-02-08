/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao.impl;

import foodiesquad.dao.FavoriteDao;
import foodiesquad.entity.Favorite;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public class FavoriteDaoImpl extends BaseDao implements FavoriteDao {

    @Override
    public boolean addFavorite(Favorite Favorite) {
      if (Favorite == null) {
			System.out.println("the entity is null!");
			return false;
		}
    String sql="insert into Favorite (uId,cId1,cId2,cId3,cId4) values(?,?,?,?,?)";
		List<Object> params1 = new ArrayList<Object>();/*装了对象的list表，表里面装的是是该对象的全部信息*/
		params1.add(Favorite.getuId());      
		params1.add(Favorite.getcId1());
                params1.add(Favorite.getcId2());      
		params1.add(Favorite.getcId3());
                params1.add(Favorite.getcId4());
               return operUpdate(sql, params1);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delFavorite(int fId) {
        String sql = "delete from Favorite where dId=" + fId;
		return operUpdate(sql, null);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateFavorite(Favorite Favorite) {
       String sql="update Favorite set uId=?,cId1=?,cId2=?,cId3=?,cId4=? where fId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(Favorite.getuId());
		params.add(Favorite.getcId1());
		params.add(Favorite.getcId2());
                params.add(Favorite.getcId3());
		params.add(Favorite.getcId4());
                params.add(Favorite.getfId());
		return operUpdate(sql,params); //To change body of generated methods, choose Tools | Templates.
    }

  @Override
    public Favorite queryFavoriteByfId(int fId) {
       String sql="select * from Favorite where Favorite="+fId;
		List<Favorite> list=null;
		try {
			list = operQuery(sql, null,Favorite.class);
			if(list.size() == 0){
				return null;
			}else{
				return list.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;//To change body of generated methods, choose Tools | Templates.
    }


    
    
    
}
