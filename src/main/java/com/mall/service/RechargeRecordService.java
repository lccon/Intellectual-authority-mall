package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.RechargeRecord;
import com.mall.vo.RechargeRecordVO;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
public interface RechargeRecordService {

    RechargeRecord addRechargeRecord(RechargeRecord rechargeRecord);

    RechargeRecord updateRechargeRecord(RechargeRecord rechargeRecord);

    PageInfo<RechargeRecord> findRechargeRecordForList(RechargeRecordVO rechargeRecordVO);

}
