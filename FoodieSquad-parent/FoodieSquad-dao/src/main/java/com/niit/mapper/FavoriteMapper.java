package com.niit.mapper;

import com.niit.pojo.Favorite;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FavoriteMapper {
    int deleteByPrimaryKey(Favorite record);

    int insert(Favorite record);

    List<Favorite> selectAll();
}