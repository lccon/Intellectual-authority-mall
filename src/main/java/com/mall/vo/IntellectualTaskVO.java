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
}
