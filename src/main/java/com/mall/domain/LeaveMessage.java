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

    @Override
    public String toString() {
        return "LeaveMessage{" +
                "id=" + id +
                ", message='" + message + '\'' +
                ", messageState=" + messageState +
                ", messageDateStr='" + messageDateStr + '\'' +
                '}';
    }
}
