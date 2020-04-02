package com.mall.domain;

import com.mall.base.BaseDomain;

import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/1/21
 * @Author:lc
 */
public class RoofPlace extends BaseDomain {

    private Long id;
    /** 模块类型，1:知识产权，2:代办公司，3:需求任务，4:政策咨询 */
    private Integer moduleType;
    /** 模块id */
    private Long moduleTypeId;
    /** 认证状态 0:待审核 1:驳回 2:置顶 */
    private Integer authorizeState;
    /** 置顶时长 天数*/
    private Integer topDuration;
    /** 置顶开始时间 */
    private Date topStartTime;
    /** 置顶结束时间 */
    private Date topEndTime;

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

    public Integer getAuthorizeState() {
        return authorizeState;
    }

    public void setAuthorizeState(Integer authorizeState) {
        this.authorizeState = authorizeState;
    }

    public Integer getTopDuration() {
        return topDuration;
    }

    public void setTopDuration(Integer topDuration) {
        this.topDuration = topDuration;
    }

    public Date getTopStartTime() {
        return topStartTime;
    }

    public void setTopStartTime(Date topStartTime) {
        this.topStartTime = topStartTime;
    }

    public Date getTopEndTime() {
        return topEndTime;
    }

    public void setTopEndTime(Date topEndTime) {
        this.topEndTime = topEndTime;
    }

    @Override
    public String toString() {
        return "RoofPlace{" +
                "id=" + id +
                ", moduleType=" + moduleType +
                ", moduleTypeId=" + moduleTypeId +
                ", authorizeState=" + authorizeState +
                ", topDuration=" + topDuration +
                ", topStartTime=" + topStartTime +
                ", topEndTime=" + topEndTime +
                '}';
    }
}
