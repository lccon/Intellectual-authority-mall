package com.mall.controller;

import com.mall.component.ThreadVariable;
import com.mall.domain.BusinessBrowse;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.BusinessBrowseService;
import com.mall.vo.MeSeeWhoVO;
import com.mall.vo.WhoSeeMeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
@Controller
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
    public String getMeSeeWho(ModelMap map) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        MeSeeWhoVO meSeeWhoVO=businessBrowseService.getMeSeeWho(ThreadVariable.getSession().getUserId());
        map.put("meSeeWhoVO",meSeeWhoVO);
        return "meseewho";
    }

    @RequestMapping("/getWhoSeeMe")
    public String getWhoSeeMe(ModelMap map) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        List<WhoSeeMeVO> whoSeeMeVOList=businessBrowseService.getWhoSeeMe(ThreadVariable.getSession().getUserId());
        map.put("whoSeeMeVOList",whoSeeMeVOList);
        return "whoseeme";
    }

}
