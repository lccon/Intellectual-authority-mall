package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.TaskRelease;
import com.mall.domain.pagebean;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.TaskReleaseMapper;
import com.mall.service.TaskReleaseService;
import com.mall.utils.StringUtil;
import com.mall.vo.TaskReleaseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
    public List<TaskRelease> getTaskReleaseByTask_category(Integer taskCategory) {
        return taskReleaseMapper.getTaskReleaseByTask_category(taskCategory);
    }
    @Override
    public List<TaskRelease> findBytaskRelease(String purpose,String detailedDesc) {
        return taskReleaseMapper.findBytaskRelease(purpose,detailedDesc);
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

    public int countnum(){
        return taskReleaseMapper.countnum();
    }
    @Override
    public pagebean<TaskRelease> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        pagebean<TaskRelease> pageBean = new pagebean<TaskRelease>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=3;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = taskReleaseMapper.countnum();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<TaskRelease> lists = taskReleaseMapper.findByPage(map);
        pageBean.setLists(lists);
        return pageBean;
    }
}
