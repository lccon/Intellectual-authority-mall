package com.mall.domain;

import com.mall.base.BaseDomain;

import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/1/14
 * @Author:lc
 */
public class AuthorizeCompany extends BaseDomain {

    /** 主键id */
    private Long id;
    /** 公司名称 */
    private String companyName;
    /** 业务分类 */
    private Integer businessCategory;
    /** 公司介绍 */
    private String companyDescribe;
    /** 公司图片地址 */
    private String companyPictureUrl;
    /** 真是姓名 */
    private String realName;
    /** 手机号 */
    private String mobile;
    /** 友情链接 */
    private String friendshipLink;
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
    /** 浏览量 */
    private Integer browseVolume;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Integer getBusinessCategory() {
        return businessCategory;
    }

    public void setBusinessCategory(Integer businessCategory) {
        this.businessCategory = businessCategory;
    }

    public String getCompanyDescribe() {
        return companyDescribe;
    }

    public void setCompanyDescribe(String companyDescribe) {
        this.companyDescribe = companyDescribe;
    }

    public String getCompanyPictureUrl() {
        return companyPictureUrl;
    }

    public void setCompanyPictureUrl(String companyPictureUrl) {
        this.companyPictureUrl = companyPictureUrl;
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

    public String getFriendshipLink() {
        return friendshipLink;
    }

    public void setFriendshipLink(String friendshipLink) {
        this.friendshipLink = friendshipLink;
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

    public Integer getBrowseVolume() {
        return browseVolume;
    }

    public void setBrowseVolume(Integer browseVolume) {
        this.browseVolume = browseVolume;
    }
}
