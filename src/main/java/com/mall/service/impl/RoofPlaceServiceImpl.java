package com.mall.service.impl;

import com.mall.domain.RoofPlace;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.RoofPlaceMapper;
import com.mall.properties.GridProperties;
import com.mall.service.RoofPlaceService;
import com.mall.utils.quartzUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/21
 * @Author:lc
 */
@Service("roofPlaceService")
public class RoofPlaceServiceImpl implements RoofPlaceService {

    @Autowired
    private RoofPlaceMapper roofPlaceMapper;

    @Override
    public RoofPlace addRoofPlace(RoofPlace roofPlace) {
        if (roofPlace == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        RoofPlace roofPlaceInfo = this.getRoofPlaceInfo(roofPlace);
        if (roofPlaceInfo != null) {
            throw new BusinessValidationException("已存在置顶信息!");
        }
        try {
            roofPlace.setTopStartTime(new Date());
            long currentTime = System.currentTimeMillis();
            long topDurationLong = roofPlace.getTopDuration()*24*60*60*1000;
            long newTime = currentTime + topDurationLong;
            Date topEndDate = new Date(newTime);
            roofPlace.setTopEndTime(topEndDate);
            roofPlaceMapper.addRoofPlace(roofPlace);
            return roofPlace;
        } catch (Exception e) {
            throw new ServiceValidationException("新增置顶信息错误!", e);
        }
    }

    @Override
    public RoofPlace updateRoofPlace(RoofPlace roofPlace) {
        if(roofPlace == null) {
            throw new BusinessValidationException("参数不能为空！");
        }
        try {
            roofPlace.setTopStartTime(new Date());
            long currentTime = System.currentTimeMillis();
            long topDurationLong = roofPlace.getTopDuration()*24*60*60*1000;
            long newTime = currentTime + topDurationLong;
            Date topEndDate = new Date(newTime);
            roofPlace.setTopEndTime(topEndDate);
            roofPlaceMapper.updateRoofPlace(roofPlace);
            return roofPlace;
        } catch (Exception e) {
            throw new ServiceValidationException("修改置顶信息出错!", e);
        }
    }

    @Override
    public Boolean deleteRoofPlace(RoofPlace roofPlace) {
        if(roofPlace == null) {
            throw new BusinessValidationException("信息不能为空!");
        }
        try {
            Integer count = roofPlaceMapper.deleteRoofPlace(roofPlace);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("删除置顶信息出错!", e);
        }
    }

    @Override
    public RoofPlace getRoofPlaceInfo(RoofPlace roofPlace) {
        if(roofPlace == null) {
            throw new BusinessValidationException("信息不能为空!");
        }
        try {
            RoofPlace roofPlaceInfo = roofPlaceMapper.getRoofPlace(roofPlace);
            if (roofPlaceInfo != null && roofPlaceInfo.getTopEndTime().before(new Date())) {
                this.deleteRoofPlace(roofPlace);
                return null;
            }
            return roofPlaceInfo;
        } catch (Exception e) {
            throw new ServiceValidationException("查询置顶信息出错!", e);
        }
    }
}
