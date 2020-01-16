package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.AuthorizeSite;
import com.mall.vo.AuthorizeSiteVO;

import javax.servlet.http.HttpServletRequest;

/**
 * Description:
 *
 * @Date:2020/1/16
 * @Author:lc
 */
public interface AuthorizeSiteService {

    /**
     * 新增站点信息
     * @param authorizeSite
     */
    AuthorizeSite addAuthorizeSite(AuthorizeSite authorizeSite);

    /**
     * 修改站点信息
     * @param authorizeSite
     */
    AuthorizeSite updateAuthorizeSite(AuthorizeSite authorizeSite);

    /**
     * 删除站点信息
     * @param ids
     * @return
     */
    Boolean deleteAuthorizeSite(Long[] ids, HttpServletRequest request);

    /**
     * 查询列表
     * @return
     */
    PageInfo<AuthorizeSite> findAuthorizeSiteForPage(AuthorizeSiteVO authorizeSiteVO);

    /**
     * 获取单条数据
     * @param id
     * @return
     */
    AuthorizeSite getAuthorizeSiteById(Long id);

}
