package com.mall.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/2/15
 * @Author:lc
 */
public class CollectedInfoVO implements Serializable {

    /** 收藏内容 */
    private String collectedContent;
    /** 收藏时间 */
    private Date collectedDate;

    public String getCollectedContent() {
        return collectedContent;
    }

    public void setCollectedContent(String collectedContent) {
        this.collectedContent = collectedContent;
    }

    public Date getCollectedDate() {
        return collectedDate;
    }

    public void setCollectedDate(Date collectedDate) {
        this.collectedDate = collectedDate;
    }
}
