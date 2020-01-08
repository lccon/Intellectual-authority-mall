package com.mall.domain;

import com.mall.base.BaseDomain;

import java.io.Serializable;
import java.util.Date;

/**
 * Description:
 *
 * @Date:2019/12/16
 * @Author:lc
 */
public class Session implements Serializable {
    private Long id;
    private Long userId;
    private String userName;
    private String sessionId;
    private Boolean isLogin;
    private String accessIp;
    private Date accessTime;
    private String loginIp;
    private Date loginDate;
    private String lastUrl;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public Boolean getIsLogin() {
        return isLogin;
    }

    public void setIsLogin(Boolean isLogin) {
        this.isLogin = isLogin;
    }

    public String getAccessIp() {
        return accessIp;
    }

    public void setAccessIp(String accessIp) {
        this.accessIp = accessIp;
    }

    public Date getAccessTime() {
        return accessTime;
    }

    public void setAccessTime(Date accessTime) {
        this.accessTime = accessTime;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public String getLastUrl() {
        return lastUrl;
    }

    public void setLastUrl(String lastUrl) {
        this.lastUrl = lastUrl;
    }

    @Override
    public String toString() {
        return "Session{" +
                "id=" + id +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", sessionId='" + sessionId + '\'' +
                ", isLogin=" + isLogin +
                ", accessIp='" + accessIp + '\'' +
                ", accessTime=" + accessTime +
                ", loginIp='" + loginIp + '\'' +
                ", loginDate=" + loginDate +
                ", lastUrl='" + lastUrl + '\'' +
                '}';
    }
}
