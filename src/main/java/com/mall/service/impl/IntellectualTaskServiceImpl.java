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
import com.mall.service.BusinessCollectedService;
import com.mall.service.IntellectualTaskService;
import com.mall.service.RoofPlaceService;
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
            RoofPlace roofPlace = new RoofPlace();
            roofPlace.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
            roofPlace.setModuleTypeId(intellectualTask.getId());
            RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
            if (roofPlaceInfo != null) {
                intellectualTask.setRoofPlaceState(roofPlaceInfo.getAuthorizeState());
                intellectualTask.setTopDuration(roofPlaceInfo.getTopDuration());
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
        Collections.sort(intellectualTaskList, new Comparator<IntellectualTask>() {
            @Override
            public int compare(IntellectualTask o1, IntellectualTask o2) {
                if (o1.getRoofPlaceState()!= null && o2.getRoofPlaceState() != null &&
                        !o1.getRoofPlaceState().equals(o2.getRoofPlaceState())) {
                    return o2.getRoofPlaceState()-o1.getRoofPlaceState();
                } else {
                    return (int) (o2.getCreateDate().getTime()-o1.getCreateDate().getTime());
                }
            }
        });
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
    public pagebean<IntellectualTask> findByPage(int currentPage, IntellectualTaskVO intellectualTaskVO) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        pagebean<IntellectualTask> pageBean = new pagebean<IntellectualTask>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=3;
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
        //封装每页显示的数据
        List<IntellectualTask> lists = intellectualTaskMapper.findByPage(map);
        handleIntellectualTask(lists);
        Collections.sort(lists, new Comparator<IntellectualTask>() {
            @Override
            public int compare(IntellectualTask o1, IntellectualTask o2) {
                if (o1.getRoofPlaceState()!= null && o2.getRoofPlaceState() != null &&
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

    private void handleIntellectualTask(List<IntellectualTask> intellectualTaskList) {
        RoofPlace roofPlace = new RoofPlace();
        BusinessCollected businessCollected = new BusinessCollected();
        roofPlace.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
        businessCollected.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
        for (IntellectualTask intellectualTask:intellectualTaskList) {
            roofPlace.setModuleTypeId(intellectualTask.getId());
            RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
            if (roofPlaceInfo != null) {
                if (roofPlaceInfo.getTopEndTime().before(new Date())) {
                    roofPlaceService.deleteRoofPlace(roofPlace);
                } else {
                    intellectualTask.setRoofPlaceState(roofPlaceInfo.getAuthorizeState());
                    intellectualTask.setTopDuration(roofPlaceInfo.getTopDuration());
                }
            }
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
