package com.mall.mapper;

import com.mall.domain.AuthorizeSite;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/16
 * @Author:lc
 */
public interface AuthorizeSiteMapper {

    /**
     * 新增站点信息
     * @param authorizeSite
     */
    void addAuthorizeSite(AuthorizeSite authorizeSite);

    /**
     * 修改站点信息
     * @param authorizeSite
     */
    void updateAuthorizeSite(AuthorizeSite authorizeSite);

    /**
     * 删除站点信息
     * @param ids
     * @return
     */
    Integer deleteAuthorizeSite(Long[] ids);

    /**
     * 查询列表
     * @return
     */
    List<AuthorizeSite> findAuthorizeSiteForList();

    /**
     * 获取单条数据
     * @param id
     * @return
     */
    AuthorizeSite getAuthorizeSiteById(Long id);

    /**
     * 前端：查询注册站点
     * @return
     */
    List<AuthorizeSite> findUserAuthorizeSiteForList();

    /**
     * 删除过期的站点
     * @return
     */
    Integer deleteUserAuthorizeSite();
    List<AuthorizeSite> findAuthorizeSiteBysiteType(Integer siteType);
}
