package com.mall.mapper;

import com.mall.domain.TradeAuthorize;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/29
 * @Author:lc
 */
public interface TradeAuthorizeMapper {

    /**
     * 添加认证
     * @param tradeAuthorize
     */
    void addTradeAuthorize(TradeAuthorize tradeAuthorize);

    /**
     * 企业认证列表
     * @return
     */
    List<TradeAuthorize> findTradeAuthorizeForList();

    /**
     * 修改认证
     * @param tradeAuthorize
     */
    void updateTradeAuthorize(TradeAuthorize tradeAuthorize);

    /**
     * 多条删除认证
     * @param ids
     * @return
     */
    Integer deleteTradeAuthorize(Long[] ids);

    /**
     * 查询单条认证
     * @param id
     * @return
     */
    TradeAuthorize getTradeAuthorizeById(Long id);
}
