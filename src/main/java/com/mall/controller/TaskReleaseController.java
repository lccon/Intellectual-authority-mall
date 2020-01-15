package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.domain.TaskRelease;
import com.mall.service.TaskReleaseService;
import com.mall.vo.TaskReleaseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
