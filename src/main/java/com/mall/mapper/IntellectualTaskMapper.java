package com.mall.mapper;

import com.mall.domain.IntellectualTask;
import com.mall.vo.IntellectualTaskVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/13
 * @Author:lc
 */
public interface IntellectualTaskMapper {

    /**
     * 新增知识商城信息
     * @param intellectualTask
     */
    void addIntellectualTask(IntellectualTask intellectualTask);

    /**
     * 修改知识商城信息
     * @param intellectualTask
     */
    void updateIntellectualTask(IntellectualTask intellectualTask);

    /**
     * 删除知识商城信息
     * @param ids
     * @return
     */
    Integer deleteIntellectualTask(Long[] ids);

    /**
     * 查询所有信息
     * @return
     */
    List<IntellectualTask> findIntellectualTaskForList(IntellectualTaskVO intellectualTaskVO);

    /**
     * 获取知识商城单条信息
     * @param id
     * @return
     */
    IntellectualTask getIntellectualTaskById(Long id);

    int countnum(IntellectualTaskVO intellectualTaskVO);

    List<IntellectualTask> findByPage(HashMap<String,Object> map);

    List<IntellectualTask> findByintellectualTask(@Param("productName") String productName, @Param("productBrief") String productBrief);

    List<IntellectualTask> findIntellectualTaskByIds(@Param("taskIds") List<Long> taskIds);

    void updateBrowseVolume(Long id);

    List<IntellectualTask> findTaskPeriodDataForList(@Param("startTime") Date startTime, @Param("endTime") Date endTime);
}
