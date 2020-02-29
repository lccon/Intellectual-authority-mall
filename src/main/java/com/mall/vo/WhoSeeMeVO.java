package com.mall.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/2/29
 * @Author:lc
 */
public class WhoSeeMeVO implements Serializable {

    private String userName;
    private String headPortrait;
    private String BusinessContent;
    private Date createDate;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    public String getBusinessContent() {
        return BusinessContent;
    }

    public void setBusinessContent(String businessContent) {
        BusinessContent = businessContent;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
