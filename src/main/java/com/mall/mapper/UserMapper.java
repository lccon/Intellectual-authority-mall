package com.mall.mapper;

import com.mall.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    int addUser(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    // LC
    User getUserByUsernamePassword(@Param("username") String username, @Param("password") String password);

    // LC
    User getUserByUsername(String username);
}