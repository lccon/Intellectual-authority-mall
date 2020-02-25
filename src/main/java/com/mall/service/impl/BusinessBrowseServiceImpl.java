package com.mall.service.impl;

import com.mall.domain.*;
import com.mall.enums.ModuleTypeEnum;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.BusinessBrowseMapper;
import com.mall.service.*;
import com.mall.vo.MeSeeWhoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
@Service("businessBrowseService")
public class BusinessBrowseServiceImpl implements BusinessBrowseService {

    @Autowired
    private BusinessBrowseMapper businessBrowseMapper;
    @Autowired
    private IntellectualTaskService intellectualTaskService;
    @Autowired
    private AuthorizeCompanyService authorizeCompanyService;
    @Autowired
    private TaskReleaseService taskReleaseService;
    @Autowired
    private UserService userService;

    @Override
    public BusinessBrowse addBusinessBrowse(BusinessBrowse businessBrowse) {
        if(businessBrowse == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            Long publisherId = null;
            if (ModuleTypeEnum.INTELLECTUAL_TASK.equals(businessBrowse.getModuleType())) {
                IntellectualTask intellectualTask = intellectualTaskService.getIntellectualTaskById(businessBrowse.getModuleTypeId());
                if (intellectualTask != null && intellectualTask.getUserId() != null) {
                    publisherId = intellectualTask.getUserId();
                }
            } else if (ModuleTypeEnum.AUTHORIZE_COMPANY.equals(businessBrowse.getModuleType())) {
                AuthorizeCompany authorizeCompany = authorizeCompanyService.getAuthorizeCompanyById(businessBrowse.getModuleTypeId());
                if (authorizeCompany != null && authorizeCompany.getUserId() != null) {
                    publisherId = authorizeCompany.getUserId();
                }
            } else if (ModuleTypeEnum.TASK_RELEASE.equals(businessBrowse.getModuleType())) {
                TaskRelease taskRelease = taskReleaseService.getTaskReleaseById(businessBrowse.getModuleTypeId());
                if (taskRelease != null && taskRelease.getUserId() != null) {
                    publisherId = taskRelease.getUserId();
                }
            }
            Integer count = this.countBusinessBrowseNum(businessBrowse);
            if (count <= 0 && publisherId != null && !publisherId.equals(businessBrowse.getVisitorId())) {
                businessBrowse.setPublisherId(publisherId);
                businessBrowseMapper.addBusinessBrowse(businessBrowse);
            }
            return businessBrowse;
        } catch (Exception e) {
            throw new ServiceValidationException("新增浏览信息出错!", e);
        }
    }

    @Override
    public Integer countBusinessBrowseNum(BusinessBrowse businessBrowse) {
        if(businessBrowse == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            return businessBrowseMapper.countBusinessBrowseNum(businessBrowse);
        } catch (Exception e) {
            throw new ServiceValidationException("统计浏览数量出错!", e);
        }
    }

    @Override
    public MeSeeWhoVO getMeSeeWho(Long userId) {
        try {
            List<BusinessBrowse> meSeeWhoList = businessBrowseMapper.findMeSeeWhoForList(userId);
            List<Long> taskIds = new ArrayList<>();
            List<Long> companyIds = new ArrayList<>();
            List<Long> releaseIds = new ArrayList<>();
            for (BusinessBrowse businessBrowse : meSeeWhoList) {
                if (ModuleTypeEnum.INTELLECTUAL_TASK.equals(businessBrowse.getModuleType())) {
                    taskIds.add(businessBrowse.getModuleTypeId());
                } else if (ModuleTypeEnum.AUTHORIZE_COMPANY.equals(businessBrowse.getModuleType())) {
                    companyIds.add(businessBrowse.getModuleTypeId());
                } else if (ModuleTypeEnum.TASK_RELEASE.equals(businessBrowse.getModuleType())) {
                    releaseIds.add(businessBrowse.getModuleTypeId());
                }
            }
            MeSeeWhoVO meSeeWhoVO = new MeSeeWhoVO();
            if (taskIds.size() > 0) {
                List<IntellectualTask> intellectualTaskList = intellectualTaskService.findIntellectualTaskByIds(taskIds);
                meSeeWhoVO.setIntellectualTaskList(intellectualTaskList);
            }
            if (companyIds.size() > 0) {
                List<AuthorizeCompany>  authorizeCompanyList = authorizeCompanyService.findAuthorizeCompanyByIds(companyIds);
                meSeeWhoVO.setAuthorizeCompanyList(authorizeCompanyList);
            }
            if (releaseIds.size() > 0) {
                List<TaskRelease> taskReleaseList= taskReleaseService.findTaskReleaseByIds(releaseIds);
                meSeeWhoVO.setTaskReleaseList(taskReleaseList);
            }
            return meSeeWhoVO;
        } catch (Exception e) {
            throw new ServiceValidationException("查询我看过谁出错", e);
        }
    }

    @Override
    public List<User> getWhoSeeMe(Long userId) {
        try {
            List<Long> userIds = businessBrowseMapper.findWhoSeeMeForList(userId);
            List<Long> userIdList = new ArrayList<>();
            for (Long id : userIds) {
                if (!userIdList.contains(id)) {
                    userIdList.add(id);
                }
            }
            return userService.getUserByIds(userIdList);
        } catch (Exception e) {
            throw new ServiceValidationException("查询谁看过我出错!", e);
        }
    }
}
