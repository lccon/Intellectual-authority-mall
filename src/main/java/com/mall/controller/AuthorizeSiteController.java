package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.constant.AttachConstants;
import com.mall.domain.AuthorizeSite;
import com.mall.service.AuthorizeSiteService;
import com.mall.vo.AuthorizeSiteVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Description:
 *
 * @Date:2020/1/16
 * @Author:lc
 */
@Controller
@RequestMapping("/authorizeSite")
public class AuthorizeSiteController {

    @Autowired
    private AuthorizeSiteService authorizeSiteService;

    @RequestMapping("/listPage")
    public String listPage() {
        return "/admin/authorizeSite/authorizeSiteListPage";
    }

    @RequestMapping("/gotoAddAuthorizeSitePage")
    public String gotoAddAuthorizeSitePage() {
        return "/admin/authorizeSite/addAuthorizeSiteDlg";
    }

    @RequestMapping("/gotoUpdateAuthorizeSitePage")
    public String gotoUpdateAuthorizeSitePage(@RequestParam(value = "id")Long id, ModelMap map)  {
        AuthorizeSite authorizeSite = authorizeSiteService.getAuthorizeSiteById(id);
        map.put("authorizeSite", authorizeSite);
        return "/admin/authorizeSite/updateAuthorizeSiteDlg";
    }

    @RequestMapping("/addAuthorizeSite")
    @ResponseBody
    public AuthorizeSite addAuthorizeSite(AuthorizeSite authorizeSite) {
        return authorizeSiteService.addAuthorizeSite(authorizeSite);
    }

    @RequestMapping("/updateAuthorizeSite")
    @ResponseBody
    public AuthorizeSite updateAuthorizeSite(AuthorizeSite authorizeSite) {
        return authorizeSiteService.updateAuthorizeSite(authorizeSite);
    }

    @RequestMapping("/deleteAuthorizeSite")
    @ResponseBody
    public Boolean deleteAuthorizeSite(@RequestParam(value = "ids[]")Long[] ids, HttpServletRequest request) {
        return authorizeSiteService.deleteAuthorizeSite(ids, request);
    }

    @RequestMapping("/findAuthorizeSiteForPage")
    @ResponseBody
    public GridPage<AuthorizeSite> findAuthorizeSiteForPage(AuthorizeSiteVO authorizeSiteVO) {
        PageInfo<AuthorizeSite> authorizeSitePage = authorizeSiteService.findAuthorizeSiteForPage(authorizeSiteVO);
        GridPage<AuthorizeSite> gridPage = new GridPage<>(authorizeSitePage);
        return gridPage;
    }
}
