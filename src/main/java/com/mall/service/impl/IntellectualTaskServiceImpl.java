package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.IntellectualTask;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.IntellectualTaskMapper;
import com.mall.service.IntellectualTaskService;
import com.mall.utils.StringUtil;
import com.mall.vo.IntellectualTaskVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public IntellectualTask addIntellectualTask(IntellectualTask intellectualTask) {
        if (intellectualTask == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            intellectualTaskMapper.addIntellectualTask(intellectualTask);
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
            return intellectualTask;
        } catch (Exception e) {
            throw new ServiceValidationException("修改知识产权信息出错!", e);
        }
    }

    @Override
    public Boolean deleteIntellectualTask(Long[] ids) {
        if (ids == null || ids.length <= 0) {
            throw new BusinessValidationException("信息不能为空!");
        }
        try {
            Integer count = intellectualTaskMapper.deleteIntellectualTask(ids);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("删除知识产权信息出错!", e);
        }
    }

    @Override
    public PageInfo<IntellectualTask> findIntellectualTaskForPage(IntellectualTaskVO intellectualTaskVO) {
        try {
            PageHelper.startPage(intellectualTaskVO.getPage(), intellectualTaskVO.getRows(),
                    StringUtil.joinSortFieldOrder(intellectualTaskVO.getSidx(), intellectualTaskVO.getSord()));
            List<IntellectualTask> intellectualTaskList = intellectualTaskMapper.findIntellectualTaskForList();
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
            return intellectualTaskMapper.getIntellectualTaskById(id);
        } catch (Exception e) {
            throw new ServiceValidationException("获取单条数据出错!", e);
        }
    }
}
