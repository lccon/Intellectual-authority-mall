package com.mall.mapper;

import com.mall.domain.RechargeRecord;
import com.mall.vo.RechargeRecordVO;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
public interface RechargeRecordMapper {

    void addRechargeRecord(RechargeRecord rechargeRecord);

    void updateRechargeRecord(RechargeRecord rechargeRecord);

    List<RechargeRecord> findRechargeRecordForList(RechargeRecordVO rechargeRecordVO);

}
