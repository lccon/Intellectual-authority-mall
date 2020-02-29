package com.mall.service;

import com.mall.domain.TradeAuthorize;

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

}
