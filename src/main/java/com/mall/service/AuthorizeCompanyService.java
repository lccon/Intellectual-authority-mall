package com.mall.service;

import com.github.pagehelper.PageInfo;
import com.mall.domain.AuthorizeCompany;
import com.mall.vo.AuthorizeCompanyVO;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/14
 * @Author:lc
 */
public interface AuthorizeCompanyService {

    /**
     * 新增代办公司信息
     * @param authorizeCompany
     */
    AuthorizeCompany addAuthorizeCompany(AuthorizeCompany authorizeCompany);

    /**
     * 修改代办公司信息
     * @param authorizeCompany
     */
    AuthorizeCompany updateAuthorizeCompany(AuthorizeCompany authorizeCompany);

    /**
     * 多条删除数据
     * @param ids
     * @return
     */
    Boolean deleteAuthorizeCompany(Long[] ids);

    /**
     * 查询所有的代办公司信息
     * @return
     */
    PageInfo<AuthorizeCompany> findAuthorizeCompanyForPage(AuthorizeCompanyVO authorizeCompanyVO);

    /**
     * 查询单条代办公司信息
     * @param id
     * @return
     */
    AuthorizeCompany getAuthorizeCompanyById(Long id);
}