package com.mall.vo;

import com.mall.base.BaseVO;

/**
 * Description:
 *
 * @Date:2020/1/14
 * @Author:lc
 */
public class AuthorizeCompanyVO extends BaseVO {

    /** 业务分类 */
    private Integer businessCategory;
    /** 商品名称 */
    private String companyName;
    /** 商品简介 */
    private String companyDescribe;
    /** 用户id */
    private Long userId;

    public Integer getBusinessCategory() {
        return businessCategory;
    }

    public void setBusinessCategory(Integer businessCategory) {
        this.businessCategory = businessCategory;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyDescribe() {
        return companyDescribe;
    }

    public void setCompanyDescribe(String companyDescribe) {
        this.companyDescribe = companyDescribe;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
