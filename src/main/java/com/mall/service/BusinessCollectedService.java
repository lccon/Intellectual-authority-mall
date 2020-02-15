package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.BusinessCollected;
import com.mall.vo.BusinessCollectedVO;
import com.mall.vo.CollectedInfoVO;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/15
 * @Author:lc
 */
public interface BusinessCollectedService {
    /**
     * 添加收藏
     * @param businessCollected
     */
    BusinessCollected addBusinessCollected(BusinessCollected businessCollected);

    /**
     * 取消收藏
     * @return
     */
    Boolean deleteBusinessCollected(BusinessCollected businessCollected);

    /**
     * 收藏列表
     * @return
     */
    PageInfo<CollectedInfoVO> findBusinessCollectedForPage(BusinessCollectedVO businessCollectedVO);
}
