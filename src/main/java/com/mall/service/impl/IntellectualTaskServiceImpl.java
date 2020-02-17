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
import org.springframework.util.StringUtils;
import com.mall.domain.pagebean;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.HashMap;
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

    @Override
    public List<IntellectualTask> findIntellectualTaskForList() {
        return intellectualTaskMapper.findIntellectualTaskForList();
    }

    @Override
    public List<IntellectualTask> findByintellectualTask(String product_name,String product_brief) {
        return intellectualTaskMapper.findByintellectualTask(product_name,product_brief);
    }


    public int countnum(){
        return intellectualTaskMapper.countnum();
    }
    @Override
    public pagebean<IntellectualTask> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        pagebean<IntellectualTask> pageBean = new pagebean<IntellectualTask>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=1;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = intellectualTaskMapper.countnum();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<IntellectualTask> lists = intellectualTaskMapper.findByPage(map);
        pageBean.setLists(lists);
        return pageBean;
    }

}
