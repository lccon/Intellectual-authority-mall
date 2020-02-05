package com.mall.quartz;

import com.mall.domain.RoofPlace;
import com.mall.service.RoofPlaceService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/21
 * @Author:lc
 */
public class DurTimeScheduler implements Job {

    @Autowired
    private RoofPlaceService roofPlaceService;

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        List<RoofPlace> roofPlaceList = roofPlaceService.findRoofPlaceByStateForList();
        if (roofPlaceList != null && roofPlaceList.size() > 0) {
            roofPlaceService.updateAuthorizeState();
        }
    }
}
