package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.component.ThreadVariable;
import com.mall.domain.AuthorizeCompany;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.AuthorizeCompanyService;
import com.mall.vo.AuthorizeCompanyVO;
import jdk.nashorn.internal.ir.annotations.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
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
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        authorizeCompany.setUserId(ThreadVariable.getSession().getUserId());
        return authorizeCompanyService.addAuthorizeCompany(authorizeCompany);
    }

    @RequestMapping("/updateAuthorizeCompany")
    @ResponseBody
    public AuthorizeCompany updateAuthorizeCompany(AuthorizeCompany authorizeCompany) {
        return authorizeCompanyService.updateAuthorizeCompany(authorizeCompany);
    }


    @RequestMapping("/deleteAuthorizeCompany")
    @ResponseBody
    public Boolean deleteAuthorizeCompany(@RequestParam(value="ids[]", required = true) Long[] ids, HttpServletRequest request) {
        return authorizeCompanyService.deleteAuthorizeCompany(ids, request);
    }

    @RequestMapping("/findAuthorizeCompanyForPage")
    @ResponseBody
    public GridPage<AuthorizeCompany> findAuthorizeCompanyForPage(AuthorizeCompanyVO authorizeCompanyVO) {
        PageInfo<AuthorizeCompany> authorizeCompanyPage = authorizeCompanyService.findAuthorizeCompanyForPage(authorizeCompanyVO);
        GridPage<AuthorizeCompany> gridPage = new GridPage<>(authorizeCompanyPage);
        return gridPage;
    }

    @RequestMapping("/getAuthorizeCompanyById")
    public String getAuthorizeCompanyById(@RequestParam(value = "id", required = true) Long id,ModelMap map) {
        AuthorizeCompany authorizeCompany= authorizeCompanyService.getAuthorizeCompanyById(id);
        map.put("authorizeCompany",authorizeCompany);
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long userId = ThreadVariable.getSession().getUserId();
        authorizeCompanyService.updateBrowseVolume(id, userId);
        return "authorizecompany_Detail";
    }

    @RequestMapping("/findAuthorizeCompanyReleaseForPage")
    public String findAuthorizeCompanyReleaseForPage(AuthorizeCompanyVO authorizeCompanyVO, ModelMap map) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        authorizeCompanyVO.setUserId(ThreadVariable.getSession().getUserId());
        PageInfo<AuthorizeCompany> authorizeCompanyPage = authorizeCompanyService.findAuthorizeCompanyForPage(authorizeCompanyVO);
        GridPage<AuthorizeCompany> gridPage = new GridPage<>(authorizeCompanyPage);
        map.put("gridPageauthorizeCompany", gridPage);
        return "/user_post";
    }

    @RequestMapping("/findpageauthorizeCompanyForList")
    public String  main(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model,
                        AuthorizeCompanyVO authorizeCompanyVO, ModelMap map){
        model.addAttribute("pagemsg", authorizeCompanyService.findByPage(currentPage, authorizeCompanyVO));//回显分页数据
        return "/authorizecompany";
    }


    @RequestMapping("/findByIntellectualTask")
    public String findByIntellectualTask(String str1,ModelMap map){
        List<AuthorizeCompany> AuthorizeCompanylist = authorizeCompanyService.findByAuthorizeCompany(str1,str1);
        map.put("AuthorizeCompany",AuthorizeCompanylist);
        return "/findpage";
    }
    @RequestMapping("/AuthorizeCompanyPost")
    public String AuthorizeCompanypost(){
        return "dbgspost";
    }
}
