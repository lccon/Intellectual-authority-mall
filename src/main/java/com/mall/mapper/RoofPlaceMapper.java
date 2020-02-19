package com.mall.mapper;

import com.mall.domain.RoofPlace;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/21
 * @Author:lc
 */
public interface RoofPlaceMapper {

    /**
     * 新增置顶信息
     * @param roofPlace
     */
    void addRoofPlace(RoofPlace roofPlace);

    /**
     * 修改置顶信息
     * @param roofPlace
     */
    void updateRoofPlace(RoofPlace roofPlace);

    /**
     * 删除置顶信息
     * @param roofPlace
     * @return
     */
    Integer deleteRoofPlace(RoofPlace roofPlace);

    /**
     * 获取置顶信息
     * @param roofPlace
     * @return
     */
    RoofPlace getRoofPlace(RoofPlace roofPlace);
}
