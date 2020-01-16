package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.domain.AuthorizeCompany;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.AuthorizeCompanyMapper;
import com.mall.service.AuthorizeCompanyService;
import com.mall.utils.StringUtil;
import com.mall.vo.AuthorizeCompanyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/14
 * @Author:lc
 */
@Service("authorizeCompanyService")
public class AuthorizeCompanyServiceImpl implements AuthorizeCompanyService {

    @Autowired
    private AuthorizeCompanyMapper authorizeCompanyMapper;

    @Override
    public AuthorizeCompany addAuthorizeCompany(AuthorizeCompany authorizeCompany) {
        if (authorizeCompany == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            authorizeCompanyMapper.addAuthorizeCompany(authorizeCompany);
            return authorizeCompany;
        } catch (Exception e) {
            throw new ServiceValidationException("新增代办公司信息出错", e);
        }
    }

    @Override
    public AuthorizeCompany updateAuthorizeCompany(AuthorizeCompany authorizeCompany) {
        if (authorizeCompany == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            authorizeCompanyMapper.updateAuthorizeCompany(authorizeCompany);
            return authorizeCompany;
        } catch (Exception e) {
            throw new ServiceValidationException("修改代办公司信息出错", e);
        }
    }

    @Override
    public Boolean deleteAuthorizeCompany(Long[] ids, HttpServletRequest request) {
        if (ids == null || ids.length <= 0) {
            throw new BusinessValidationException("参数不能为空");
        }
        try {
            for (Long id : ids) {
                AuthorizeCompany authorizeCompany = getAuthorizeCompanyById(id);
                if(authorizeCompany != null && !StringUtils.isEmpty(authorizeCompany.getCompanyPictureUrl())) {
                    String[] companyPictureArr = authorizeCompany.getCompanyPictureUrl().split(",");
                    for (String companyPicture : companyPictureArr) {
                        String realPath = request.getSession().getServletContext().getRealPath(companyPicture);
                        File file = new File(realPath);
                        file.delete();
                    }
                }
            }
            Integer count = authorizeCompanyMapper.deleteAuthorizeCompany(ids);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("删除多条信息出错!", e);
        }
    }

    @Override
    public PageInfo<AuthorizeCompany> findAuthorizeCompanyForPage(AuthorizeCompanyVO authorizeCompanyVO) {
        try {
            PageHelper.startPage(authorizeCompanyVO.getPage(), authorizeCompanyVO.getRows(),
                    StringUtil.joinSortFieldOrder(authorizeCompanyVO.getSidx(), authorizeCompanyVO.getSord()));
            List<AuthorizeCompany> authorizeCompanyList = authorizeCompanyMapper.findAuthorizeCompanyForList();
            return new PageInfo<>(authorizeCompanyList);
        } catch (Exception e) {
            throw new ServiceValidationException("查询代办公司列表出错!", e);
        }
    }

    @Override
    public AuthorizeCompany getAuthorizeCompanyById(Long id) {
        if (id == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            return authorizeCompanyMapper.getAuthorizeCompanyById(id);
        } catch (Exception e) {
            throw new ServiceValidationException("获取单条代办公司信息出错!", e);
        }
    }
}
