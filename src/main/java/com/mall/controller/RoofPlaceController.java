package com.mall.controller;

import com.mall.component.ThreadVariable;
import com.mall.domain.RechargeRecord;
import com.mall.domain.RoofPlace;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.RechargeRecordService;
import com.mall.service.RoofPlaceService;
import com.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/1/21
 * @Author:lc
 */
@Controller
@RequestMapping("/roofPlace")
public class RoofPlaceController {

    @Autowired
    private RoofPlaceService roofPlaceService;
    @Autowired
    private UserService userService;
    @Autowired
    private RechargeRecordService rechargeRecordService;


    @RequestMapping("/addRoofPlace")
    @ResponseBody
    public RoofPlace addRoofPlace(RoofPlace roofPlace) {
        return roofPlaceService.addRoofPlace(roofPlace);
    }
    @RequestMapping("/getUseraccountYue")
    @ResponseBody
    public Long getUseraccountYue(){
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long userId = ThreadVariable.getSession().getUserId();
        User user=userService.findUserById(userId);
        Long AccountYue=user.getAccountYue();
        return AccountYue;
    }
    @RequestMapping("/roofplaceconsume")
    @ResponseBody
    public Boolean roofplaceconsume(String consume){
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long newconsume=Long.parseLong(consume);
        Long userId = ThreadVariable.getSession().getUserId();
        User user=userService.findUserById(userId);
        Long AccounYue=user.getAccountYue();
        Long newAccounyue=AccounYue-newconsume;
        user.setAccountYue(newAccounyue);
        userService.updateUser(user);
        RechargeRecord rechargeRecord=new RechargeRecord();
        rechargeRecord.setUserId(userId);
        rechargeRecord.setConsumeAmount(newconsume);
        rechargeRecord.setAccountYue(newAccounyue);
        rechargeRecordService.addRechargeRecord(rechargeRecord);
        return true;
    }
}
