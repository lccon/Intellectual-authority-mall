package com.mall.mapper;

import com.mall.domain.LeaveMessage;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/8
 * @Author:lc
 */
public interface LeaveMessageMapper {

    /**
     * 新增留言
     * @param leaveMessage
     */
    void addLeaveMessage(LeaveMessage leaveMessage);

    /**
     * 修改留言
     * @param leaveMessage
     */
    void updateLeaveMessage(LeaveMessage leaveMessage);

    /**
     * 查询所有的留言
     * @return
     */
    List<LeaveMessage> findLeaveMessageForList();

    /**
     * 通过id获取留言信息
     * @param id
     * @return
     */
    LeaveMessage getLeaveMessageById(Long id);

    /**
     * 删除留言
     * @param ids
     * @return
     */
    Integer deleteLeaveMessage(Long[] ids);
}
