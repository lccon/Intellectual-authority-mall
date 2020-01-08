package com.mall.base;

import java.io.Serializable;

/**
 * Description:
 *
 * @Date:2020/1/8
 * @Author:lc
 */
public class BaseVO implements Serializable {

    /**
     * 页数
     */
    private Integer page = 1;
    /**
     * 每页行数
     */
    private Integer rows = 15;
    /**
     * 排序字段
     */
    private String sidx = "create_date";
    /**
     * 排序类型
     */
    private String sord = "desc";

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public String getSidx() {
        return sidx;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSord() {
        return sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }
}
