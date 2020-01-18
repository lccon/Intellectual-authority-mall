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
    private Integer identity;
    /** 身份证号 */
    private String idCard;
    /** 头像id */
    private String headPortrait;
    /** 认证类型 1，企业认证 2，个人认证 */
    private Integer authorizeType;
    /** 账户余额 */
    private Long accountYue;
    /** 虚拟币数量 */
    private Long virtualCoin;
    /** 可发布免费信息数量 */
    private Integer freeMessageNum;

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

    public Integer getIdentity() {
        return identity;
    }

    public void setIdentity(Integer identity) {
        this.identity = identity;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    public Integer getAuthorizeType() {
        return authorizeType;
    }

    public void setAuthorizeType(Integer authorizeType) {
        this.authorizeType = authorizeType;
    }

    public Long getAccountYue() {
        return accountYue;
    }

    public void setAccountYue(Long accountYue) {
        this.accountYue = accountYue;
    }

    public Long getVirtualCoin() {
        return virtualCoin;
    }

    public void setVirtualCoin(Long virtualCoin) {
        this.virtualCoin = virtualCoin;
    }

    public Integer getFreeMessageNum() {
        return freeMessageNum;
    }

    public void setFreeMessageNum(Integer freeMessageNum) {
        this.freeMessageNum = freeMessageNum;
    }

}