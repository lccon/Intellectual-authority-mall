package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.FreeMessage;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.FreeMessageMapper;
import com.mall.service.FreeMessageService;
import com.mall.utils.StringUtil;
import com.mall.vo.FreeMessageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/10
 * @Author:lc
 */
@Service("freeMessageService")
public class FreeMessageServiceImpl implements FreeMessageService {

    @Autowired
    private FreeMessageMapper freeMessageMapper;

    @Override
    public FreeMessage addFreeMessage(FreeMessage freeMessage) {
        if(freeMessage == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            freeMessageMapper.addFreeMessage(freeMessage);
            return freeMessage;
        } catch (Exception e) {
            throw new ServiceValidationException("新增消息出错!", e);
        }
    }

    @Override
    public FreeMessage updateFreeMessage(FreeMessage freeMessage) {
        if(freeMessage == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            freeMessageMapper.updateFreeMessage(freeMessage);
            return freeMessage;
        } catch (Exception e) {
            throw new ServiceValidationException("修改消息出错!", e);
        }
    }

    @Override
    public Boolean deleteFreeMessage(Long[] ids) {
        if(ids == null || ids.length <= 0) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            Integer count = freeMessageMapper.deleteFreeMessage(ids);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("删除消息出错!", e);
        }
    }

    @Override
    public PageInfo<FreeMessage> findFreeMessageForPage(FreeMessageVO freeMessageVO) {
        try {
            PageHelper.startPage(freeMessageVO.getPage(), freeMessageVO.getRows(),
                    StringUtil.joinSortFieldOrder(freeMessageVO.getSidx(), freeMessageVO.getSord()));
            List<FreeMessage> freeMessageList = freeMessageMapper.findFreeMessageForList();
            return new PageInfo<>(freeMessageList);
        } catch (Exception e) {
            throw new ServiceValidationException("分页查询数据出错!", e);
        }
    }

    @Override
    public FreeMessage getFreeMessageById(Long id) {
        if (id == null) {
            throw new BusinessValidationException("主键信息不能为空!");
        }
        try {
            FreeMessage freeMessage = freeMessageMapper.getFreeMessageById(id);
            return freeMessage;
        } catch (Exception e) {
            throw new ServiceValidationException("获取单条信息出错！", e);
        }
    }
}
