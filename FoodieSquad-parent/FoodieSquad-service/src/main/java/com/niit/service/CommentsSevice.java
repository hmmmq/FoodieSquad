package com.niit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.mapper.CommentsMapper;
import com.niit.pojo.Comments;
@Service
public class CommentsSevice {
@Autowired
private CommentsMapper commentsMapper;
int deleteByPrimaryKey(Integer commentId) {
	return commentsMapper.deleteByPrimaryKey(commentId);
}

int insert(Comments record) {
	return commentsMapper.insert(record);
}

Comments selectByPrimaryKey(Integer commentId) {
	return commentsMapper.selectByPrimaryKey(commentId);
}

List<Comments> selectAll(){
	
	return commentsMapper.selectAll();
}

int updateByPrimaryKey(Comments record) {
	
	return commentsMapper.updateByPrimaryKey(record);
}




int deleteByUserId(Integer userId) {
	return commentsMapper.deleteByUserId(userId);
}

int  deleteByUserIdAndCanteenId(@Param("userId") Integer userId,@Param("canteenId") Integer canteenId) {
	return commentsMapper.deleteByUserIdAndCanteenId(userId, canteenId);
}

int  deleteByUserIdAndWindowId(@Param("userId") Integer userId,@Param("windowId") Integer windowId) {
	return commentsMapper.deleteByUserIdAndWindowId(userId, windowId);
}

int  deleteByUserIdAndDishId(@Param("userId") Integer userId,@Param("dishId") Integer dishId) {
	return commentsMapper.deleteByUserIdAndDishId(userId, dishId);
}






List<Comments>  selectByCanteenId(Integer canteenId){
	return commentsMapper.selectByCanteenId(canteenId);
}

List<Comments> selectByUserId(Integer userId){
	return commentsMapper.selectByUserId(userId);
}

List<Comments>  selectByWindowId(Integer windowId){
	return commentsMapper.selectByWindowId(windowId);
}

List<Comments>  selectByDishId(Integer DishId){
	return commentsMapper.selectByDishId(DishId);
}

List<Comments>  selectByUserIdAndCanteenId(@Param("userId") Integer userId,@Param("canteenId") Integer canteenId){
	return commentsMapper.selectByUserIdAndCanteenId(userId, canteenId);
}

List<Comments>  selectByUserIdAndWindowId(@Param("userId") Integer userId,@Param("windowId") Integer windowId){
	return commentsMapper.selectByUserIdAndWindowId(userId, windowId);
}

List<Comments>  selectByUserIdAndDishId(@Param("userId") Integer userId,@Param("dishId") Integer dishId){
	return commentsMapper.selectByUserIdAndDishId(userId, dishId);
}


 



}
