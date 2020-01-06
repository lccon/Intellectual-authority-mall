package com.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Description:
 *
 * @Date:2020/1/6
 * @Author:lc
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public String indexPage() {
        return "/index";
    }

}
