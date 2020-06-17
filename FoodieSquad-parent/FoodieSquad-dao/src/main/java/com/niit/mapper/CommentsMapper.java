package com.niit.mapper;

import com.niit.pojo.Comments;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CommentsMapper {
	
    int deleteByPrimaryKey(Integer commentId);
    
    int deleteByUserId(Integer userId);
    
    int  deleteByUserIdAndCanteenId(@Param("userId") Integer userId,@Param("canteenId") Integer canteenId);
    
    int  deleteByUserIdAndWindowId(@Param("userId") Integer userId,@Param("windowId") Integer windowId);
    
    int  deleteByUserIdAndDishId(@Param("userId") Integer userId,@Param("dishId") Integer dishId);

    int insert(Comments record);
    

    
    Comments selectByPrimaryKey(Integer commentId);
    
    List<Comments>  selectByCanteenId(Integer canteenId);
    
    List<Comments> selectByUserId(Integer userId);
    
    List<Comments>  selectByWindowId(Integer windowId);

    List<Comments>  selectByDishId(Integer DishId);
    
    List<Comments>  selectByUserIdAndCanteenId(@Param("userId") Integer userId,@Param("canteenId") Integer canteenId);
   
    List<Comments>  selectByUserIdAndWindowId(@Param("userId") Integer userId,@Param("windowId") Integer windowId);
    
    List<Comments>  selectByUserIdAndDishId(@Param("userId") Integer userId,@Param("dishId") Integer dishId);
    
     List<Comments> selectAll();
     

	int updateByPrimaryKey(Comments record);

}