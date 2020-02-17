package com.mall.domain;

import com.mall.base.BaseDomain;

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
}
