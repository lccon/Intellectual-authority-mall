package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.*;
import com.mall.enums.ModuleTypeEnum;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.BusinessCollectedMapper;
import com.mall.service.*;
import com.mall.utils.StringUtil;
import com.mall.vo.BusinessCollectedVO;
import com.mall.vo.CollectedInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Description: 收藏实现类
 *
 * @Date:2020/2/15
 * @Author:lc
 */
@Service("businessCollectedService")
public class BusinessCollectedServiceImpl implements BusinessCollectedService {

    @Autowired
    private BusinessCollectedMapper businessCollectedMapper;
    @Autowired
    private IntellectualTaskService intellectualTaskService;
    @Autowired
    private AuthorizeCompanyService authorizeCompanyService;
    @Autowired
    private TaskReleaseService taskReleaseService;

    @Override
    public BusinessCollected addBusinessCollected(BusinessCollected businessCollected) {
        if (businessCollected == null) {
            throw new BusinessValidationException("参数不能为空");
        }
        try {
            businessCollectedMapper.addBusinessCollected(businessCollected);
            return businessCollected;
        } catch (Exception e) {
           throw new ServiceValidationException("新增收藏出错!", e);
        }
    }

    @Override
    public Boolean deleteBusinessCollected(BusinessCollected businessCollected) {
        if (businessCollected == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            Integer count = businessCollectedMapper.deleteBusinessCollected(businessCollected);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("取消收藏出错!", e);
        }
    }

    @Override
    public PageInfo<CollectedInfoVO> findBusinessCollectedForPage(BusinessCollectedVO businessCollectedVO) {
        if (businessCollectedVO == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            PageHelper.startPage(businessCollectedVO.getPage(), businessCollectedVO.getRows(),
                    StringUtil.joinSortFieldOrder(businessCollectedVO.getSidx(), businessCollectedVO.getSord()));
            List<BusinessCollected> businessCollectedList = businessCollectedMapper.findBusinessCollectedForList(businessCollectedVO);
            List<CollectedInfoVO> collectedInfoVOList = new ArrayList<>();
            for (BusinessCollected businessCollected : businessCollectedList) {
                CollectedInfoVO collectedInfoVO = new CollectedInfoVO();
                collectedInfoVO.setCollectedDate(businessCollected.getCreateDate());
                if (ModuleTypeEnum.INTELLECTUAL_TASK.equals(businessCollected.getModuleType())) {
                    IntellectualTask intellectualTask = intellectualTaskService.getIntellectualTaskById(businessCollected.getModuleTypeId());
                    collectedInfoVO.setCollectedContent(intellectualTask.getProductName());
                } else if (ModuleTypeEnum.AUTHORIZE_COMPANY.equals(businessCollected.getModuleType())) {
                    AuthorizeCompany authorizeCompany = authorizeCompanyService.getAuthorizeCompanyById(businessCollected.getModuleTypeId());
                    collectedInfoVO.setCollectedContent(authorizeCompany.getCompanyName());
                } else if (ModuleTypeEnum.TASK_RELEASE.equals(businessCollected.getModuleType())) {
                    TaskRelease taskRelease = taskReleaseService.getTaskReleaseById(businessCollected.getModuleTypeId());
                    collectedInfoVO.setCollectedContent(taskRelease.getPurpose());
                }
                collectedInfoVOList.add(collectedInfoVO);
            }
            PageInfo pageInfo = new PageInfo<>(businessCollectedList);
            pageInfo.setList(collectedInfoVOList);
            return pageInfo;
        } catch (Exception e) {
            throw new ServiceValidationException("分页查询收藏数据出错!", e);
        }
    }
}
