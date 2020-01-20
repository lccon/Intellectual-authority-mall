package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.Session;
import com.mall.domain.User;
import com.mall.vo.UserVO;

import java.util.List;

public interface UserService {
	User findUserById(Long id);

	User addUser(User user);
	
	User updateUser(User user);

	// LC
	Session getUserByUsernamePassword(String username, String password, Session session);

    User findUserBySessionId(String token);

	PageInfo<User> findUserForPage(UserVO userVO);

	Boolean deleteUser(Long[] ids);

    String getUserMobileLoginCheckInfo(String mobile);
}
