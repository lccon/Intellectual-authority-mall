package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.TaskRelease;
import com.mall.domain.pagebean;
import com.mall.vo.TaskReleaseVO;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/15
 * @Author:lc
 */
public interface TaskReleaseService {

    /**
     * 新增需求任务
     * @param taskRelease
     */
    TaskRelease addTaskRelease(TaskRelease taskRelease);

    /**
     * 修改需求任务
     * @param taskRelease
     */
    TaskRelease updateTaskRelease(TaskRelease taskRelease);

    /**
     * 删除需求任务
     * @param ids
     * @return
     */
    Boolean deleteTaskRelease(Long[] ids);

    /**
     * 获取需求任务列表信息
     * @return
     */
    PageInfo<TaskRelease> findTaskReleaseForPage(TaskReleaseVO taskReleaseVO);

    /**
     * 获取单条需求任务信息
     * @param id
     * @return
     */
    TaskRelease getTaskReleaseById(Long id);

    List<TaskRelease> getTaskReleaseByTask_category(Integer taskCategory);

    pagebean<TaskRelease> findByPage(int currentPage, TaskReleaseVO taskReleaseVO);

    List<TaskRelease> findBytaskRelease(String purpose,String detailedDesc);

    List<TaskRelease> findTaskReleaseByIds(List<Long> releaseIds);

    void updateBrowseVolume(Long id, Long userId);

    List<TaskRelease> findTaskPeriodDataForList(Integer periodType);
}
