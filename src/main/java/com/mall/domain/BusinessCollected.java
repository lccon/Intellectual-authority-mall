package com.mall.domain;

import com.mall.base.BaseDomain;

/**
 * Description:
 *
 * @Date:2020/2/15
 * @Author:lc
 */
public class BusinessCollected extends BaseDomain {

    /** 模块类型 */
    private Integer moduleType;
    /** 模块id */
    private Long moduleTypeId;
    /** 用户id */
    private Long userId;

    public Integer getModuleType() {
        return moduleType;
    }

    public void setModuleType(Integer moduleType) {
        this.moduleType = moduleType;
    }

    public Long getModuleTypeId() {
        return moduleTypeId;
    }

    public void setModuleTypeId(Long moduleTypeId) {
        this.moduleTypeId = moduleTypeId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
