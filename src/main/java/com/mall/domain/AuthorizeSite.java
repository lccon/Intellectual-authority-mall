package com.mall.domain;

import com.mall.base.BaseDomain;

import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/1/16
 * @Author:lc
 */
public class AuthorizeSite extends BaseDomain{

    private Long id;
    /** 图片 */
    private String sitePictureUrl;
    /** 连接地址 */
    private String addressUrl;
    /** 结束时间 */
    private String endTime;
    /** 站点类型 */
    private Integer siteType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSitePictureUrl() {
        return sitePictureUrl;
    }

    public void setSitePictureUrl(String sitePictureUrl) {
        this.sitePictureUrl = sitePictureUrl;
    }

    public String getAddressUrl() {
        return addressUrl;
    }

    public void setAddressUrl(String addressUrl) {
        this.addressUrl = addressUrl;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Integer getSiteType() {
        return siteType;
    }

    public void setSiteType(Integer siteType) {
        this.siteType = siteType;
    }
}
