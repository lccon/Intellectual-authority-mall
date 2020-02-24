package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.component.ThreadVariable;
import com.mall.domain.RechargeRecord;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.RechargeRecordService;
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

}
