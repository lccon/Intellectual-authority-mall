package com.mall.controller;

import com.mall.service.SearchService;
import com.mall.vo.SearchBusinessVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Description:
 *
 * @Date:2020/2/21
 * @Author:lc
 */
@Controller
@RequestMapping("/api")
public class SearchController {

    @Autowired
    private SearchService searchService;

    @RequestMapping("/getSearchBusinessData")
    @ResponseBody
    public SearchBusinessVO getSearchBusinessData(@RequestParam(value = "page") int page,
                                                  @RequestParam(value = "rows") int rows,
                                                  @RequestParam(value = "productName", required = false) String productName,
                                                  @RequestParam(value = "productBrief", required = false) String productBrief) {
        return searchService.getSearchBusinessData(page, rows, productName, productBrief);
    }

}
