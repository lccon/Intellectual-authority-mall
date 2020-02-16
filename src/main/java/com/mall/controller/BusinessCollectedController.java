package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.component.ThreadVariable;
import com.mall.domain.BusinessCollected;
import com.mall.exception.base.BusinessValidationException;
import com.mall.properties.GridProperties;
import com.mall.service.BusinessCollectedService;
import com.mall.vo.BusinessCollectedVO;
import com.mall.vo.CollectedInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    public BusinessCollected addBusinessCollected(BusinessCollected businessCollected) {
        if (ThreadVariable.getSession() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        businessCollected.setUserId(ThreadVariable.getSession().getUserId());
        return businessCollectedService.addBusinessCollected(businessCollected);
    }

    @RequestMapping("/deleteBusinessCollected")
    @ResponseBody
    public Boolean deleteBusinessCollected(BusinessCollected businessCollected) {
        if (ThreadVariable.getSession() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        businessCollected.setUserId(ThreadVariable.getSession().getUserId());
        return businessCollectedService.deleteBusinessCollected(businessCollected);
    }

    @RequestMapping("/findBusinessCollectedForPage")
    @ResponseBody
    public GridPage<CollectedInfoVO> findBusinessCollectedForPage(BusinessCollectedVO businessCollectedVO) {
        if (ThreadVariable.getSession() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        businessCollectedVO.setUserId(ThreadVariable.getSession().getUserId());
        PageInfo<CollectedInfoVO> businessCollected = businessCollectedService.findBusinessCollectedForPage(businessCollectedVO);
        GridPage<CollectedInfoVO> gridPage = new GridPage<>(businessCollected);
        return gridPage;
    }

}
