package com.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Description:
 *
 * @Date:2020/1/5
 * @Author:lc
 */
@RequestMapping("/admin")
@Controller
public class AdminLoginController {

    @RequestMapping(value = "/login")
    public String login() {
        return "/admin/login";
    }

}
