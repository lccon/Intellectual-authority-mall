package com.mall.service;

import com.mall.vo.SearchBusinessVO;

/**
 * Description:
 *
 * @Date:2020/2/21
 * @Author:lc
 */
public interface SearchService {

    /**
     * 查询搜索信息
     * @param page
     * @param rows
     */
    SearchBusinessVO getSearchBusinessData(int page, int rows, String productName, String productBrief);
}
