package com.mall.vo;

import com.mall.base.BaseVO;

/**
 * Description:
 *
 * @Date:2020/1/17
 * @Author:lc
 */
public class UserVO extends BaseVO {

    private Integer identity;
    /** 搜索类型 */
    private String searchType;
    /** 要搜索的内容 */
    private String searchContent;

    public Integer getIdentity() {
        return identity;
    }

    public void setIdentity(Integer identity) {
        this.identity = identity;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getSearchContent() {
        return searchContent;
    }

    public void setSearchContent(String searchContent) {
        this.searchContent = searchContent;
    }
}
