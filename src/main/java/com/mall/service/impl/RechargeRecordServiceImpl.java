package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.RechargeRecord;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.RechargeRecordMapper;
import com.mall.service.RechargeRecordService;
import com.mall.utils.SpringUtil;
import com.mall.utils.StringUtil;
import com.mall.vo.RechargeRecordVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
@Service("rechargeRecordService")
public class RechargeRecordServiceImpl implements RechargeRecordService {

    @Autowired
    private RechargeRecordMapper rechargeRecordMapper;

    @Override
    public RechargeRecord addRechargeRecord(RechargeRecord rechargeRecord) {
        if (rechargeRecord == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            rechargeRecordMapper.addRechargeRecord(rechargeRecord);
            return rechargeRecord;
        } catch (Exception e) {
            throw new ServiceValidationException("新增充值记录出错", e);
        }
    }

    @Override
    public RechargeRecord updateRechargeRecord(RechargeRecord rechargeRecord) {
        if (rechargeRecord == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            rechargeRecordMapper.updateRechargeRecord(rechargeRecord);
            return rechargeRecord;
        } catch (Exception e) {
            throw new ServiceValidationException("修改充值记录出错", e);
        }
    }

    @Override
    public PageInfo<RechargeRecord> findRechargeRecordForList(RechargeRecordVO rechargeRecordVO) {
        try {
            PageHelper.startPage(rechargeRecordVO.getPage(), rechargeRecordVO.getRows(),
                    StringUtil.joinSortFieldOrder(rechargeRecordVO.getSidx(), rechargeRecordVO.getSord()));
            List<RechargeRecord> rechargeRecordList = rechargeRecordMapper.findRechargeRecordForList(rechargeRecordVO);
            return new PageInfo<>(rechargeRecordList);
        } catch (Exception e) {
            throw new ServiceValidationException("查询充值记录出错", e);
        }
    }
}
