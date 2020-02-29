package com.mall.service.impl;

import com.mall.domain.*;
import com.mall.enums.ModuleTypeEnum;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.BusinessBrowseMapper;
import com.mall.service.*;
import com.mall.vo.MeSeeWhoVO;
import com.mall.vo.WhoSeeMeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

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
        if (businessBrowse == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        if (businessBrowse.getPublisherId() == null) {
            throw new BusinessValidationException("发布信息主键不能为空!");
        }
        try {
            Integer count = this.countBusinessBrowseNum(businessBrowse);
            if (count <= 0 && !businessBrowse.getPublisherId().equals(businessBrowse.getVisitorId())) {
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
                if (ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode().equals(businessBrowse.getModuleType())) {
                    taskIds.add(businessBrowse.getModuleTypeId());
                } else if (ModuleTypeEnum.AUTHORIZE_COMPANY.getModuleCode().equals(businessBrowse.getModuleType())) {
                    companyIds.add(businessBrowse.getModuleTypeId());
                } else if (ModuleTypeEnum.TASK_RELEASE.getModuleCode().equals(businessBrowse.getModuleType())) {
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
    public List<WhoSeeMeVO> getWhoSeeMe(Long userId) {
        try {
            List<BusinessBrowse> businessBrowseList = businessBrowseMapper.findWhoSeeMeForList(userId);
            if (businessBrowseList != null && businessBrowseList.size() > 0) {
                List<WhoSeeMeVO> whoSeeMeVOList = new ArrayList<>();
                for (BusinessBrowse businessBrowse : businessBrowseList) {
                    WhoSeeMeVO whoSeeMeVO = new WhoSeeMeVO();
                    User user = userService.findUserById(businessBrowse.getVisitorId());
                    if(user != null) {
                        if(!StringUtils.isEmpty(user.getUsername())) {
                            whoSeeMeVO.setUserName(user.getUsername());
                        }
                        if (!StringUtils.isEmpty(user.getHeadPortrait())) {
                            whoSeeMeVO.setHeadPortrait(user.getHeadPortrait());
                        }
                    }
                    String businessContent = null;
                    if (ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode().equals(businessBrowse.getModuleType())) {
                        IntellectualTask intellectualTask = intellectualTaskService.getIntellectualTaskById(businessBrowse.getModuleTypeId());
                        businessContent = intellectualTask.getProductName();
                    } else if (ModuleTypeEnum.AUTHORIZE_COMPANY.getModuleCode().equals(businessBrowse.getModuleType())) {
                        AuthorizeCompany authorizeCompany = authorizeCompanyService.getAuthorizeCompanyById(businessBrowse.getModuleTypeId());
                        businessContent = authorizeCompany.getCompanyName();
                    } else if (ModuleTypeEnum.TASK_RELEASE.getModuleCode().equals(businessBrowse.getModuleType())) {
                        TaskRelease taskRelease = taskReleaseService.getTaskReleaseById(businessBrowse.getModuleTypeId());
                        businessContent = taskRelease.getPurpose();
                    }
                    whoSeeMeVO.setBusinessContent(businessContent);
                    whoSeeMeVO.setCreateDate(businessBrowse.getCreateDate());
                    whoSeeMeVOList.add(whoSeeMeVO);
                }
                return whoSeeMeVOList;
            }
            return null;
        } catch (Exception e) {
            throw new ServiceValidationException("查询谁看过我出错!", e);
        }
    }
}
