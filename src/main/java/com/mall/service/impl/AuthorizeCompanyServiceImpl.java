package com.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.constant.CommonConstants;
import com.mall.domain.*;
import com.mall.enums.ModuleTypeEnum;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.mapper.AuthorizeCompanyMapper;
import com.mall.service.AuthorizeCompanyService;
import com.mall.service.BusinessCollectedService;
import com.mall.service.RoofPlaceService;
import com.mall.utils.StringUtil;
import com.mall.vo.AuthorizeCompanyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
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
    @Autowired
    private RoofPlaceService roofPlaceService;
    @Autowired
    private BusinessCollectedService businessCollectedService;

    @Override
    public AuthorizeCompany addAuthorizeCompany(AuthorizeCompany authorizeCompany) {
        if (authorizeCompany == null) {
            throw new BusinessValidationException("参数不能为空!");
        }
        try {
            authorizeCompanyMapper.addAuthorizeCompany(authorizeCompany);
            if(authorizeCompany.getTopDuration() != null && authorizeCompany.getRoofPlaceState() != null) {
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.AUTHORIZE_COMPANY.getModuleCode());
                roofPlace.setModuleTypeId(authorizeCompany.getId());
                roofPlace.setTopDuration(authorizeCompany.getTopDuration());
                roofPlace.setAuthorizeState(authorizeCompany.getRoofPlaceState());
                roofPlaceService.addRoofPlace(roofPlace);
            }
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
            if(authorizeCompany.getTopDuration() != null) {
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.AUTHORIZE_COMPANY.getModuleCode());
                roofPlace.setModuleTypeId(authorizeCompany.getId());
                roofPlace.setTopDuration(authorizeCompany.getTopDuration());
                roofPlaceService.updateRoofPlace(roofPlace);
            }
            return authorizeCompany;
        } catch (Exception e) {
            throw new ServiceValidationException("修改代办公司信息出错", e);
        }
    }

    @Override
    public List<AuthorizeCompany> findAuthorizeCompanyForList() {
        return authorizeCompanyMapper.findAuthorizeCompanyForList();
    }

    @Override
    public List<AuthorizeCompany> findByAuthorizeCompany(String companyName,String companyDescribe) {
        return authorizeCompanyMapper.findByAuthorizeCompany(companyName,companyDescribe);
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
                RoofPlace roofPlace = new RoofPlace();
                roofPlace.setModuleType(ModuleTypeEnum.INTELLECTUAL_TASK.getModuleCode());
                roofPlace.setModuleTypeId(id);
                roofPlaceService.deleteRoofPlace(roofPlace);
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
            handleAuthorizeCompany(authorizeCompanyList);
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
            AuthorizeCompany authorizeCompany = authorizeCompanyMapper.getAuthorizeCompanyById(id);
            RoofPlace roofPlace = new RoofPlace();
            roofPlace.setModuleType(ModuleTypeEnum.AUTHORIZE_COMPANY.getModuleCode());
            roofPlace.setModuleTypeId(authorizeCompany.getId());
            RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
            if (roofPlaceInfo != null) {
                authorizeCompany.setRoofPlaceState(roofPlaceInfo.getAuthorizeState());
                authorizeCompany.setTopDuration(roofPlaceInfo.getTopDuration());
            }
            return authorizeCompany;
        } catch (Exception e) {
            throw new ServiceValidationException("获取单条代办公司信息出错!", e);
        }
    }

    public int countnum(){
        return authorizeCompanyMapper.countnum();
    }
    @Override
    public pagebean<AuthorizeCompany> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        pagebean<AuthorizeCompany> pageBean = new pagebean<AuthorizeCompany>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=3;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = authorizeCompanyMapper.countnum();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<AuthorizeCompany> lists = authorizeCompanyMapper.findByPage(map);
        handleAuthorizeCompany(lists);
        Collections.sort(lists, new Comparator<AuthorizeCompany>() {
            @Override
            public int compare(AuthorizeCompany o1, AuthorizeCompany o2) {
                if (o1.getRoofPlaceState() != null && o2.getRoofPlaceState() != null &&
                        !o1.getRoofPlaceState().equals(o2.getRoofPlaceState())) {
                    return o2.getRoofPlaceState()-o1.getRoofPlaceState();
                } else {
                    return (int) (o2.getCreateDate().getTime()-o1.getCreateDate().getTime());
                }
            }
        });
        pageBean.setLists(lists);
        return pageBean;
    }

    private void handleAuthorizeCompany(List<AuthorizeCompany> authorizeCompanyList) {
        BusinessCollected businessCollected = new BusinessCollected();
        RoofPlace roofPlace = new RoofPlace();
        roofPlace.setModuleType(ModuleTypeEnum.AUTHORIZE_COMPANY.getModuleCode());
        businessCollected.setModuleType(ModuleTypeEnum.AUTHORIZE_COMPANY.getModuleCode());
        for (AuthorizeCompany authorizeCompany : authorizeCompanyList) {
            roofPlace.setModuleTypeId(authorizeCompany.getId());
            RoofPlace roofPlaceInfo = roofPlaceService.getRoofPlaceInfo(roofPlace);
            if (roofPlaceInfo != null) {
                authorizeCompany.setRoofPlaceState(roofPlaceInfo.getAuthorizeState());
                authorizeCompany.setTopDuration(roofPlaceInfo.getTopDuration());
            }
            BusinessCollected businessCollectedInfo = businessCollectedService.getBusinessCollected(businessCollected);
            if (businessCollectedInfo != null) {
                authorizeCompany.setHasCollectedState(CommonConstants.IS_COLLECTED);
            } else {
                authorizeCompany.setHasCollectedState(CommonConstants.NOT_IS_COLLECTED);
            }
        }
    }
}
