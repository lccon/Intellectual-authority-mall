package com.mall.mapper;

import com.mall.domain.TaskRelease;
import com.mall.vo.TaskReleaseVO;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/15
 * @Author:lc
 */
public interface TaskReleaseMapper {

    /**
     * 新增需求任务
     * @param taskRelease
     */
    void addTaskRelease(TaskRelease taskRelease);

    /**
     * 修改需求任务
     * @param taskRelease
     */
    void updateTaskRelease(TaskRelease taskRelease);

    /**
     * 删除需求任务
     * @param ids
     * @return
     */
    Integer deleteTaskRelease(Long[] ids);

    /**
     * 获取需求任务列表信息
     * @return
     */
    List<TaskRelease> findTaskReleaseForList();

    /**
     * 获取单条需求任务信息
     * @param id
     * @return
     */
    TaskRelease getTaskReleaseById(Long id);

    int countnum(TaskReleaseVO taskReleaseVO);

    List<TaskRelease> findByPage(HashMap<String,Object> map);

    List<TaskRelease> getTaskReleaseByTask_category(Integer task_category);

    List<TaskRelease> findBytaskRelease(@Param("purpose") String purpose, @Param("detailedDesc") String detailedDesc);

    List<TaskRelease> findTaskReleaseByIds(@Param("releaseIds") List<Long> releaseIds);
}
