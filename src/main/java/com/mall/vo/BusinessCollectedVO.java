package com.mall.vo;

import com.mall.base.BaseVO;

import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/2/15
 * @Author:lc
 */
public class BusinessCollectedVO extends BaseVO {

    /** 模块类型 */
    private Integer moduleType;
    /** 用户id */
    private Long userId;

    public Integer getModuleType() {
        return moduleType;
    }

    public void setModuleType(Integer moduleType) {
        this.moduleType = moduleType;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

}
