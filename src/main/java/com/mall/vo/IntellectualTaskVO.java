package com.mall.vo;

import com.mall.base.BaseVO;

/**
 * Description:
 *
 * @Date:2020/1/13
 * @Author:lc
 */
public class IntellectualTaskVO extends BaseVO {

    /** 商品分类 */
    private Integer productCategory;
    /** 行业分类 */
    private Integer industryCategory;
    /** 商品名称 */
    private String productName;
    /** 商品简介 */
    private String productBrief;
    /** 用户id */
    private Long userId;

    private Integer state;

    private Integer periodType;

    private String searchText;

    public Integer getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(Integer productCategory) {
        this.productCategory = productCategory;
    }

    public Integer getIndustryCategory() {
        return industryCategory;
    }

    public void setIndustryCategory(Integer industryCategory) {
        this.industryCategory = industryCategory;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductBrief() {
        return productBrief;
    }

    public void setProductBrief(String productBrief) {
        this.productBrief = productBrief;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getPeriodType() {
        return periodType;
    }

    public void setPeriodType(Integer periodType) {
        this.periodType = periodType;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }
}
