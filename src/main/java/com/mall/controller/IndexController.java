package com.mall.controller;

import com.mall.component.ThreadVariable;
import com.mall.domain.*;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.*;
import com.mall.vo.AuthorizeCompanyVO;
import com.mall.vo.IntellectualTaskVO;
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
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String main(ModelMap map) {
        List<PolicyAdvice> PolicyAdvicelist=policyAdviceService.findPolicyAdviceForList();
        List<AuthorizeSite> carouseAuthllist=authorizeSiteService.findAuthorizeSiteBysiteType(1);
        List<AuthorizeSite> centerAuthllist=authorizeSiteService.findAuthorizeSiteBysiteType(2);
        List<AuthorizeSite> leftAuthllist=authorizeSiteService.findAuthorizeSiteBysiteType(3);
        List<AuthorizeSite> rightAuthllist=authorizeSiteService.findAuthorizeSiteBysiteType(4);
        List<AuthorizeSite> yqAuthlist=authorizeSiteService.findAuthorizeSiteBysiteType(5);
        List<IntellectualTask> dayIntellectualTask = intellectualTaskService.findTaskPeriodDataForList(1);
        List<IntellectualTask> weekIntellectualTask = intellectualTaskService.findTaskPeriodDataForList(1);
        List<IntellectualTask> monthIntellectualTask = intellectualTaskService.findTaskPeriodDataForList(1);
        List<TaskRelease> daytaskReleases2 = taskReleaseService.findTaskPeriodDataForList(1);
        List<TaskRelease> weektaskReleases2 = taskReleaseService.findTaskPeriodDataForList( 2);
        List<TaskRelease> monthtaskReleases2 = taskReleaseService.findTaskPeriodDataForList(3);
        map.put("daytaskReleases1",dayIntellectualTask);
        map.put("weektaskReleases1",weekIntellectualTask);
        map.put("monthtaskReleases1",monthIntellectualTask);
        map.put("daytaskReleases2",daytaskReleases2);
        map.put("weektaskReleases2",weektaskReleases2);
        map.put("monthtaskReleases2",monthtaskReleases2);
        map.put("carouseAuthllist",carouseAuthllist);
        map.put("centerAuthllist",centerAuthllist);
        map.put("leftAuthllist",leftAuthllist);
        map.put("rightAuthllist",rightAuthllist);
        map.put("yqAuthlist",yqAuthlist);
        map.put("PolicyAdvice",PolicyAdvicelist);
        return "/index";
    }


    @RequestMapping("/addLeaveMessage")
    @ResponseBody
    public LeaveMessage addLeaveMessage(LeaveMessage leaveMessage) {
        return leaveMessageService.addLeaveMessage(leaveMessage);
    }

    @RequestMapping("/post-message")
    public String postmessage(ModelMap map){
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        User user=userService.findUserById(ThreadVariable.getSession().getUserId());
        Integer FreeMessageNum=user.getFreeMessageNum();
        map.put("FreeMessageNum",FreeMessageNum);
        return "/post-message";
    }
    @RequestMapping("/register")
    public String register(){
        return "/register";
    }
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/getauthorizeType")
    @ResponseBody
    public Integer getauthorizeType(Long userid){
        User user=userService.findUserById(userid);
        return user.getAuthorizeType();
    }
}
