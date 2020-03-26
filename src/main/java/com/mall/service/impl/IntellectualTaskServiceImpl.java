package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.component.ThreadVariable;
import com.mall.constant.CommonConstants;
import com.mall.domain.*;
import com.mall.enums.ModuleTypeEnum;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.IntellectualTaskMapper;
import com.mall.service.BusinessBrowseService;
import com.mall.service.BusinessCollectedService;
import com.mall.service.IntellectualTaskService;
import com.mall.service.RoofPlaceService;
import com.mall.utils.DateUtil;
import com.mall.utils.StringUtil;
import com.mall.vo.IntellectualTaskVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

/**
 * Description:
 *
 * @Date:2020/1/13
 * @Author:lc
 */
@Service("intellectualTaskService")
public class IntellectualTaskServiceImpl implements IntellectualTaskService {

    @Autowired
    private IntellectualTaskMapper intellectualTaskMapper;
    @Autowired
    private RoofPlaceService roofPlaceService;
    @Autowired
    private BusinessCollectedService businessCollectedService;
    @Autowired
    private BusinessBrowseService businessBrowseService;

    @Override
    public IntellectualTask addIntellectualTask(IntellectualTask intellectualTask) {
        if (intellectualTask == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            intellectualTaskMapper.addIntellectualTask(intellectualTask);
            if(intellectualTask.getTopDuration() != null && intellectualTask.getRoofPlaceState() != null) {
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
                roofPlace.setModuleTypeId(intellectualTask.getId());
                roofPlace.setTopDuration(intellectualTask.getTopDuration());
                roofPlace.setAuthorizeState(intellectualTask.getRoofPlaceState());
                roofPlaceService.addRoofPlace(roofPlace);
            }
            return intellectualTask;
        } catch (Exception e) {
            throw new ServiceValidationException("新增知识产权信息出错!", e);
        }
    }

    @Override
    public IntellectualTask updateIntellectualTask(IntellectualTask intellectualTask) {
        if (intellectualTask == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            intellectualTaskMapper.updateIntellectualTask(intellectualTask);
            if(intellectualTask.getRoofPlaceState() != null) {
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
                roofPlace.setModuleTypeId(intellectualTask.getId());
                roofPlace.setTopDuration(intellectualTask.getTopDuration());
                roofPlace.setAuthorizeState(intellectualTask.getRoofPlaceState());
                RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
                if (intellectualTask.getTopDuration() != null) {
                    if (roofPlaceInfo != null) {
                        roofPlaceService.updateRoofPlace(roofPlace);
                    } else {
                        roofPlaceService.addRoofPlace(roofPlace);
                    }
                } else if (intellectualTask.getTopDuration() == null && roofPlaceInfo != null) {
                    roofPlaceService.updateRoofPlace(roofPlace);
                }
            }
            return intellectualTask;
        } catch (Exception e) {
            throw new ServiceValidationException("修改知识产权信息出错!", e);
        }
    }

    @Override
    public Boolean deleteIntellectualTask(Long[] ids, HttpServletRequest request) {
        if (ids == null || ids.length <= 0) {
            throw new BusinessValidationException("信息不能为空!");
        }
        try {
            for (Long id : ids) {
                IntellectualTask intellectualTask = getIntellectualTaskById(id);
                if (intellectualTask != null) {
                    if(!StringUtils.isEmpty(intellectualTask.getProductPictureUrl())) {
                        String[] productPictureArr = intellectualTask.getProductPictureUrl().split(",");
                        for (String productPicture : productPictureArr) {
                            String realPath = request.getSession().getServletContext().getRealPath(productPicture);
                            File file = new File(realPath);
                            file.delete();
                        }
                    }
                    if(!StringUtils.isEmpty(intellectualTask.getProductVideoUrl())) {
                        String realPath = request.getSession().getServletContext().getRealPath(intellectualTask.getProductVideoUrl());
                        File file = new File(realPath);
                        file.delete();
                    }
                }
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
                roofPlace.setModuleTypeId(id);
                roofPlaceService.deleteRoofPlace(roofPlace);
                BusinessCollected businessCollected = new BusinessCollected();
                businessCollected.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
                businessCollected.setModuleTypeId(id);
                businessCollectedService.deleteUserCollected(businessCollected);
                BusinessBrowse businessBrowse = new BusinessBrowse();
                businessBrowse.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
                businessBrowse.setModuleTypeId(id);
                businessBrowseService.deleteUserBrowse(businessBrowse);
            }
            Integer count = intellectualTaskMapper.deleteIntellectualTask(ids);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("删除知识产权信息出错!", e);
        }
    }

