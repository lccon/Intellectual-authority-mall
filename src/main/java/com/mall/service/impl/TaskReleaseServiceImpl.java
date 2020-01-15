package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.TaskRelease;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.TaskReleaseMapper;
import com.mall.service.TaskReleaseService;
import com.mall.utils.StringUtil;
import com.mall.vo.TaskReleaseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public TaskRelease addTaskRelease(TaskRelease taskRelease) {
        if (taskRelease == null) {
            throw new BusinessValidationException("参数不能为空！");
        }
        try {
            taskReleaseMapper.addTaskRelease(taskRelease);
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
            List<TaskRelease> taskReleaseList = taskReleaseMapper.findTaskReleaseForList();
            return new PageInfo<>(taskReleaseList);
        } catch (Exception e) {
            throw new ServiceValidationException("获取需求任务列表出错!", e);
        }
    }

    @Override
    public TaskRelease getTaskReleaseById(Long id) {
        if(id == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            return taskReleaseMapper.getTaskReleaseById(id);
        } catch (Exception e) {
            throw new ServiceValidationException("获取需求任务信息出错!", e);
        }
    }
}
