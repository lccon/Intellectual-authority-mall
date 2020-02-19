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

    // 待审核
    private static final Integer AUDIT_STATE = 0;

    @Autowired
    private RoofPlaceMapper roofPlaceMapper;

    @Override
    public RoofPlace addRoofPlace(RoofPlace roofPlace) {
        if (roofPlace == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            roofPlace.setAuthorizeState(AUDIT_STATE);
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
    public Boolean countRoofPlaceDetail(RoofPlace roofPlace) {
        if(roofPlace == null) {
            throw new BusinessValidationException("信息不能为空!");
        }
        try {
            RoofPlace roofPlaceInfo = roofPlaceMapper.getRoofPlace(roofPlace);
            if (roofPlaceInfo == null || roofPlace.getTopEndTime() == null) {
                throw new BusinessValidationException("查询置顶信息为空!");
            }
            if (roofPlaceInfo.getTopEndTime().before(new Date())) {
                this.deleteRoofPlace(roofPlace);
                return false;
            }
            return true;
        } catch (BusinessValidationException e) {
            throw new ServiceValidationException(e.getMessage(), e);
        } catch (Exception e) {
            throw new ServiceValidationException("统计是否置顶出错!", e);
        }
    }
}
