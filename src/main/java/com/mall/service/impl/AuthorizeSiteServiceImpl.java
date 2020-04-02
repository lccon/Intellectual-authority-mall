package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.constant.AttachConstants;
import com.mall.domain.AuthorizeSite;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.AuthorizeSiteMapper;
import com.mall.service.AuthorizeSiteService;
import com.mall.utils.StringUtil;
import com.mall.vo.AuthorizeSiteVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/16
 * @Author:lc
 */
@Service("authorizeSiteService")
public class AuthorizeSiteServiceImpl implements AuthorizeSiteService {

    @Autowired
    private AuthorizeSiteMapper authorizeSiteMapper;

    @Override
    public AuthorizeSite addAuthorizeSite(AuthorizeSite authorizeSite) {
        if (authorizeSite == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            authorizeSiteMapper.addAuthorizeSite(authorizeSite);
            return authorizeSite;
        } catch (Exception e) {
            throw new ServiceValidationException("新增站点出错!", e);
        }
    }

    @Override
    public AuthorizeSite updateAuthorizeSite(AuthorizeSite authorizeSite) {
        if (authorizeSite == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            authorizeSiteMapper.updateAuthorizeSite(authorizeSite);
            return authorizeSite;
        } catch (Exception e) {
            throw new ServiceValidationException("修改站点出错!", e);
        }
    }

    @Override
    public List<AuthorizeSite> findAuthorizeSiteForList() {
        // authorizeSiteMapper.deleteUserAuthorizeSite();
        return authorizeSiteMapper.findUserAuthorizeSiteForList();
    }
    @Override
    public List<AuthorizeSite> findAuthorizeSiteBysiteType(Integer siteType) {
        return authorizeSiteMapper.findAuthorizeSiteBysiteType(siteType);
    }

    @Override
    public Boolean deleteAuthorizeSite(Long[] ids, HttpServletRequest request) {
        if (ids == null || ids.length <= 0) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            for (Long id : ids) {
               AuthorizeSite authorizeSite = getAuthorizeSiteById(id);
                if (authorizeSite != null && !StringUtils.isEmpty(authorizeSite.getSitePictureUrl())) {
                    String[] sitePictureArr = authorizeSite.getSitePictureUrl().split(",");
                    for (String sitePicture : sitePictureArr) {
                        String url = request.getSession().getServletContext().getRealPath(sitePicture);
                        File file = new File(url);
                        file.delete();
                    }
                }
            }
            Integer count = authorizeSiteMapper.deleteAuthorizeSite(ids);
            return count > 0;
        } catch (Exception e) {
            throw new ServiceValidationException("删除站点出错!", e);
        }
    }

    @Override
    public PageInfo<AuthorizeSite> findAuthorizeSiteForPage(AuthorizeSiteVO authorizeSiteVO) {
        try {
            // authorizeSiteMapper.deleteUserAuthorizeSite();
            PageHelper.startPage(authorizeSiteVO.getPage(), authorizeSiteVO.getRows(),
                    StringUtil.joinSortFieldOrder(authorizeSiteVO.getSidx(), authorizeSiteVO.getSord()));
            List<AuthorizeSite> authorizeSiteList = authorizeSiteMapper.findAuthorizeSiteForList();
            return new PageInfo<>(authorizeSiteList);
        } catch (Exception e) {
            throw new ServiceValidationException("获取站点出错!", e);
        }
    }

    @Override
    public AuthorizeSite getAuthorizeSiteById(Long id) {
        if (id == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            AuthorizeSite authorizeSite = authorizeSiteMapper.getAuthorizeSiteById(id);
            return authorizeSite;
        } catch (Exception e) {
            throw new ServiceValidationException("获取站点出错!", e);
        }
    }
}
