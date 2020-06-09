package com.niit.mapper;

import com.niit.pojo.FavoriteCanteen;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FavoriteCanteenMapper {
    int deleteByPrimaryKey(Integer favoriteCanteenId);
  
    int deleteByUserId(Integer userId);
    
    int  deleteByUserIdAndCanteenId(@Param("userId") Integer userId,@Param("canteenId") Integer canteenId);
    
    int insert(FavoriteCanteen record);

    FavoriteCanteen selectByPrimaryKey(Integer favoriteCanteenId);

    List<FavoriteCanteen> selectAll();
    
    List<FavoriteCanteen> selectByUserId(Integer userId);

    int updateByPrimaryKey(FavoriteCanteen record);
}