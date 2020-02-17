package com.mall.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.component.ThreadVariable;
import com.mall.domain.BusinessCollected;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.BusinessCollectedService;
import com.mall.vo.BusinessCollectedVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Description: 收藏
 *
 * @Date:2020/2/15
 * @Author:lc
 */
@RequestMapping("/businessCollected")
@Controller
public class BusinessCollectedController {

    @Autowired
    private BusinessCollectedService businessCollectedService;

    @RequestMapping("/addBusinessCollected")
    @ResponseBody
    public boolean addBusinessCollected(BusinessCollected businessCollected) {
        if (ThreadVariable.getSession() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        businessCollected.setUserId(ThreadVariable.getSession().getUserId());
        boolean result;
        if(businessCollectedService.addBusinessCollected(businessCollected)!=null){
            result=true;
        }
        else {
            result=false;
        }
        return result;
    }

    @RequestMapping("/deleteBusinessCollected")
    @ResponseBody
    public Boolean deleteBusinessCollected(BusinessCollected businessCollected) {
        if(businessCollected.getUserId() == null) {
            if (ThreadVariable.getSession() == null) {
                throw new BusinessValidationException("请重新登录");
            }
            businessCollected.setUserId(ThreadVariable.getSession().getUserId());
        }
        boolean result=businessCollectedService.deleteBusinessCollected(businessCollected);
        return result;
    }

    @RequestMapping("/findBusinessCollectedForPage")
    public String findBusinessCollectedForPage(BusinessCollectedVO businessCollectedVO, ModelMap map) {
        if (ThreadVariable.getSession() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        businessCollectedVO.setUserId(ThreadVariable.getSession().getUserId());
        PageInfo<BusinessCollectedVO> businessCollected = businessCollectedService.findBusinessCollectedForPage(businessCollectedVO);
        GridPage<BusinessCollectedVO> gridPage = new GridPage<>(businessCollected);
        map.put("gridPage", gridPage);
        return "user_collect";
    }

}
