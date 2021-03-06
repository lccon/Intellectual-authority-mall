package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.BusinessCollected;
import com.mall.vo.BusinessCollectedVO;

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
    PageInfo<BusinessCollectedVO> findBusinessCollectedForPage(BusinessCollectedVO businessCollectedVO);

    /**
     * 获取收藏信息
     * @param businessCollected
     * @return
     */
    BusinessCollected getBusinessCollected(BusinessCollected businessCollected);

    /**
     * 删除用户收藏
     * @param businessCollected
     * @return
     */
    Boolean deleteUserCollected(BusinessCollected businessCollected);
}
