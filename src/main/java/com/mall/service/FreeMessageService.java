package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.FreeMessage;
import com.mall.vo.FreeMessageVO;

/**
 * Description:
 *
 * @Date:2020/1/10
 * @Author:lc
 */
public interface FreeMessageService {

    /**
     * 新增消息
     * @param freeMessage
     * @return
     */
    FreeMessage addFreeMessage(FreeMessage freeMessage);

    /**
     * 修改消息
     * @param freeMessage
     * @return
     */
    FreeMessage updateFreeMessage(FreeMessage freeMessage);

    /**
     * 删除消息
     * @param ids
     * @return
     */
    Boolean deleteFreeMessage(Long[] ids);

    /**
     * 分页查询消息
     * @param freeMessageVO
     * @return
     */
    PageInfo<FreeMessage> findFreeMessageForPage(FreeMessageVO freeMessageVO);

    /**
     * 查询单条消息
     * @param id
     * @return
     */
    FreeMessage getFreeMessageById(Long id);
}
