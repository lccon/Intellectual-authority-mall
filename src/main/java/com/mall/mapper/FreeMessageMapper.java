package com.mall.mapper;

import com.mall.domain.FreeMessage;

/**
 * Description:
 *
 * @Date:2020/1/9
 * @Author:lc
 */
public interface FreeMessageMapper {

    /**
     * 添加信息
     * @param FreeMessage
     */
    void addFreeMessage(FreeMessage FreeMessage);

    /**
     * 修改发布的信息
     */
    void updateFreeMessage(FreeMessage freeMessage);

    /**
     * 删除发布的信息
     * @param ids
     * @return
     */
    Integer deleteFreeMessage(Long[] ids);
}
