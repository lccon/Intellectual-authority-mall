package com.mall.controller;

import com.mall.domain.AuthorizeSite;
import com.mall.service.AuthorizeSiteService;
import com.mall.service.SearchService;
import com.mall.vo.SearchBusinessVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
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
    @Autowired
    private AuthorizeSiteService authorizeSiteService;

    @RequestMapping("/getSearchBusinessData")
    public String getSearchBusinessData(@RequestParam(value = "page") int page,
                                        @RequestParam(value = "rows") int rows,
                                        @RequestParam(value = "productName", required = false) String productName,
                                        @RequestParam(value = "productBrief", required = false) String productBrief, ModelMap map) {

        SearchBusinessVO SearchBusinessvO=searchService.getSearchBusinessData(page, rows, productName, productBrief);
        List<AuthorizeSite> leftAuthllist=authorizeSiteService.findAuthorizeSiteBysiteType(3);
        List<AuthorizeSite> rightAuthllist=authorizeSiteService.findAuthorizeSiteBysiteType(4);
        map.put("leftAuthllist",leftAuthllist);
        map.put("rightAuthllist",rightAuthllist);
        map.put("SearchBusinessvO",SearchBusinessvO);
        return "/findpage";
    }

}
