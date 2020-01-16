package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.PolicyAdvice;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.PolicyAdviceMapper;
import com.mall.service.PolicyAdviceService;
import com.mall.utils.StringUtil;
import com.mall.vo.PolicyAdviceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

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

    @Override
    public PolicyAdvice addPolicyAdvice(PolicyAdvice policyAdvice) {
        if(policyAdvice == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            policyAdviceMapper.addPolicyAdvice(policyAdvice);
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
            return policyAdvice;
        } catch (Exception e) {
            throw new ServiceValidationException("修改消息出错!", e);
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
            PageHelper.startPage(policyAdviceVO.getPage(), policyAdviceVO.getRows(),
                    StringUtil.joinSortFieldOrder(policyAdviceVO.getSidx(), policyAdviceVO.getSord()));
            List<PolicyAdvice> freeMessageList = policyAdviceMapper.findPolicyAdviceForList();
            return new PageInfo<>(freeMessageList);
        } catch (Exception e) {
            throw new ServiceValidationException("分页查询数据出错!", e);
        }
    }

    @Override
    public PolicyAdvice getPolicyAdviceById(Long id) {
        if (id == null) {
            throw new BusinessValidationException("主键信息不能为空!");
        }
        try {
            PolicyAdvice policyAdvice = policyAdviceMapper.getPolicyAdviceById(id);
            return policyAdvice;
        } catch (Exception e) {
            throw new ServiceValidationException("获取单条信息出错！", e);
        }
    }
}
