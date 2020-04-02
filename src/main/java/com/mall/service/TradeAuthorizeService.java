package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.TradeAuthorize;
import com.mall.vo.TradeAuthorizeVO;

/**
 * Description:
 *
 * @Date:2020/2/29
 * @Author:lc
 */
public interface TradeAuthorizeService {

    /**
     * 添加认证
     * @param tradeAuthorize
     */
    TradeAuthorize addTradeAuthorize(Long id, TradeAuthorize tradeAuthorize);

    /**
     * 分页企业认证列表
     * @param tradeAuthorizeVO
     * @return
     */
    PageInfo<TradeAuthorize> findTradeAuthorizeForPage(TradeAuthorizeVO tradeAuthorizeVO);

    /**
     * 修改认证
     * @param tradeAuthorize
     * @return
     */
    TradeAuthorize updateTradeAuthorize(TradeAuthorize tradeAuthorize);

    /**
     * 多条删除认证
     * @param ids
     * @return
     */
    Boolean deleteTradeAuthorize(Long[] ids);

    /**
     * 查询单条认证
     * @param id
     * @return
     */
    TradeAuthorize getTradeAuthorizeById(Long id);
}
