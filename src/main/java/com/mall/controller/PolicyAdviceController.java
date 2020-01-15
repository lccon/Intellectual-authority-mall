package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.domain.PolicyAdvice;
import com.mall.service.PolicyAdviceService;
import com.mall.vo.PolicyAdviceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Description:
 *
 * @Date:2020/1/10
 * @Author:lc
 */
@RequestMapping("/policyAdvice")
@Controller
public class PolicyAdviceController {

    @Autowired
    private PolicyAdviceService policyAdviceService;

    @RequestMapping("/listPage")
    public String listPage() {
        return "/admin/policyAdvice/policyAdviceListPage";
    }

    @RequestMapping("/gotoAddPolicyAdvicePage")
    public String gotoAddPolicyAdvicePage() {
        return "/admin/policyAdvice/addPolicyAdviceDlg";
    }

    @RequestMapping("/gotoUpdatePolicyAdvicePage")
    public String gotoUpdatePolicyAdvicePage(Long id, ModelMap map) {
        PolicyAdvice policyAdvice = policyAdviceService.getPolicyAdviceById(id);
        map.put("policyAdvice", policyAdvice);
        return "/admin/policyAdvice/updatePolicyAdviceDlg";
    }

    @RequestMapping("/addPolicyAdvice")
    @ResponseBody
    public PolicyAdvice addPolicyAdvice(PolicyAdvice policyAdvice) {
        return policyAdviceService.addPolicyAdvice(policyAdvice);
    }

    @RequestMapping("/updatePolicyAdvice")
    @ResponseBody
    public PolicyAdvice updatePolicyAdvice(PolicyAdvice policyAdvice) {
        return policyAdviceService.updatePolicyAdvice(policyAdvice);
    }

    @RequestMapping("/deletePolicyAdvice")
    @ResponseBody
    public Boolean deletePolicyAdvice(@RequestParam(value = "ids[]", required = true) Long[] ids) {
        return policyAdviceService.deletePolicyAdvice(ids);
    }

    @RequestMapping("/findPolicyAdviceForPage")
    @ResponseBody
    public GridPage<PolicyAdvice> findPolicyAdviceForPage(PolicyAdviceVO policyAdviceVO) {
        PageInfo<PolicyAdvice> policyAdvicePage = policyAdviceService.findPolicyAdviceForPage(policyAdviceVO);
        GridPage<PolicyAdvice> gridPage = new GridPage<>(policyAdvicePage);
        return gridPage;
    }

    @RequestMapping("/getPolicyAdviceById")
    @ResponseBody
    public PolicyAdvice getPolicyAdviceById(Long id) {
        return policyAdviceService.getPolicyAdviceById(id);
    }
}
