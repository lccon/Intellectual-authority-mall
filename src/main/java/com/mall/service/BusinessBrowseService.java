package com.mall.service;

import com.mall.domain.BusinessBrowse;
import com.mall.domain.User;
import com.mall.vo.MeSeeWhoVO;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/2/24
 * @Author:lc
 */
public interface BusinessBrowseService {

    BusinessBrowse addBusinessBrowse(BusinessBrowse businessBrowse);

    Integer countBusinessBrowseNum(BusinessBrowse businessBrowse);

    MeSeeWhoVO getMeSeeWho(Long userId);

    List<User> getWhoSeeMe(Long userId);
}
