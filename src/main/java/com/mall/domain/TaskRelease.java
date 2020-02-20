package com.mall.domain;

import com.mall.base.BaseDomain;

import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/1/15
 * @Author:lc
 */
public class TaskRelease extends BaseDomain{

    private Long id;
    /** 任务类型 */
    private Integer taskCategory;
    /** 知识产权类型 */
    private Integer intellectualProperty;
    /** 行业所属 */
    private Integer industryBelongs;
    /** 用途 */
    private String purpose;
    /** 详细说明 */
    private String detailedDesc;
    /** 真是姓名 */
    private String realName;
    /** 手机号 */
    private String mobile;
    /** 状态 */
    private Integer state;
    /** 是否置顶 */
    private Integer roofPlaceState;
    /** 置顶时长 天数*/
    private Integer topDuration;
    /** 是否已经收藏 */
    private Integer hasCollectedState;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getTaskCategory() {
        return taskCategory;
    }

    public void setTaskCategory(Integer taskCategory) {
        this.taskCategory = taskCategory;
    }

    public Integer getIntellectualProperty() {
        return intellectualProperty;
    }

    public void setIntellectualProperty(Integer intellectualProperty) {
        this.intellectualProperty = intellectualProperty;
    }

    public Integer getIndustryBelongs() {
        return industryBelongs;
    }

    public void setIndustryBelongs(Integer industryBelongs) {
        this.industryBelongs = industryBelongs;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getDetailedDesc() {
        return detailedDesc;
    }

    public void setDetailedDesc(String detailedDesc) {
        this.detailedDesc = detailedDesc;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getRoofPlaceState() {
        return roofPlaceState;
    }

    public void setRoofPlaceState(Integer roofPlaceState) {
        this.roofPlaceState = roofPlaceState;
    }

    public Integer getTopDuration() {
        return topDuration;
    }

    public void setTopDuration(Integer topDuration) {
        this.topDuration = topDuration;
    }

    public Integer getHasCollectedState() {
        return hasCollectedState;
    }

    public void setHasCollectedState(Integer hasCollectedState) {
        this.hasCollectedState = hasCollectedState;
    }
}
