package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.domain.User;
import com.mall.service.impl.UserServiceImpl;
import com.mall.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping ("/user")
public class UserController {
    @Autowired
	private UserServiceImpl userService;

    @RequestMapping("/listPage")
    public String listPage() {
    	return "/admin/user/userListPage";
	}

	@RequestMapping("gotoAddUserPage")
	public String gotoAddUserPage() {
    	return "/admin/user/addUserDlg";
	}

	@RequestMapping("/gotoUpdateUserPage")
	public String gotoUpdateUserPage(@RequestParam(value="id")Long id, ModelMap map) {
		User user = userService.findUserById(id);
		map.put("user", user);
		return "/admin/user/updateUserDlg";
	}

	@RequestMapping (value = "/addUser")
	@ResponseBody
	public User addUser(User user) {
        return userService.addUser(user);
	}
	
	@RequestMapping (value = "/updateUser")
	@ResponseBody
	public User updateUser(User user) {
		return userService.updateUser(user);
	}

	@RequestMapping (value = "/deleteUser")
	@ResponseBody
	public Boolean deleteUser(@RequestParam(value = "ids[]") Long[] ids) {
		return userService.deleteUser(ids);
	}

	@RequestMapping (value = "/findUserForPage")
	@ResponseBody
	public GridPage<User> findUserForPage(UserVO userVO) {
		PageInfo<User> userPage = userService.findUserForPage(userVO);
		GridPage<User> gridPage = new GridPage<>(userPage);
		return gridPage;
	}

	@RequestMapping("/getUserById")
	public String getUserById(@RequestParam(value = "id", required = true) Long id, ModelMap map) {
    	User user=userService.findUserById(id);
    	map.put("user",user);
    	return "myinfo";
	}
	@RequestMapping (value = "/updatemyinfo")
	public String updatemyinfo(User user){
    	userService.updateUser(user);
    	return "usercenter";
	}

}
