package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.constant.CommonConstants;
import com.mall.domain.PolicyAdvice;
import com.mall.domain.RoofPlace;
import com.mall.domain.pagebean;
import com.mall.enums.ModuleTypeEnum;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.PolicyAdviceMapper;
import com.mall.service.PolicyAdviceService;
import com.mall.service.RoofPlaceService;
import com.mall.utils.StringUtil;
import com.mall.vo.PolicyAdviceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

/**
 * Description:
 *
 * @Date:2020/1/10
 * @Author:lc
 */
@Service("freeMessageService")
public class PolicyAdviceServiceImpl implements PolicyAdviceService {

    @Autowired
    private PolicyAdviceMapper policyAdviceMapper;
    @Autowired
    private RoofPlaceService roofPlaceService;

    @Override
    public PolicyAdvice addPolicyAdvice(PolicyAdvice policyAdvice) {
        if(policyAdvice == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            policyAdviceMapper.addPolicyAdvice(policyAdvice);
            if(policyAdvice.getTopDuration() != null && policyAdvice.getRoofPlaceState() != null) {
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.POLICY_ADVICE.getModuleCode());
                roofPlace.setModuleTypeId(policyAdvice.getId());
                roofPlace.setTopDuration(policyAdvice.getTopDuration());
                roofPlace.setAuthorizeState(policyAdvice.getRoofPlaceState());
                roofPlaceService.addRoofPlace(roofPlace);
            }
            return policyAdvice;
        } catch (Exception e) {
            throw new ServiceValidationException("新增消息出错!", e);
        }
    }

    @Override
    public PolicyAdvice updatePolicyAdvice(PolicyAdvice policyAdvice) {
        if(policyAdvice == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            policyAdviceMapper.updatePolicyAdvice(policyAdvice);
            if (policyAdvice.getRoofPlaceState() != null) {
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.POLICY_ADVICE.getModuleCode());
                roofPlace.setModuleTypeId(policyAdvice.getId());
                roofPlace.setTopDuration(policyAdvice.getTopDuration());
                roofPlace.setAuthorizeState(policyAdvice.getRoofPlaceState());
                RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
                if(policyAdvice.getTopDuration() != null) {
                    if (roofPlaceInfo != null) {
                        roofPlaceService.updateRoofPlace(roofPlace);
                    } else {
                        roofPlaceService.addRoofPlace(roofPlace);
                    }
                } else if (policyAdvice.getTopDuration() == null && roofPlaceInfo != null) {
                    roofPlaceService.updateRoofPlace(roofPlace);
                }
            }
            return policyAdvice;
        } catch (Exception e) {
            throw new ServiceValidationException("修改消息出错!", e);
        }
    }

    @Override
    public void updateBrowseVolume(Long id, Long userId) {
        if (id == null) {
            throw new BusinessValidationException("主键不能为空!");
        }
        try {
            PolicyAdvice policyAdvice = policyAdviceMapper.getPolicyAdviceById(id);
            if (policyAdvice != null && policyAdvice.getUserId() != null && !userId.equals(policyAdvice.getUserId())) {
                policyAdviceMapper.updateBrowseVolume(id);
            }
        } catch (Exception e) {
            throw new ServiceValidationException("修改浏览量出错!", e);
        }
    }

    @Override
    public Boolean deletePolicyAdvice(Long[] ids, HttpServletRequest request) {
        if(ids == null || ids.length <= 0) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            for (Long id : ids) {
                PolicyAdvice policyAdvice = getPolicyAdviceById(id);
                if (policyAdvice != null && !StringUtils.isEmpty(policyAdvice.getAdvicePictureUrl())) {
                    String[] advicePictureArr = policyAdvice.getAdvicePictureUrl().split(",");
                    for (String advicePicture : advicePictureArr) {
                        String realPath = request.getSession().getServletContext().getRealPath(advicePicture);
                        File file = new File(realPath);
                        file.delete();
                    }
                }
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.POLICY_ADVICE.getModuleCode());
                roofPlace.setModuleTypeId(id);
                roofPlaceService.deleteRoofPlace(roofPlace);
            }
            Integer count = policyAdviceMapper.deletePolicyAdvice(ids);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("删除消息出错!", e);
        }
    }

    @Override
    public PageInfo<PolicyAdvice> findPolicyAdviceForPage(PolicyAdviceVO policyAdviceVO) {
        try {
            PageHelper.startPage(policyAdviceVO.getPage(), policyAdviceVO.getRows());
            List<PolicyAdvice> policyAdviceList = policyAdviceMapper.findPolicyAdviceForList();
            return new PageInfo<>(policyAdviceList);
        } catch (Exception e) {
            throw new ServiceValidationException("分页查询数据出错!", e);
        }
    }

    @Override
    public List<PolicyAdvice> findPolicyAdviceForList() {
        return policyAdviceMapper.findPolicyAdviceForList();
    }

    @Override
    public PolicyAdvice getPolicyAdviceById(Long id) {
        if (id == null) {
            throw new BusinessValidationException("主键信息不能为空!");
        }
        try {
            PolicyAdvice policyAdvice = policyAdviceMapper.getPolicyAdviceById(id);
            RoofPlace roofPlace = new RoofPlace();
            roofPlace.setModuleType(ModuleTypeEnum.POLICY_ADVICE.getModuleCode());
            roofPlace.setModuleTypeId(policyAdvice.getId());
            RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
            if (roofPlaceInfo != null) {
                policyAdvice.setRoofPlaceState(roofPlaceInfo.getAuthorizeState());
                policyAdvice.setTopDuration(roofPlaceInfo.getTopDuration());
            }
            return policyAdvice;
        } catch (Exception e) {
            throw new ServiceValidationException("获取单条信息出错！", e);
        }
    }

    @Override
    public pagebean<PolicyAdvice> findByPage(int currentPage, Integer adviceCategory) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        pagebean<PolicyAdvice> pageBean = new pagebean<PolicyAdvice>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=10;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = policyAdviceMapper.countnum(adviceCategory);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        map.put("adviceCategory", adviceCategory);
        //封装每页显示的数据
        List<PolicyAdvice> lists = policyAdviceMapper.findByPage(map);
        pageBean.setLists(lists);
        return pageBean;
    }

}
