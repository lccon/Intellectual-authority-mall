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
    /** 收藏内容 */
    private String collectedContent;
    /** 收藏时间 */
    private Date collectedDate;
    /** 模块id */
    private Long moduleTypeId;

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

    public String getCollectedContent() {
        return collectedContent;
    }

    public void setCollectedContent(String collectedContent) {
        this.collectedContent = collectedContent;
    }

    public Date getCollectedDate() {
        return collectedDate;
    }

    public void setCollectedDate(Date collectedDate) {
        this.collectedDate = collectedDate;
    }

    public Long getModuleTypeId() {
        return moduleTypeId;
    }

    public void setModuleTypeId(Long moduleTypeId) {
        this.moduleTypeId = moduleTypeId;
    }
}
