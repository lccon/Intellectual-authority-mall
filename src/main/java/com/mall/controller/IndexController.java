package com.mall.controller;

import com.mall.domain.*;
import com.mall.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @Autowired
    private AuthorizeSiteService authorizeSiteService;
    @Autowired
    private LeaveMessageService leaveMessageService;

    @RequestMapping("/")
    public String main(ModelMap map) {
        List<IntellectualTask> IntellectualTasklist = intellectualTaskService.findIntellectualTaskForList();
        List<TaskRelease> TaskReleaselist=taskReleaseService.getTaskReleaseByTask_category(1);
        List<TaskRelease> TaskReleaselist1=taskReleaseService.getTaskReleaseByTask_category(2);
        List<AuthorizeCompany> AuthorizeCompanylist=authorizeCompanyService.findAuthorizeCompanyForList();
        List<PolicyAdvice> PolicyAdvicelist=policyAdviceService.findPolicyAdviceForList();
        List<AuthorizeSite> AuthorizeSitelist=authorizeSiteService.findAuthorizeSiteForList();
        map.put("AuthorizeSite",AuthorizeSitelist);
        map.put("IntellectualTask",IntellectualTasklist);
        map.put("TaskRelease",TaskReleaselist);
        map.put("TaskRelease1",TaskReleaselist1);
        map.put("AuthorizeCompany",AuthorizeCompanylist);
        map.put("PolicyAdvice",PolicyAdvicelist);
        return "/index";
    }

    @RequestMapping("/find")
    public String find(String str1,ModelMap map){
        List<AuthorizeCompany> AuthorizeCompanylist=authorizeCompanyService.findByAuthorizeCompany(str1,str1);
        List<IntellectualTask> IntellectualTasklist = intellectualTaskService.findByintellectualTask(str1,str1);
        List<TaskRelease> TaskReleaselist=taskReleaseService.findBytaskRelease(str1,str1);
        map.put("IntellectualTask",IntellectualTasklist);
        map.put("TaskRelease",TaskReleaselist);
        map.put("AuthorizeCompany",AuthorizeCompanylist);
        return "/findpage";
    }
    @RequestMapping("/addLeaveMessage")
    @ResponseBody
    public LeaveMessage addLeaveMessage(LeaveMessage leaveMessage) {
        return leaveMessageService.addLeaveMessage(leaveMessage);
    }

    @RequestMapping("/post-message")
    public String postmessage(){
        return "/post-message";
    }
    @RequestMapping("/register")
    public String register(){
        return "/register";
    }

}
