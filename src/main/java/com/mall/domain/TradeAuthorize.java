package com.mall.domain;

import com.mall.base.BaseDomain;

/**
 * Description:
 *
 * @Date:2020/2/29
 * @Author:lc
 */
public class TradeAuthorize extends BaseDomain {
    /** 主键 */
    private Long id;
    /** 认证样式 0，不认证 1，企业认证 2，个人认证 */
    private Integer authorizeStyle;
    /** 认证结果 0，待认证  1:驳回 2:代办公司 3:普通公司 */
    private Integer authorizeResult;
    /** 姓名 */
    private String name;
    /** 企业名称 */
    private String companyName;
    /** 企业联系人 */
    private String companyPerson;
    /** 营业执照编码 */
    private String businessLicense;
    /** 身份证号 */
    private String idCard;
    /** 联系方式 */
    private String licensePicture;
    /** 用户id */
    private Long userId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getAuthorizeStyle() {
        return authorizeStyle;
    }

    public void setAuthorizeStyle(Integer authorizeStyle) {
        this.authorizeStyle = authorizeStyle;
    }

    public Integer getAuthorizeResult() {
        return authorizeResult;
    }

    public void setAuthorizeResult(Integer authorizeResult) {
        this.authorizeResult = authorizeResult;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyPerson() {
        return companyPerson;
    }

    public void setCompanyPerson(String companyPerson) {
        this.companyPerson = companyPerson;
    }

    public String getBusinessLicense() {
        return businessLicense;
    }

    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getLicensePicture() {
        return licensePicture;
    }

    public void setLicensePicture(String licensePicture) {
        this.licensePicture = licensePicture;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
