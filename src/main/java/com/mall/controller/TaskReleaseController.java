package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.component.ThreadVariable;
import com.mall.domain.TaskRelease;
import com.mall.exception.base.BusinessValidationException;
import com.mall.service.TaskReleaseService;
import com.mall.vo.TaskReleaseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Description:
 *
 * @Date:2020/1/15
 * @Author:lc
 */
@Controller
@RequestMapping("/taskRelease")
public class TaskReleaseController {

    @Autowired
    private TaskReleaseService taskReleaseService;

    @RequestMapping("/listPage")
    public String listPage() {
        return "/admin/taskRelease/taskReleaseListPage";
    }

    @RequestMapping("/gotoAddTaskReleasePage")
    public String gotoAddTaskReleasePage() {
        return "/admin/taskRelease/addTaskReleaseDlg";
    }

    @RequestMapping("/gotoUpdateTaskReleasePage")
    public String gotoUpdateTaskReleasePage(@RequestParam(value = "id") Long id, ModelMap map) {
        TaskRelease taskRelease = taskReleaseService.getTaskReleaseById(id);
        map.put("taskRelease", taskRelease);
        return "/admin/taskRelease/updateTaskReleaseDlg";
    }

    @RequestMapping("/addTaskRelease")
    @ResponseBody
    public TaskRelease addTaskRelease(TaskRelease taskRelease) {
        if (ThreadVariable.getSession() == null || ThreadVariable.getSession().getUserId() == null) {
            throw new BusinessValidationException("请重新登录");
        }
        taskRelease.setUserId(ThreadVariable.getSession().getUserId());
        return taskReleaseService.addTaskRelease(taskRelease);
    }

    @RequestMapping("/updateTaskRelease")
    @ResponseBody
    public TaskRelease updateTaskRelease(TaskRelease taskRelease) {
        return taskReleaseService.updateTaskRelease(taskRelease);
    }

    @RequestMapping("/deleteTaskRelease")
    @ResponseBody
    public Boolean deleteTaskRelease(@RequestParam(value = "ids[]") Long[] ids) {
        return taskReleaseService.deleteTaskRelease(ids);
    }

    @RequestMapping("/findTaskReleaseForPage")
    @ResponseBody
    public GridPage<TaskRelease> findTaskReleaseForPage(TaskReleaseVO taskReleaseVO) {
        PageInfo<TaskRelease> taskRelease = taskReleaseService.findTaskReleaseForPage(taskReleaseVO);
        GridPage<TaskRelease> gridPage = new GridPage<>(taskRelease);
        return gridPage;
    }

    @RequestMapping("/findpageTaskReleaseForList")
    public String  main(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model,
                        TaskReleaseVO taskReleaseVO, ModelMap map){
        model.addAttribute("pagemsg", taskReleaseService.findByPage(currentPage, taskReleaseVO));//回显分页数据
        return "/taskrelease";
    }
    @RequestMapping("/getTaskReleaseById")
    public String getTaskReleaseById(@RequestParam(value = "id", required = true) Long id,ModelMap map) {
        TaskRelease taskRelease= taskReleaseService.getTaskReleaseById(id);
        map.put("taskRelease",taskRelease);
        return "taskrelease_Detail";
    }

    @RequestMapping("/findByTaskRelease")
    public String findByIntellectualTask(String str1,ModelMap map){
        List<TaskRelease> TaskReleaselist = taskReleaseService.findBytaskRelease(str1,str1);
        map.put("TaskRelease",TaskReleaselist);
        return "/findpage";
    }
}
