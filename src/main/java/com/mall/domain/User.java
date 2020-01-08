package com.mall.domain;

import com.mall.base.BaseDomain;

public class User extends BaseDomain {
    /** 主键id */
    private Long id;
    /** 用户名 */
    private String username;
    /** 密码 */
    private String password;
    /** 用户身份 */
    private String identity;
    /** 手机号 */
    private String mobile;
    /** 身份证号 */
    private String idCard;
    /** 头像id */
    private Long headPortrait;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Long getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(Long headPortrait) {
        this.headPortrait = headPortrait;
    }
}