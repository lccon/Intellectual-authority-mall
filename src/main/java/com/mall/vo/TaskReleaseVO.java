package com.mall.vo;

import com.mall.base.BaseVO;

/**
 * Description:
 *
 * @Date:2020/1/15
 * @Author:lc
 */
public class TaskReleaseVO extends BaseVO {

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
}
