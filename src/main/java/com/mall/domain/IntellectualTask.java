package com.mall.domain;

import com.mall.base.BaseDomain;

import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/1/13
 * @Author:lc
 */
public class IntellectualTask extends BaseDomain {
    /** 主键id */
    private Long id;
    /** 商品名称 */
    private String productName;
    /** 商品简介 */
    private String productBrief;
    /** 商品详情 */
    private String productDetails;
    /** 专利号 */
    private String patentNumber;
    /** 商品分类 */
    private Integer productCategory;
    /** 行业分类 */
    private Integer industryCategory;
    /** 图片地址*/
    private String productPictureUrl;
    /** 视频地址 */
    private String productVideoUrl;
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
    /** 用户id */
    private Long userId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(String productDetails) {
        this.productDetails = productDetails;
    }

    public String getPatentNumber() {
        return patentNumber;
    }

    public void setPatentNumber(String patentNumber) {
        this.patentNumber = patentNumber;
    }

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

    public String getProductPictureUrl() {
        return productPictureUrl;
    }

    public void setProductPictureUrl(String productPictureUrl) {
        this.productPictureUrl = productPictureUrl;
    }

    public String getProductVideoUrl() {
        return productVideoUrl;
    }

    public void setProductVideoUrl(String productVideoUrl) {
        this.productVideoUrl = productVideoUrl;
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

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
