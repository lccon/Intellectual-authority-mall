package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.component.ThreadVariable;
import com.mall.domain.RechargeRecord;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.RechargeRecordService;
import com.mall.service.UserService;
import com.mall.vo.RechargeRecordVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
@Controller
@RequestMapping("/rechargeRecord")
public class RechargeRecordController {

    @Autowired
    private RechargeRecordService rechargeRecordService;
    @Autowired
    private UserService userService;

    @RequestMapping("/addRechargeRecord")
    @ResponseBody
    public RechargeRecord addRechargeRecord(RechargeRecord rechargeRecord) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long userId = ThreadVariable.getSession().getUserId();
        rechargeRecord.setUserId(userId);
        return rechargeRecordService.addRechargeRecord(rechargeRecord);
    }

    @RequestMapping("/updateRechargeRecord")
    @ResponseBody
    public RechargeRecord updateRechargeRecord(RechargeRecord rechargeRecord) {
        return rechargeRecordService.updateRechargeRecord(rechargeRecord);
    }

    @RequestMapping("/findRechargeRecordForList")
    @ResponseBody
    public GridPage<RechargeRecord> findRechargeRecordForList() {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        RechargeRecordVO rechargeRecordVO = new RechargeRecordVO();
        rechargeRecordVO.setUserId(ThreadVariable.getSession().getUserId());
        PageInfo<RechargeRecord> rechargeRecordList = rechargeRecordService.findRechargeRecordForList(rechargeRecordVO);
        return new GridPage<>(rechargeRecordList);
    }
    @RequestMapping("/consumemessage")
    public String consumemessage(Integer FreeMessageNum,Long consume){
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long userId = ThreadVariable.getSession().getUserId();
        User user=userService.findUserById(userId);
        Integer newFreeMessageNum= user.getFreeMessageNum()+FreeMessageNum;
        user.setFreeMessageNum(newFreeMessageNum);
        Long AccounYue=user.getAccountYue();
        Long newAccounyue=AccounYue-consume;
        user.setAccountYue(newAccounyue);
        userService.updateUser(user);
        RechargeRecord rechargeRecord=new RechargeRecord();
        rechargeRecord.setUserId(userId);
        rechargeRecord.setConsumeAmount(consume);
        rechargeRecord.setAccountYue(newAccounyue);
        rechargeRecordService.addRechargeRecord(rechargeRecord);
        return "/usercenter";
    }

}
