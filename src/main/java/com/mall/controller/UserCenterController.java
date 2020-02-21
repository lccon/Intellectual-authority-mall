package com.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/userCenter")
@Controller
public class UserCenterController {

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
}
