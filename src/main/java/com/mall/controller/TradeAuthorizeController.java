package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.component.ThreadVariable;
import com.mall.domain.TradeAuthorize;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.TradeAuthorizeService;
import com.mall.service.UserService;
import com.mall.vo.TradeAuthorizeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/listPage")
    public String listPage() {
        return "/admin/tradeAuthorize/tradeAuthorizeListPage";
    }

    @RequestMapping("/gotoUpdateTradeAuthorizePage")
    public String gotoUpdateTradeAuthorizePage(@RequestParam(value = "id", required = true) Long id, ModelMap map) {
        TradeAuthorize tradeAuthorize = tradeAuthorizeService.getTradeAuthorizeById(id);
        map.put("tradeAuthorize", tradeAuthorize);
        return "/admin/tradeAuthorize/updateTradeAuthorizeDlg";
    }

    @RequestMapping("/addTradeAuthorize")
    public String  addTradeAuthorize(TradeAuthorize tradeAuthorize) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long userId = ThreadVariable.getSession().getUserId();
        tradeAuthorize.setUserId(userId);
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

    @RequestMapping("/updateTradeAuthorize")
    @ResponseBody
    public TradeAuthorize updateTradeAuthorize(TradeAuthorize tradeAuthorize) {
        return tradeAuthorizeService.updateTradeAuthorize(tradeAuthorize);
    }

    @RequestMapping("/findTradeAuthorizeForPage")
    @ResponseBody
    public GridPage<TradeAuthorize> findTradeAuthorizeForPage(TradeAuthorizeVO tradeAuthorizeVO) {
        PageInfo<TradeAuthorize> pageInfo = tradeAuthorizeService.findTradeAuthorizeForPage(tradeAuthorizeVO);
        GridPage<TradeAuthorize> gridPage = new GridPage<>(pageInfo);
        return gridPage;
    }

    @RequestMapping("/deleteTradeAuthorize")
    @ResponseBody
    public Boolean deleteTradeAuthorize(@RequestParam(value = "ids[]", required = true) Long[] ids) {
        return tradeAuthorizeService.deleteTradeAuthorize(ids);
    }

}
