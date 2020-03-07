package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.TradeAuthorize;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.TradeAuthorizeMapper;
import com.mall.service.TradeAuthorizeService;
import com.mall.service.UserService;
import com.mall.utils.StringUtil;
import com.mall.vo.TradeAuthorizeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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

    @Override
    public PageInfo<TradeAuthorize> findTradeAuthorizeForPage(TradeAuthorizeVO tradeAuthorizeVO) {
        try {
            PageHelper.startPage(tradeAuthorizeVO.getPage(), tradeAuthorizeVO.getRows(),
                    StringUtil.joinSortFieldOrder(tradeAuthorizeVO.getSidx(), tradeAuthorizeVO.getSord()));
            List<TradeAuthorize> tradeAuthorizeList = tradeAuthorizeMapper.findTradeAuthorizeForList();
            return new PageInfo<>(tradeAuthorizeList);
        } catch (Exception e) {
            throw new ServiceValidationException("分页企业认证列表出错!", e);
        }
    }

    @Override
    public TradeAuthorize updateTradeAuthorize(TradeAuthorize tradeAuthorize) {
        if (tradeAuthorize == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            if (tradeAuthorize.getAuthorizeResult() != 0 && tradeAuthorize.getUserId() != null) {
                User user=userService.findUserById(tradeAuthorize.getUserId());
                user.setAuthorizeType(tradeAuthorize.getAuthorizeStyle());
                userService.updateUser(user);
            }
            tradeAuthorizeMapper.updateTradeAuthorize(tradeAuthorize);
            return tradeAuthorize;
        } catch (Exception e) {
            throw new ServiceValidationException("修改认证出错!", e);
        }
    }

    @Override
    public Boolean deleteTradeAuthorize(Long[] ids) {
        if (ids == null || ids.length <= 0) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            Integer count = tradeAuthorizeMapper.deleteTradeAuthorize(ids);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("多条删除认证出错!", e);
        }
    }

    @Override
    public TradeAuthorize getTradeAuthorizeById(Long id) {
        if (id == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            return tradeAuthorizeMapper.getTradeAuthorizeById(id);
        } catch (Exception e) {
            throw new ServiceValidationException("查询认证信息出错", e);
        }
    }
}


