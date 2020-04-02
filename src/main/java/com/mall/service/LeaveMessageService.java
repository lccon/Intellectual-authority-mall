package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.LeaveMessage;
import com.mall.vo.LeaveMessageVO;

/**
 * Description:
 *
 * @Date:2020/1/8
 * @Author:lc
 */
public interface LeaveMessageService {

    /**
     * 新增留言
     * @param leaveMessage
     * @return
     */
    LeaveMessage addLeaveMessage(LeaveMessage leaveMessage);

    /**
     * 修改留言
     * @param leaveMessage
     * @return
     */
    LeaveMessage updateLeaveMessage(LeaveMessage leaveMessage);

    /**
     * 获取所有留言
     * @return
     */
    PageInfo<LeaveMessage> findLeaveMessageForList(LeaveMessageVO leaveMessageVO);

    /**
     * 通过id获取留言
     * @param id
     * @return
     */
    LeaveMessage getLeaveMessageById(Long id);

    /**
     * 删除留言
     * @param ids
     * @return
     */
    Boolean deleteLeaveMessage(Long[] ids);

    /**
     * 修改所有的状态
     * @return
     */
    Boolean updateLeaveMessageState();
}
