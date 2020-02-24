package com.mall.mapper;

import com.mall.domain.BusinessBrowse;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
public interface BusinessBrowseMapper {

    void addBusinessBrowse(BusinessBrowse businessBrowse);

    Integer countBusinessBrowseNum(BusinessBrowse businessBrowse);

    List<BusinessBrowse> findMeSeeWhoForList(Long visitorId);

    List<Long> findWhoSeeMeForList(Long userId);
}
