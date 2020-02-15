package com.mall.mapper;

import com.mall.domain.BusinessCollected;
import com.mall.vo.BusinessCollectedVO;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/15
 * @Author:lc
 */
public interface BusinessCollectedMapper {

    /**
     * 添加收藏
     * @param businessCollected
     */
    void addBusinessCollected(BusinessCollected businessCollected);

    /**
     * 取消收藏
     * @return
     */
    Integer deleteBusinessCollected(BusinessCollected businessCollected);

    /**
     * 收藏列表
     * @return
     */
    List<BusinessCollected> findBusinessCollectedForList(BusinessCollectedVO businessCollectedVO);
}
