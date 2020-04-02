package com.mall.controller;

import com.mall.component.ThreadVariable;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class UserCenterController {
    @Autowired
    private UserServiceImpl userService;
    @RequestMapping("/userCenter")
    public String usercenter(){
        return "usercenter";
    }

    @RequestMapping("/renzheng")
    public String renzhengpage(ModelMap map) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long id=ThreadVariable.getSession().getUserId();
        User user=userService.findUserById(id);
        map.put("user",user);
        return "/renzheng";
    }
    @RequestMapping("/vocher")
    public String vocher(ModelMap map){
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long id=ThreadVariable.getSession().getUserId();
        User user=userService.findUserById(id);
        map.put("user",user);
        return "/vocher";
    }
    @RequestMapping("/payrank")
    public String payrank(){
        return "payrank";
    }
}
