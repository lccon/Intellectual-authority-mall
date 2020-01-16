package com.mall.mapper;

import com.mall.domain.PolicyAdvice;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/9
 * @Author:lc
 */
public interface PolicyAdviceMapper {

    /**
     * 添加信息
     * @param policyAdvice
     */
    void addPolicyAdvice(PolicyAdvice policyAdvice);

    /**
     * 修改发布的信息
     */
    void updatePolicyAdvice(PolicyAdvice policyAdvice);

    /**
     * 删除发布的信息
     * @param ids
     * @returnl
     */
    Integer deletePolicyAdvice(Long[] ids);

    /**
     * 查询列表
     * @return
     */
    List<PolicyAdvice> findPolicyAdviceForList();

    /**
     * 查询单条信息
     * @param id
     * @return
     */
    PolicyAdvice getPolicyAdviceById(Long id);
}