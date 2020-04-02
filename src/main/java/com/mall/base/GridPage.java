package com.mall.base;

import com.github.pagehelper.PageInfo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/8
 * @Author:lc
 */
public class GridPage<T> implements Serializable{
    private long page = 1;
    private long total = 1;
    private long records = 1;
    private List rows=new ArrayList();
    public long getPage() {
        return page;
    }
    public void setPage(long page) {
        this.page = page;
    }

    public long getTotal() {
        return total;
    }
    public void setTotal(long total) {
        this.total = total;
    }
    public long getRecords() {
        return records;
    }
    public void setRecords(long records) {
        this.records = records;
    }
    public List getRows() {
        return rows;
    }
    public void setRows(List rows) {
        this.rows = rows;
    }
    public GridPage(PageInfo pageInfo) {
        setPage(pageInfo.getPageNum());
        setTotal(pageInfo.getPages());
        setRecords(pageInfo.getTotal());
        List list = pageInfo.getList();
        setRows(list);
    }
    public GridPage(List list) {
        setRecords(list.size());
        setRows(list);
    }
    public GridPage() {
        super();
    }
}
