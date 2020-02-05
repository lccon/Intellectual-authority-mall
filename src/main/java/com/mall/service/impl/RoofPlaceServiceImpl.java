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
        try {
            roofPlaceMapper.addRoofPlace(roofPlace);
            quartzUtil.getInstance().addSchedulerJob(GridProperties.QUARTZ_NAME, GridProperties.QUARTZ_GROUP, GridProperties.QUARTZ_config);
            return roofPlace;
        } catch (Exception e) {
            throw new ServiceValidationException("新增置顶信息错误!", e);
        }
    }

    @Override
    public RoofPlace updateRoofPlace(RoofPlace roofPlace) {

        return null;
    }

    @Override
    public void updateAuthorizeState() {

    }

    @Override
    public List<RoofPlace> findRoofPlaceByStateForList() {
        return null;
    }
}
