/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.service.serviceimpl;

import foodiesquad.dao.FavoriteDao;
import foodiesquad.dao.UserDao;
import foodiesquad.dao.impl.FavoriteDaoImpl;
import foodiesquad.entity.Favorite;
import foodiesquad.service.FavoriteService;
import java.util.List;
public class FavoriteServiceImpl implements FavoriteService{
    private FavoriteDao FavoriteDao;
    FavoriteServiceImpl(){
        FavoriteDao=new FavoriteDaoImpl();
    }
    @Override
    public int addFavorite(Favorite Favorite) {
      Favorite s=FavoriteDao.queryFavoriteByfId(Favorite.getfId());
		if(s==null) {
			boolean res_add=FavoriteDao.addFavorite(Favorite);
			if(res_add) {
				return 1;//添加成功
			}else {
				return 2;//添加失败
			}
		}
		return 3;//添加失败 //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delFavorite(int fId) {
      return FavoriteDao.delFavorite(fId); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateFavorite(Favorite Favorite) {
      return  FavoriteDao.updateFavorite(Favorite); //To change body of generated methods, choose Tools | Templates.
    }

  
    @Override
    public Favorite queryFavoriteByfId(int fId) {
     return FavoriteDao.queryFavoriteByfId( fId); //To change body of generated methods, choose Tools | Templates.
    }
   
}
