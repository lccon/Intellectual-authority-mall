package com.mall.controller;

import com.mall.component.ThreadVariable;
import com.mall.domain.BusinessBrowse;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.BusinessBrowseService;
import com.mall.vo.MeSeeWhoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
@RequestMapping("/businessBrowse")
@ResponseBody
public class BusinessBrowseController {

    @Autowired
    private BusinessBrowseService businessBrowseService;

    @RequestMapping("/addBusinessBrowse")
    @ResponseBody
    public BusinessBrowse addBusinessBrowse(BusinessBrowse businessBrowse) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        businessBrowse.setVisitorId(ThreadVariable.getSession().getUserId());
        return businessBrowseService.addBusinessBrowse(businessBrowse);
    }

    @RequestMapping("/getMeSeeWho")
    @ResponseBody
    public MeSeeWhoVO getMeSeeWho() {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        return businessBrowseService.getMeSeeWho(ThreadVariable.getSession().getUserId());
    }

    @RequestMapping("/getWhoSeeMe")
    @ResponseBody
    public List<User> getWhoSeeMe() {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        return businessBrowseService.getWhoSeeMe(ThreadVariable.getSession().getUserId());
    }

}