    @Override
    public PageInfo<IntellectualTask> findIntellectualTaskForPage(IntellectualTaskVO intellectualTaskVO) {
        try {
            PageHelper.startPage(intellectualTaskVO.getPage(), intellectualTaskVO.getRows());
            List<IntellectualTask> intellectualTaskList = intellectualTaskMapper.findIntellectualTaskForList(intellectualTaskVO);
            handleIntellectualTask(intellectualTaskList);
            return new PageInfo<>(intellectualTaskList);
        } catch (Exception e) {
            throw new ServiceValidationException("分页查询知识产权信息出错!", e);
        }
    }

    @Override
    public IntellectualTask getIntellectualTaskById(Long id) {
        if (id == null) {
            throw new BusinessValidationException("参数不能为空");
        }
        try {
            IntellectualTask intellectualTask = intellectualTaskMapper.getIntellectualTaskById(id);
            // 置顶
            RoofPlace roofPlace = new RoofPlace();
            roofPlace.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
            roofPlace.setModuleTypeId(intellectualTask.getId());
            RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
            if (roofPlaceInfo != null) {
                intellectualTask.setRoofPlaceState(roofPlaceInfo.getAuthorizeState());
                intellectualTask.setTopDuration(roofPlaceInfo.getTopDuration());
            }
            // 收藏
            BusinessCollected businessCollected = new BusinessCollected();
            businessCollected.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
            businessCollected.setModuleTypeId(intellectualTask.getId());
            if(ThreadVariable.getSession() != null && ThreadVariable.getSession().getUserId() != null) {
                businessCollected.setUserId(ThreadVariable.getSession().getUserId());
                BusinessCollected businessCollectedInfo = businessCollectedService.getBusinessCollected(businessCollected);
                if (businessCollectedInfo != null) {
                    intellectualTask.setHasCollectedState(CommonConstants.IS_COLLECTED);
                } else {
                    intellectualTask.setHasCollectedState(CommonConstants.NOT_IS_COLLECTED);
                }
            }
            return intellectualTask;
        } catch (Exception e) {
            throw new ServiceValidationException("获取单条数据出错!", e);
        }
    }

    @Override
    public List<IntellectualTask> findIntellectualTaskForList(IntellectualTaskVO intellectualTaskVO) {
        List<IntellectualTask> intellectualTaskList = intellectualTaskMapper.findIntellectualTaskForList(intellectualTaskVO);
        handleIntellectualTask(intellectualTaskList);
        return intellectualTaskList;
    }

    @Override
    public List<IntellectualTask> findByintellectualTask(String productName,String productBrief) {
        return intellectualTaskMapper.findByintellectualTask(productName,productBrief);
    }

