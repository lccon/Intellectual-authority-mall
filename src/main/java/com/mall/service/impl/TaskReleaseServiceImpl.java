package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.component.ThreadVariable;
import com.mall.constant.CommonConstants;
import com.mall.domain.*;
import com.mall.enums.ModuleTypeEnum;
import com.mall.enums.RoofPlaceStateEnum;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.TaskReleaseMapper;
import com.mall.service.BusinessCollectedService;
import com.mall.service.RoofPlaceService;
import com.mall.service.TaskReleaseService;
import com.mall.utils.StringUtil;
import com.mall.vo.TaskReleaseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Description:
 *
 * @Date:2020/1/15
 * @Author:lc
 */
@Service("taskReleaseService")
public class TaskReleaseServiceImpl implements TaskReleaseService {

    @Autowired
    private TaskReleaseMapper taskReleaseMapper;
    @Autowired
    private RoofPlaceService roofPlaceService;
    @Autowired
    private BusinessCollectedService businessCollectedService;

    @Override
    public TaskRelease addTaskRelease(TaskRelease taskRelease) {
        if (taskRelease == null) {
            throw new BusinessValidationException("参数不能为空！");
        }
        try {
            taskReleaseMapper.addTaskRelease(taskRelease);
            if(taskRelease.getTopDuration() != null && taskRelease.getRoofPlaceState() != null) {
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.TASK_RELEASE.getModuleCode());
                roofPlace.setModuleTypeId(taskRelease.getId());
                roofPlace.setTopDuration(taskRelease.getTopDuration());
                roofPlace.setAuthorizeState(taskRelease.getRoofPlaceState());
                roofPlaceService.addRoofPlace(roofPlace);
            }
            return taskRelease;
        } catch (Exception e) {
            throw new ServiceValidationException("新增需求任务出错!", e);
        }
    }

    @Override
    public TaskRelease updateTaskRelease(TaskRelease taskRelease) {
        if (taskRelease == null) {
            throw new BusinessValidationException("参数不能为空！");
        }
        try {
            taskReleaseMapper.updateTaskRelease(taskRelease);
            if (taskRelease.getRoofPlaceState() != null) {
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.TASK_RELEASE.getModuleCode());
                roofPlace.setModuleTypeId(taskRelease.getId());
                roofPlace.setTopDuration(taskRelease.getTopDuration());
                roofPlace.setAuthorizeState(taskRelease.getRoofPlaceState());
                RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
                if (taskRelease.getTopDuration() != null) {
                    if (roofPlaceInfo != null) {
                        roofPlaceService.updateRoofPlace(roofPlace);
                    } else {
                        roofPlaceService.addRoofPlace(roofPlace);
                    }
                } else if (taskRelease.getTopDuration() == null && roofPlaceInfo != null) {
                    roofPlaceService.updateRoofPlace(roofPlace);
                }
            }
            return taskRelease;
        } catch (Exception e) {
            throw new ServiceValidationException("修改需求任务出错!", e);
        }
    }

    @Override
    public Boolean deleteTaskRelease(Long[] ids) {
        if (ids == null || ids.length <= 0) {
            throw new BusinessValidationException("参数不能为空！");
        }
        try {
            Integer count = taskReleaseMapper.deleteTaskRelease(ids);
            for (Long id : ids) {
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.TASK_RELEASE.getModuleCode());
                roofPlace.setModuleTypeId(id);
                roofPlaceService.deleteRoofPlace(roofPlace);
            }

            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("删除需求任务出错!", e);
        }
    }

    @Override
    public PageInfo<TaskRelease> findTaskReleaseForPage(TaskReleaseVO taskReleaseVO) {
        try {
            PageHelper.startPage(taskReleaseVO.getPage(), taskReleaseVO.getRows(),
                    StringUtil.joinSortFieldOrder(taskReleaseVO.getSidx(), taskReleaseVO.getSord()));
            List<TaskRelease> taskReleaseList = taskReleaseMapper.findTaskReleaseForList(taskReleaseVO);
            handleTaskRelease(taskReleaseList);
            return new PageInfo<>(taskReleaseList);
        } catch (Exception e) {
            throw new ServiceValidationException("获取需求任务列表出错!", e);
        }
    }
    @Override
    public List<TaskRelease> getTaskReleaseByTask_category(Integer taskCategory) {
        return taskReleaseMapper.getTaskReleaseByTask_category(taskCategory);
    }
    @Override
    public List<TaskRelease> findBytaskRelease(String purpose,String detailedDesc) {
        return taskReleaseMapper.findBytaskRelease(purpose,detailedDesc);
    }

    @Override
    public List<TaskRelease> findTaskReleaseByIds(List<Long> releaseIds) {
        if (releaseIds == null || releaseIds.size() <= 0) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            return taskReleaseMapper.findTaskReleaseByIds(releaseIds);
        } catch (Exception e) {
            throw new ServiceValidationException("获取需求任务信息出错", e);
        }
    }

    @Override
    public TaskRelease getTaskReleaseById(Long id) {
        if(id == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            TaskRelease taskRelease = taskReleaseMapper.getTaskReleaseById(id);
            RoofPlace roofPlace = new RoofPlace();
            roofPlace.setModuleType(ModuleTypeEnum.TASK_RELEASE.getModuleCode());
            roofPlace.setModuleTypeId(taskRelease.getId());
            RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
            if (roofPlaceInfo != null) {
                taskRelease.setRoofPlaceState(roofPlaceInfo.getAuthorizeState());
                taskRelease.setTopDuration(roofPlaceInfo.getTopDuration());
            }
            return taskRelease;
        } catch (Exception e) {
            throw new ServiceValidationException("获取需求任务信息出错!", e);
        }
    }

    @Override
    public pagebean<TaskRelease> findByPage(int currentPage, TaskReleaseVO taskReleaseVO) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        pagebean<TaskRelease> pageBean = new pagebean<TaskRelease>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=3;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = taskReleaseMapper.countnum(taskReleaseVO);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        map.put("taskReleaseVO", taskReleaseVO);
        //封装每页显示的数据
        List<TaskRelease> lists = taskReleaseMapper.findByPage(map);
        handleTaskRelease(lists);
        Collections.sort(lists, new Comparator<TaskRelease>() {
            @Override
            public int compare(TaskRelease o1, TaskRelease o2) {
                if (o1.getRoofPlaceState() != null && o2.getRoofPlaceState() != null &&
                        !o1.getRoofPlaceState().equals(o2.getRoofPlaceState())) {
                    return o2.getRoofPlaceState()-o1.getRoofPlaceState();
                } else {
                    return (int) (o2.getCreateDate().getTime()-o1.getCreateDate().getTime());
                }
            }
        });
        pageBean.setLists(lists);
        return pageBean;
    }

    private void handleTaskRelease(List<TaskRelease> taskReleaseList) {
        BusinessCollected businessCollected = new BusinessCollected();
        RoofPlace roofPlace = new RoofPlace();
        roofPlace.setModuleType(ModuleTypeEnum.TASK_RELEASE.getModuleCode());
        businessCollected.setModuleType(ModuleTypeEnum.TASK_RELEASE.getModuleCode());
        for (TaskRelease taskRelease : taskReleaseList) {
            roofPlace.setModuleTypeId(taskRelease.getId());
            RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
            if (roofPlaceInfo != null) {
                if (roofPlaceInfo.getTopEndTime().before(new Date())) {
                    roofPlaceService.deleteRoofPlace(roofPlace);
                } else {
                    taskRelease.setRoofPlaceState(roofPlaceInfo.getAuthorizeState());
                    taskRelease.setTopDuration(roofPlaceInfo.getTopDuration());
                }
            }
            businessCollected.setModuleTypeId(taskRelease.getId());
            if(ThreadVariable.getSession() != null && ThreadVariable.getSession().getUserId() != null) {
                businessCollected.setUserId(ThreadVariable.getSession().getUserId());
                BusinessCollected businessCollectedInfo = businessCollectedService.getBusinessCollected(businessCollected);
                if (businessCollectedInfo != null) {
                    taskRelease.setHasCollectedState(CommonConstants.IS_COLLECTED);
                } else {
                    taskRelease.setHasCollectedState(CommonConstants.NOT_IS_COLLECTED);
                }
            }
        }
    }
}
