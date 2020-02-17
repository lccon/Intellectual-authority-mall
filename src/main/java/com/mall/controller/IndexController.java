package com.mall.controller;

import com.mall.domain.AuthorizeCompany;
import com.mall.domain.IntellectualTask;
import com.mall.domain.PolicyAdvice;
import com.mall.domain.TaskRelease;
import com.mall.service.AuthorizeCompanyService;
import com.mall.service.IntellectualTaskService;
import com.mall.service.PolicyAdviceService;
import com.mall.service.TaskReleaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/6
 * @Author:lc
 */
@Controller
public class IndexController {
    @Autowired
    private IntellectualTaskService intellectualTaskService;
    @Autowired
    private AuthorizeCompanyService authorizeCompanyService;
    @Autowired
    private TaskReleaseService taskReleaseService;
    @Autowired
    private PolicyAdviceService policyAdviceService;


    @RequestMapping("/")
    public String main(ModelMap map) {
        List<IntellectualTask> IntellectualTasklist = intellectualTaskService.findIntellectualTaskForList();
        List<TaskRelease> TaskReleaselist=taskReleaseService.getTaskReleaseByTask_category(1);
        List<TaskRelease> TaskReleaselist1=taskReleaseService.getTaskReleaseByTask_category(2);
        List<AuthorizeCompany> AuthorizeCompanylist=authorizeCompanyService.findAuthorizeCompanyForList();
        List<PolicyAdvice> PolicyAdvicelist=policyAdviceService.findPolicyAdviceForList();
        map.put("IntellectualTask",IntellectualTasklist);
        map.put("TaskRelease",TaskReleaselist);
        map.put("TaskRelease1",TaskReleaselist1);
        map.put("AuthorizeCompany",AuthorizeCompanylist);
        map.put("PolicyAdvice",PolicyAdvicelist);
        return "/index";
    }

    @RequestMapping("/find")
    public String find(ModelMap map){
        String str1="卖了";
        List<IntellectualTask> IntellectualTasklist = intellectualTaskService.findByintellectualTask(str1,str1);
        List<TaskRelease> TaskReleaselist=taskReleaseService.findBytaskRelease(str1,str1);
        List<AuthorizeCompany> AuthorizeCompanylist=authorizeCompanyService.findByauthorizeCompany(str1,str1);
        map.put("IntellectualTask",IntellectualTasklist);
        map.put("TaskRelease",TaskReleaselist);
        map.put("AuthorizeCompany",AuthorizeCompanylist);
        return "/findpage";
    }


}
