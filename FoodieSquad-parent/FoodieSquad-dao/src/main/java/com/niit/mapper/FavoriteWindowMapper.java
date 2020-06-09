package com.niit.mapper;

import com.niit.pojo.FavoriteWindow;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FavoriteWindowMapper {
   int deleteByPrimaryKey(Integer favoriteWindowId);

   int deleteByUserId(Integer userId);
    
   int deleteByUserIdAndWindowId(@Param("userId") Integer userId,@Param("windowId") Integer windowId);
    
   List<FavoriteWindow> selectByUserId(Integer userId);
    
    int insert(FavoriteWindow record);

    FavoriteWindow selectByPrimaryKey(Integer favoriteWindowId);

    List<FavoriteWindow> selectAll();

    int updateByPrimaryKey(FavoriteWindow record);
}