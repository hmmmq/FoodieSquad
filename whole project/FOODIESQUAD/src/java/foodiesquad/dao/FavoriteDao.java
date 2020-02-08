/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao;

import foodiesquad.entity.Favorite;
import java.util.List;

/**
 *
 * @author hmqhmq
 */
public interface FavoriteDao {
     public boolean addFavorite(Favorite Favorite);
	public boolean delFavorite(int fId);
	public boolean updateFavorite(Favorite Favorite);
	public Favorite queryFavoriteByfId(int fId);
	
}
