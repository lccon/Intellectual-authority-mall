package com.mall.service.impl;

import com.mall.domain.TradeAuthorize;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.TradeAuthorizeMapper;
import com.mall.service.TradeAuthorizeService;
import com.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description:
 *
 * @Date:2020/2/29
 * @Author:lc
 */
@Service("tradeAuthorizeService")
public class TradeAuthorizeServiceImpl implements TradeAuthorizeService {

    @Autowired
    private TradeAuthorizeMapper tradeAuthorizeMapper;
    @Autowired
    private UserService userService;

    @Override
    public TradeAuthorize addTradeAuthorize(Long userId, TradeAuthorize tradeAuthorize) {
        if (tradeAuthorize == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            if (tradeAuthorize.getAuthorizeStyle() != null) {
                User user=userService.findUserById(userId);
                user.setAuthorizeType(tradeAuthorize.getAuthorizeStyle());
                userService.updateUser(user);
            }
            tradeAuthorizeMapper.addTradeAuthorize(tradeAuthorize);
            return tradeAuthorize;
        } catch (Exception e) {
            throw new ServiceValidationException("新增认证出错", e);
        }
    }
}


