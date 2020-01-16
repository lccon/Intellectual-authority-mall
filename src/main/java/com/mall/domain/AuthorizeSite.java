package com.mall.domain;

import com.mall.base.BaseDomain;

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
}
