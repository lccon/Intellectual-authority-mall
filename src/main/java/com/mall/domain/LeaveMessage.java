package com.mall.domain;

import com.mall.base.BaseDomain;

/**
 * Description:
 *
 * @Date:2020/1/8
 * @Author:lc
 */
public class LeaveMessage extends BaseDomain {
    /** 主键id */
    private Long id;
    /** 留言内容 */
    private String message;
    /** 留言状态 */
    private Integer messageState;
    /** 留言日期 */
    private String messageDateStr;
    /** 真实姓名 */
    private String realName;
    /** 手机号 */
    private String mobile;
    /** 邮箱地址 */
    private String mailAddress;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getMessageState() {
        return messageState;
    }

    public void setMessageState(Integer messageState) {
        this.messageState = messageState;
    }

    public String getMessageDateStr() {
        return messageDateStr;
    }

    public void setMessageDateStr(String messageDateStr) {
        this.messageDateStr = messageDateStr;
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

    public String getMailAddress() {
        return mailAddress;
    }

    public void setMailAddress(String mailAddress) {
        this.mailAddress = mailAddress;
    }

    @Override
    public String toString() {
        return "LeaveMessage{" +
                "id=" + id +
                ", message='" + message + '\'' +
                ", messageState=" + messageState +
                ", messageDateStr='" + messageDateStr + '\'' +
                ", realName='" + realName + '\'' +
                ", mobile='" + mobile + '\'' +
                ", mailAddress='" + mailAddress + '\'' +
                '}';
    }
}
