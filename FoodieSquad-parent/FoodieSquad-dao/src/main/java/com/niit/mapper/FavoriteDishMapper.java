package com.niit.mapper;

import com.niit.pojo.FavoriteDish;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FavoriteDishMapper {
    int deleteByPrimaryKey(Integer favoriteDishId);
    
    int  deleteByUserId(Integer userId);
    
    int   deleteByUserIdAndDishId(@Param("userId") Integer userId,@Param("dishId") Integer dishId);
    
    int insert(FavoriteDish record);

    FavoriteDish selectByPrimaryKey(Integer favoriteDishId);
    
    List<FavoriteDish> selectByUserId(Integer userId);
    
    List<FavoriteDish> selectAll();
  
    int updateByPrimaryKey(FavoriteDish record);
}