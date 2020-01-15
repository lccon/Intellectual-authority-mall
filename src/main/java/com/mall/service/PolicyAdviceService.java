package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.PolicyAdvice;
import com.mall.vo.PolicyAdviceVO;

/**
 * Description:
 *
 * @Date:2020/1/10
 * @Author:lc
 */
public interface PolicyAdviceService {

    /**
     * 新增消息
     * @param freeMessage
     * @return
     */
    PolicyAdvice addPolicyAdvice(PolicyAdvice freeMessage);

    /**
     * 修改消息
     * @param freeMessage
     * @return
     */
    PolicyAdvice updatePolicyAdvice(PolicyAdvice freeMessage);

    /**
     * 删除消息
     * @param ids
     * @return
     */
    Boolean deletePolicyAdvice(Long[] ids);

    /**
     * 分页查询消息
     * @param policyAdviceVO
     * @return
     */
    PageInfo<PolicyAdvice> findPolicyAdviceForPage(PolicyAdviceVO policyAdviceVO);

    /**
     * 查询单条消息
     * @param id
     * @return
     */
    PolicyAdvice getPolicyAdviceById(Long id);
}
