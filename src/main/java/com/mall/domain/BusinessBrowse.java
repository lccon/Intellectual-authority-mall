package com.mall.domain;

import com.mall.base.BaseDomain;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
public class BusinessBrowse extends BaseDomain{
    /** 主键id */
    private Long id;
    /** 模块类型 */
    private Integer moduleType;
    /** 模块id */
    private Long moduleTypeId;
    /** 访客id */
    private Long visitorId;
    /** 发布id */
    private Long publisherId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public Long getVisitorId() {
        return visitorId;
    }

    public void setVisitorId(Long visitorId) {
        this.visitorId = visitorId;
    }

    public Long getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(Long publisherId) {
        this.publisherId = publisherId;
    }
}
