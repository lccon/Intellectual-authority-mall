package com.mall.domain;

import com.mall.base.BaseDomain;

/**
 * Description:
 *
 * @Date:2020/1/9
 * @Author:lc
 */
public class FreeMessage extends BaseDomain {
    /** 主键id */
    private Long id;
    /** 信息内容 */
    private String messageContent;
    /** 身份 1:买方 2:卖方*/
    private String identity;
    /** 信息状态 0:待审核 1:通过 2:驳回 */
    private Integer messageState;
    /** 浏览量 */
    private Long browseVolume;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public Integer getMessageState() {
        return messageState;
    }

    public void setMessageState(Integer messageState) {
        this.messageState = messageState;
    }

    public Long getBrowseVolume() {
        return browseVolume;
    }

    public void setBrowseVolume(Long browseVolume) {
        this.browseVolume = browseVolume;
    }

    @Override
    public String toString() {
        return "FreeMessage{" +
                "id=" + id +
                ", messageContent='" + messageContent + '\'' +
                ", identity='" + identity + '\'' +
                ", messageState=" + messageState +
                ", browseVolume=" + browseVolume +
                '}';
    }
}
