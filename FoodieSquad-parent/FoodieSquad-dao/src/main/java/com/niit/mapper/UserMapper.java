package com.niit.mapper;

import com.niit.pojo.Cart;
import com.niit.pojo.Permission;
import com.niit.pojo.User;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
int deleteByPrimaryKey(Integer userId);

int insert(User record);

User selectByPrimaryKey(Integer userId);

List<User> selectAll();
//0为用户  1为用户兼快递员 2为用户兼管理员 此方法未装配任何resultMap，请通过selectByPrimaryKey(Integer userId);或对应mapper获取所有数据。
List<User> selectByUserType(Integer userType);

int updateByPrimaryKey(User record);

void updatePasswordByUsername(User user);
   
User selectByStuNum(@Param("userStudentNum") String userStudentNum);
 
User findByUsername(String userStudentNum);

List<Permission> findPermissionByUsername(String userStudentNum);

}