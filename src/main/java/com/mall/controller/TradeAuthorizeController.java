package com.mall.controller;

import com.mall.component.ThreadVariable;
import com.mall.domain.TradeAuthorize;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.TradeAuthorizeService;
import com.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Description:
 *
 * @Date:2020/2/29
 * @Author:lc
 */
@RequestMapping("/tradeAuthorize")
@Controller
public class TradeAuthorizeController {

    @Autowired
    private TradeAuthorizeService tradeAuthorizeService;
    @Autowired
    private UserService userService;


    @RequestMapping("/addTradeAuthorize")
    public String  addTradeAuthorize(TradeAuthorize tradeAuthorize) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long userId = ThreadVariable.getSession().getUserId();
        tradeAuthorizeService.addTradeAuthorize(userId, tradeAuthorize);
        if(tradeAuthorize.getAuthorizeStyle()==1){
            User user=userService.findUserById(userId);
            user.setFreeMessageNum(30);
            userService.updateUser(user);
        }
        else {
            User user=userService.findUserById(userId);
            user.setFreeMessageNum(10);
            userService.updateUser(user);
        }
        return "usercenter";
    }

}
