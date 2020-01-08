package com.mall.service;

import com.mall.domain.Session;
import com.mall.domain.User;

public interface UserService {
	User findUserById(Long id);
	
	User getUserByUsername(String username);
	
	User addUser(User user);
	
	User updateUser(User user);

	// LC
	Session getUserByUsernamePassword(String username, String password, Session session);

    User findUserBySessionId(String token);
}