    @Override
    public List<IntellectualTask> findIntellectualTaskByIds(List<Long> taskIds) {
        if (taskIds == null || taskIds.size() <= 0) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            return intellectualTaskMapper.findIntellectualTaskByIds(taskIds);
        } catch (Exception e) {
            throw new ServiceValidationException("获取知识产权信息出错", e);
        }
    }

    @Override
    public void updateBrowseVolume(Long id, Long userId) {
        if (id == null) {
            throw new BusinessValidationException("主键不能为空!");
        }
        try {
            IntellectualTask intellectualTask = intellectualTaskMapper.getIntellectualTaskById(id);
            if (intellectualTask != null && intellectualTask.getUserId() != null && !userId.equals(intellectualTask.getUserId())) {
                intellectualTaskMapper.updateBrowseVolume(id);
            }
        } catch (Exception e) {
            throw new ServiceValidationException("修改浏览量出错!", e);
        }
    }

    @Override
    public List<IntellectualTask> findTaskPeriodDataForList(Integer periodType) {
        if (periodType == null) {
            throw new BusinessValidationException("时间区间类型不能为空!");
        }
        try {
            Date startTime = null;
            Date endTime = null;
            if (CommonConstants.ONE_PERIOD.equals(periodType)) {
                startTime = DateUtil.getLastPeriodDay(CommonConstants.ONE_PERIOD);
                endTime = new Date();
            } else if (CommonConstants.SEVEN_PERIOD.equals(periodType)) {
                startTime = DateUtil.getLastPeriodDay(CommonConstants.EIGHT);
                endTime = DateUtil.getLastPeriodDay(CommonConstants.ONE_PERIOD);
            } else if (CommonConstants.MONTH_PERIOD.equals(periodType)) {
                startTime = DateUtil.getLastPeriodDay(CommonConstants.MONTH_EIGHT);
                endTime = DateUtil.getLastPeriodDay(CommonConstants.EIGHT);
            }
            return intellectualTaskMapper.findTaskPeriodDataForList(startTime, endTime);
        } catch (Exception e) {
            throw new ServiceValidationException("获取知识产权列表出错!", e);
        }
    }

    @Override
    public pagebean<IntellectualTask> findByPage(int currentPage, IntellectualTaskVO intellectualTaskVO) {
        Date startTime = null;
        Date endTime = null;
        if (intellectualTaskVO.getPeriodType() != null) {
            if (CommonConstants.ONE_PERIOD.equals(intellectualTaskVO.getPeriodType())) {
                startTime = DateUtil.getLastPeriodDay(CommonConstants.ONE_PERIOD);
                endTime = new Date();
            } else if (CommonConstants.SEVEN_PERIOD.equals(intellectualTaskVO.getPeriodType())) {
                startTime = DateUtil.getLastPeriodDay(CommonConstants.EIGHT);
                endTime = DateUtil.getLastPeriodDay(CommonConstants.ONE_PERIOD);
            } else if (CommonConstants.MONTH_PERIOD.equals(intellectualTaskVO.getPeriodType())) {
                startTime = DateUtil.getLastPeriodDay(CommonConstants.MONTH_EIGHT);
                endTime = DateUtil.getLastPeriodDay(CommonConstants.EIGHT);
            }
        }
        HashMap<String,Object> map = new HashMap<String,Object>();
        pagebean<IntellectualTask> pageBean = new pagebean<IntellectualTask>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=10;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = intellectualTaskMapper.countnum(intellectualTaskVO);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        map.put("intellectualTaskVO", intellectualTaskVO);
        map.put("startTime", startTime);
        map.put("endTime", endTime);
        //封装每页显示的数据
        List<IntellectualTask> lists = intellectualTaskMapper.findByPage(map);
        handleIntellectualTask(lists);
        pageBean.setLists(lists);
        return pageBean;
    }

    private void handleIntellectualTask(List<IntellectualTask> intellectualTaskList) {
        BusinessCollected businessCollected = new BusinessCollected();
        businessCollected.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
        for (IntellectualTask intellectualTask:intellectualTaskList) {
            businessCollected.setModuleTypeId(intellectualTask.getId());
            if(ThreadVariable.getSession() != null && ThreadVariable.getSession().getUserId() != null) {
                businessCollected.setUserId(ThreadVariable.getSession().getUserId());
                BusinessCollected businessCollectedInfo = businessCollectedService.getBusinessCollected(businessCollected);
                if (businessCollectedInfo != null) {
                    intellectualTask.setHasCollectedState(CommonConstants.IS_COLLECTED);
                } else {
                    intellectualTask.setHasCollectedState(CommonConstants.NOT_IS_COLLECTED);
                }
            }
        }
    }
}
