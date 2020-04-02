package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.LeaveMessage;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.LeaveMessageMapper;
import com.mall.service.LeaveMessageService;
import com.mall.utils.DateUtil;
import com.mall.utils.StringUtil;
import com.mall.vo.LeaveMessageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/8
 * @Author:lc
 */
@Service("leaveMessageService")
public class LeaveMessageServiceImpl implements LeaveMessageService {

    @Autowired
    private LeaveMessageMapper leaveMessageMapper;

    @Override
    public LeaveMessage addLeaveMessage(LeaveMessage leaveMessage) {
        if (leaveMessage == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            leaveMessageMapper.addLeaveMessage(leaveMessage);
            return leaveMessage;
        } catch (Exception e) {
            throw new ServiceValidationException("新增留言出错!", e);
        }
    }

    @Override
    public LeaveMessage updateLeaveMessage(LeaveMessage leaveMessage) {
        if (leaveMessage == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            leaveMessageMapper.updateLeaveMessage(leaveMessage);
            return leaveMessage;
        } catch (Exception e) {
            throw new ServiceValidationException("修改留言出错!", e);
        }
    }

    @Override
    public PageInfo<LeaveMessage> findLeaveMessageForList(LeaveMessageVO leaveMessageVO) {
        try {
            PageHelper.startPage(leaveMessageVO.getPage(), leaveMessageVO.getRows(),
                    StringUtil.joinSortFieldOrder(leaveMessageVO.getSidx(), leaveMessageVO.getSord()));
            List<LeaveMessage> leaveMessageList = leaveMessageMapper.findLeaveMessageForList();
            for (LeaveMessage leaveMessage : leaveMessageList) {
                leaveMessage.setMessageDateStr(DateUtil.dateToString(leaveMessage.getCreateDate()));
            }
            return new PageInfo<>(leaveMessageList);
        } catch (Exception e) {
            throw new ServiceValidationException("获取所有留言出错！", e);
        }
    }

    @Override
    public LeaveMessage getLeaveMessageById(Long id) {
        if(id == null) {
            throw new BusinessValidationException("主键id不能为空!");
        }
        try {
            return leaveMessageMapper.getLeaveMessageById(id);
        } catch (Exception e) {
            throw new ServiceValidationException("获取留言信息出错!", e);
        }
    }

    @Override
    public Boolean deleteLeaveMessage(Long[] ids) {
        if(ids == null || ids.length <= 0) {
            throw new BusinessValidationException("参数不能为空！");
        }
        try {
            Integer count = leaveMessageMapper.deleteLeaveMessage(ids);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("删除留言出错!", e);
        }
    }

    @Override
    public Boolean updateLeaveMessageState() {
        try {
            Integer count = leaveMessageMapper.updateLeaveMessageState();
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("修改留言状态失败!", e);
        }
    }
}
