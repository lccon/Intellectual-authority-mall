package com.mall.mapper;

import com.mall.domain.User;
import com.mall.vo.UserVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    int addUser(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    // LC
    User getUserByUsernamePassword(@Param("username") String username, @Param("password") String password);

    List<User> findUserForList(UserVO userVO);

    Integer deleteUser(Long[] ids);

    User getUserByMobilePassword(@Param("mobile") String mobile, @Param("password") String password);

    void updatePassword(User user);

    User getUserByMobile(@Param("mobile") String mobile);
}