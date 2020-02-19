package com.mall.service;

import com.mall.domain.RoofPlace;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/21
 * @Author:lc
 */
public interface RoofPlaceService {

    /**
     * 新增置顶信息
     * @param roofPlace
     */
    RoofPlace addRoofPlace(RoofPlace roofPlace);

    /**
     * 修改置顶信息
     * @param roofPlace
     */
    RoofPlace updateRoofPlace(RoofPlace roofPlace);

    /**
     * 删除置顶
     * @param roofPlace
     * @return
     */
    Boolean deleteRoofPlace(RoofPlace roofPlace);

    /**
     * 查询置顶信息
     * @return
     */
    Boolean countRoofPlaceDetail(RoofPlace roofPlace);

}
