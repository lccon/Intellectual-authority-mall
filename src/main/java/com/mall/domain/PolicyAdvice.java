package com.mall.domain;

import com.mall.base.BaseDomain;

/**
 * Description:
 *
 * @Date:2020/1/9
 * @Author:lc
 */
public class PolicyAdvice extends BaseDomain {
    /** 主键id */
    private Long id;
    /** 政策资讯分类 */
    private Integer adviceCategory;
    /** 标题*/
    private String adviceTitle;
    /** 副标题 */
    private String adviceSubtitle;
    /** 内容 */
    private String adviceContent;
    /** 图片地址 */
    private String advicePictureUrl;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getAdviceCategory() {
        return adviceCategory;
    }

    public void setAdviceCategory(Integer adviceCategory) {
        this.adviceCategory = adviceCategory;
    }

    public String getAdviceTitle() {
        return adviceTitle;
    }

    public void setAdviceTitle(String adviceTitle) {
        this.adviceTitle = adviceTitle;
    }

    public String getAdviceSubtitle() {
        return adviceSubtitle;
    }

    public void setAdviceSubtitle(String adviceSubtitle) {
        this.adviceSubtitle = adviceSubtitle;
    }

    public String getAdviceContent() {
        return adviceContent;
    }

    public void setAdviceContent(String adviceContent) {
        this.adviceContent = adviceContent;
    }

    public String getAdvicePictureUrl() {
        return advicePictureUrl;
    }

    public void setAdvicePictureUrl(String advicePictureUrl) {
        this.advicePictureUrl = advicePictureUrl;
    }
}
