package com.mall.controller;

import com.mall.service.LoginService;
import com.mall.service.SessionService;
import com.mall.utils.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Description:
 *
 * @Date:2020/1/5
 * @Author:lc
 */
@RequestMapping("/admin")
@Controller
public class AdminLoginController {

    @Autowired
    private SessionService sessionService;
    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login")
    public String login() {
        return "/admin/login";
    }

    @RequestMapping(value="/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        String sessionId = CookieUtil.getSessionIdFromCookies(request);
        loginService.loginOut(sessionId);
        CookieUtil.clearSessionsFromCookies(request,response);
        return "redirect:/admin/login";
    }

}
