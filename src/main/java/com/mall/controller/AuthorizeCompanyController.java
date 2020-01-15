package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.domain.AuthorizeCompany;
import com.mall.service.AuthorizeCompanyService;
import com.mall.vo.AuthorizeCompanyVO;
import jdk.nashorn.internal.ir.annotations.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Description:
 *
 * @Date:2020/1/14
 * @Author:lc
 */
@Controller
@RequestMapping("/authorizeCompany")
public class AuthorizeCompanyController {

    @Autowired
    private AuthorizeCompanyService authorizeCompanyService;

    @RequestMapping("/listPage")
    public String listPage() {
        return "/admin/authorizeCompany/authorizeCompanyListPage";
    }

    @RequestMapping("/gotoAddAuthorizeCompanyPage")
    public String gotoAddAuthorizeCompanyPage() {
        return "/admin/authorizeCompany/addAuthorizeCompanyDlg";
    }

    @RequestMapping("/gotoUpdateAuthorizeCompanyPage")
    public String gotoUpdateAuthorizeCompanyPage(@RequestParam(value = "id", required = true) Long id, ModelMap map) {
        AuthorizeCompany authorizeCompany = authorizeCompanyService.getAuthorizeCompanyById(id);
        map.put("authorizeCompany", authorizeCompany);
        return "/admin/authorizeCompany/updateAuthorizeCompanyDlg";
    }

    @RequestMapping("/addAuthorizeCompany")
    @ResponseBody
    public AuthorizeCompany addAuthorizeCompany(AuthorizeCompany authorizeCompany) {
        return authorizeCompanyService.addAuthorizeCompany(authorizeCompany);
    }

    @RequestMapping("/updateAuthorizeCompany")
    @ResponseBody
    public AuthorizeCompany updateAuthorizeCompany(AuthorizeCompany authorizeCompany) {
        return authorizeCompanyService.updateAuthorizeCompany(authorizeCompany);
    }

    @RequestMapping("/deleteAuthorizeCompany")
    @ResponseBody
    public Boolean deleteAuthorizeCompany(@RequestParam(value="ids[]", required = true) Long[] ids) {
        return authorizeCompanyService.deleteAuthorizeCompany(ids);
    }

    @RequestMapping("/findAuthorizeCompanyForPage")
    @ResponseBody
    public GridPage<AuthorizeCompany> findAuthorizeCompanyForPage(AuthorizeCompanyVO authorizeCompanyVO) {
        PageInfo<AuthorizeCompany> authorizeCompanyPage = authorizeCompanyService.findAuthorizeCompanyForPage(authorizeCompanyVO);
        GridPage<AuthorizeCompany> gridPage = new GridPage<>(authorizeCompanyPage);
        return gridPage;
    }

    @RequestMapping("/getAuthorizeCompanyById")
    @ResponseBody
    public AuthorizeCompany getAuthorizeCompanyById(@RequestParam(value = "id", required = true) Long id) {
        return authorizeCompanyService.getAuthorizeCompanyById(id);
    }

}
