package com.mall.controller;

import com.mall.domain.RoofPlace;
import com.mall.service.RoofPlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Description:
 *
 * @Date:2020/1/21
 * @Author:lc
 */
@Controller
@RequestMapping("/roofPlace")
public class RoofPlaceController {

    @Autowired
    private RoofPlaceService roofPlaceService;

    @RequestMapping("/addRoofPlace")
    @ResponseBody
    public RoofPlace addRoofPlace(RoofPlace roofPlace) {
        return roofPlaceService.addRoofPlace(roofPlace);
    }

}
