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

	String Aliyunmobile(String mobile);

	/**
	 * 用户手机号密码登录
	 * @param mobile
	 * @param password
	 * @param session
	 * @return
	 */
	Session getUserByMobilePassword(String mobile, String password, Session session);

	/**
	 * 修改密码
	 * @param user
	 * @return
	 */
	User updatePassword(User user);

	Boolean getUserByMobile(String mobile);
}
