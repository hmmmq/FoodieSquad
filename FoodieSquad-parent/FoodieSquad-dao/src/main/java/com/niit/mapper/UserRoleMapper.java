package com.niit.mapper;

import com.niit.pojo.UserRole;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserRoleMapper {
    int deleteByPrimaryKey(@Param("userId") Integer userId, @Param("roleId") Integer roleId);

    int insert(UserRole record);

    List<UserRole> selectAll();
}