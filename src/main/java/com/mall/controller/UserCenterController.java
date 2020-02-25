package com.mall.controller;

import com.mall.domain.User;
import com.mall.service.UserService;
import com.mall.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/userCenter")
@Controller
public class UserCenterController {
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/user_collect")
    public String collectpage() {
        return "/user_collect";
    }
    @RequestMapping("/myinfo")
    public String myinfopage() {
        return "/myinfo";
    }
    @RequestMapping("/renzheng")
    public String renzhengpage() {
        return "/renzheng";
    }
    @RequestMapping("/vocher")
    public String vocher(@RequestParam(value = "id", required = true) Long id, ModelMap map){
        User user=userService.findUserById(id);
        map.put("user",user);
        return "/vocher";
    }
    @RequestMapping("/userpost")
    public String userpost(){
        return "user_post";
    }
}
