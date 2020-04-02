package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.component.ThreadVariable;
import com.mall.domain.AuthorizeSite;
import com.mall.domain.IntellectualTask;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.AuthorizeSiteService;
import com.mall.service.IntellectualTaskService;
import com.mall.service.UserService;
import com.mall.vo.IntellectualTaskVO;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/13
 * @Author:lc
 */
@RequestMapping("/intellectualTask")
@Controller
public class IntellectualTaskController {

    @Autowired
    private IntellectualTaskService intellectualTaskService;
    @Autowired
    private UserService userService;
    @Autowired
    private AuthorizeSiteService authorizeSiteService;


    @RequestMapping("/listPage")
    public String listPage() {
        return "/admin/intellectualTask/intellectualTaskPage";
    }

    @RequestMapping("/gotoAddIntellectualTaskPage")
    public String gotoAddIntellectualTaskPage() {
        return "/admin/intellectualTask/addIntellectualTaskDlg";
    }

    @RequestMapping("/gotoUpdateIntellectualTaskPage")
    public String gotoUpdateIntellectualTaskPage(@RequestParam(value = "id", required = true) Long id, ModelMap map) {
        IntellectualTask intellectualTask = intellectualTaskService.getIntellectualTaskById(id);
        map.put("intellectualTask", intellectualTask);
        return "/admin/intellectualTask/updateIntellectualTaskDlg";
    }

    @RequestMapping("/addIntellectualTask")
    @ResponseBody
    public IntellectualTask addIntellectualTask(IntellectualTask intellectualTask) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        intellectualTask.setUserId(ThreadVariable.getSession().getUserId());
        return intellectualTaskService.addIntellectualTask(intellectualTask);
    }

    @RequestMapping("/updateIntellectualTask")
    @ResponseBody
    public IntellectualTask updateIntellectualTask(IntellectualTask intellectualTask) {
        return intellectualTaskService.updateIntellectualTask(intellectualTask);
    }

    @RequestMapping("/deleteIntellectualTask")
    @ResponseBody
    public Boolean deleteIntellectualTask(@RequestParam(value = "ids[]", required= true) Long[] ids, HttpServletRequest request) {
        return intellectualTaskService.deleteIntellectualTask(ids, request);
    }

    @RequestMapping("/findIntellectualTaskForPage")
    @ResponseBody
    public GridPage<IntellectualTask> findIntellectualTaskForPage(IntellectualTaskVO intellectualTaskVO) {
        PageInfo<IntellectualTask> intellectualTaskList = intellectualTaskService.findIntellectualTaskForPage(intellectualTaskVO);
        GridPage<IntellectualTask> gridPage = new GridPage<>(intellectualTaskList);
        return gridPage;
    }


    @RequestMapping("/findpageIntellectualTaskForList")
    public String  main(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model,
                        IntellectualTaskVO intellectualTaskVO, ModelMap map){
        model.addAttribute("pagemsg", intellectualTaskService.findByPage(currentPage, intellectualTaskVO));//回显分页数据
        List<AuthorizeSite> rightadv=authorizeSiteService.findAuthorizeSiteBysiteType(4);
        List<AuthorizeSite> leftadv=authorizeSiteService.findAuthorizeSiteBysiteType(3);
        map.put("rightadv",rightadv);
        map.put("leftadv",leftadv);
        return "/zscqsc";
    }

    @RequestMapping("/findIntellectualTaskReleaseForPage")
    public String findIntellectualTaskReleaseForPage(IntellectualTaskVO intellectualTaskVO, ModelMap map) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        intellectualTaskVO.setUserId(ThreadVariable.getSession().getUserId());
        PageInfo<IntellectualTask> intellectualTaskList = intellectualTaskService.findIntellectualTaskForPage(intellectualTaskVO);
        GridPage<IntellectualTask> gridPage = new GridPage<>(intellectualTaskList);
        map.put("gridPageintellectualTask", gridPage);
        return "/user_post";
    }

    @RequestMapping("/getIntellectualTaskById")
    public String getIntellectualTaskById(@RequestParam(value = "id", required = true) Long id, ModelMap map) {
        IntellectualTask intellectualTask = intellectualTaskService.getIntellectualTaskById(id);
        map.put("intellectualTask", intellectualTask);
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        Long userId = ThreadVariable.getSession().getUserId();
        intellectualTaskService.updateBrowseVolume(id, userId);
        List<AuthorizeSite> rightadv=authorizeSiteService.findAuthorizeSiteBysiteType(4);
        List<AuthorizeSite> leftadv=authorizeSiteService.findAuthorizeSiteBysiteType(3);
        map.put("rightadv",rightadv);
        map.put("leftadv",leftadv);
        return "/proDetail";
    }

    @RequestMapping("/findByIntellectualTask")
    public String findByIntellectualTask(String str1,ModelMap map){
        List<IntellectualTask> IntellectualTasklist = intellectualTaskService.findByintellectualTask(str1,str1);
        map.put("IntellectualTask",IntellectualTasklist);
        return "/findpage";
    }
    @RequestMapping("/IntellectualTaskPost")
    public String IntellectualTaskPost(ModelMap map){
        List<AuthorizeSite> rightadv=authorizeSiteService.findAuthorizeSiteBysiteType(4);
        List<AuthorizeSite> leftadv=authorizeSiteService.findAuthorizeSiteBysiteType(3);
        map.put("rightadv",rightadv);
        map.put("leftadv",leftadv);
        return "zxcqpost";
    }

    @RequestMapping("/useraddIntellectualTask")
    public String useraddIntellectualTask(IntellectualTask intellectualTask) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        User user=userService.findUserById(ThreadVariable.getSession().getUserId());
        Integer FreeMessageNum=user.getFreeMessageNum()-1;
        user.setFreeMessageNum(FreeMessageNum);
        userService.updateUser(user);
        intellectualTask.setUserId(ThreadVariable.getSession().getUserId());
        intellectualTaskService.addIntellectualTask(intellectualTask);
        return "/usercenter";
    }
}
