package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.IntellectualTask;
import com.mall.vo.IntellectualTaskVO;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/13
 * @Author:lc
 */
public interface IntellectualTaskService {

    /**
     * 新增知识商城信息
     * @param intellectualTask
     */
    IntellectualTask addIntellectualTask(IntellectualTask intellectualTask);

    /**
     * 修改知识商城信息
     * @param intellectualTask
     */
    IntellectualTask updateIntellectualTask(IntellectualTask intellectualTask);

    /**
     * 删除知识商城信息
     * @param ids
     * @return
     */
    Boolean deleteIntellectualTask(Long[] ids);

    /**
     * 查询所有信息
     * @return
     */
    PageInfo<IntellectualTask> findIntellectualTaskForPage(IntellectualTaskVO intellectualTaskVO);

    /**
     * 获取知识商城单条信息
     * @param id
     * @return
     */
    IntellectualTask getIntellectualTaskById(Long id);

}