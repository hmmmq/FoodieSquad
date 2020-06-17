package com.niit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.mapper.FavoriteCanteenMapper;
import com.niit.mapper.FavoriteDishMapper;
import com.niit.mapper.FavoriteMapper;
import com.niit.mapper.FavoriteWindowMapper;
import com.niit.pojo.Favorite;
import com.niit.pojo.FavoriteCanteen;
import com.niit.pojo.FavoriteDish;
import com.niit.pojo.FavoriteWindow;
@Service
public class FavoriteService {
	@Autowired
	private FavoriteMapper favoriteMapper;
	@Autowired
	private FavoriteCanteenMapper favoriteCanteenMapper;
	@Autowired
	private FavoriteDishMapper favoriteDishMapper;
	@Autowired
	private FavoriteWindowMapper favoriteWindowMapper;
	
 public     int delectAllFavorites(Integer userId) {
    	  
    	  return favoriteMapper.deleteByPrimaryKey(new Favorite(userId, userId));
      }
	
 public	    int insertFavorite(Favorite record) {
	    	return favoriteMapper.insert(record);
	    }

 public    List<Favorite> selectAllFavorite(){
	    	return favoriteMapper.selectAll();
	    }
 	
 public	int deleteByUserIdAndCanteenId(@Param("userId")Integer userId,@Param("canteenId")Integer canteenId) {
		return favoriteCanteenMapper.deleteByUserIdAndCanteenId(userId, canteenId);
	}

 public	int insert(FavoriteCanteen record){
		return favoriteCanteenMapper.insert(record);
	}

 public	 List<FavoriteCanteen> selectAllFavoriteCanteen(){
		 return favoriteCanteenMapper.selectAll();
	 }
	    
 public	 List<FavoriteCanteen> selectFavoriteCanteenByUserId(Integer userId){
		 return favoriteCanteenMapper.selectByUserId(userId);
	 }
	    
 public  int deleteByUserIdAndDishId(@Param("dishId")Integer dishId,@Param("userId")Integer userId) {
		  return favoriteDishMapper.deleteByUserIdAndDishId(userId, dishId);
	  }

 public  int insert(FavoriteDish record){
    	   return favoriteDishMapper.insert(record);
       }

 public   List<FavoriteDish> selectAllFavoriteDish(){
	    	return favoriteDishMapper.selectAll();
	    }
	    
 public  List<FavoriteDish> selectFavoriteDishByUserId(Integer userId){

		  
	    	return favoriteDishMapper.selectByUserId(userId);
	    }

 public	  int deleteByUserIdAndWindowId(@Param("windowId")Integer windowId,@Param("favoriteId")Integer userId) {
		  return favoriteWindowMapper.deleteByUserIdAndWindowId(userId, windowId);
	  }

 public    int insert(FavoriteWindow record) {
	    	return favoriteWindowMapper.insert(record);
	    }

 public    List<FavoriteWindow> selectAllFavoriteWindow(){
	    	return favoriteWindowMapper.selectAll();
	    }
	    
 public    List<FavoriteWindow> selectFavoriteWindowByUserId(Integer userId){
	    	return favoriteWindowMapper.selectByUserId(userId);
	    }



}
