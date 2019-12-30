package com.mall.controller;

import com.mall.component.ThreadVariable;
import com.mall.domain.Session;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping ("user")
public class UserController {
    @Autowired
	private UserServiceImpl userService;

	@RequestMapping (value = "/findUsername", method = RequestMethod.POST)
	@ResponseBody
	public User findUserByUsername(String username) {
		return userService.getUserByUsername(username);
	}
	
	@RequestMapping (value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public User addUser(User user) {
        return userService.addUser(user);
	}
	
	@RequestMapping (value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public User updateUser(User user, String token, String apply) {
		Session session = ThreadVariable.getSession();
		if(session == null || session.getUserId() == null) {
			throw new BusinessValidationException("请重新登录!");
		}
		user.setId(session.getUserId());
		return userService.updateUser(user);
	}
}
