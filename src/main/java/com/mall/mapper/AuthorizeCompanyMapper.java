package com.mall.mapper;

import com.mall.domain.AuthorizeCompany;

import java.util.HashMap;
import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/14
 * @Author:lc
 */
public interface AuthorizeCompanyMapper {

    /**
     * 新增代办公司信息
     * @param authorizeCompany
     */
    void addAuthorizeCompany(AuthorizeCompany authorizeCompany);

    /**
     * 修改代办公司信息
     * @param authorizeCompany
     */
    void updateAuthorizeCompany(AuthorizeCompany authorizeCompany);

    /**
     * 多条删除数据
     * @param ids
     * @return
     */
    Integer deleteAuthorizeCompany(Long[] ids);

    /**
     * 查询所有的代办公司信息
     * @return
     */
    List<AuthorizeCompany> findAuthorizeCompanyForList();

    /**
     * 查询单条代办公司信息
     * @param id
     * @return
     */
    AuthorizeCompany getAuthorizeCompanyById(Long id);
    int countnum();
    List<AuthorizeCompany>findByPage(HashMap<String,Object> map);
    List<AuthorizeCompany> findByauthorizeCompany(String company_name,String company_describe);
}
