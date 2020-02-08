package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.domain.IntellectualTask;
import com.mall.service.IntellectualTaskService;
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
    public String  main(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model,ModelMap map){
        model.addAttribute("pagemsg", intellectualTaskService.findByPage(currentPage));//回显分页数据
        List<IntellectualTask> list = intellectualTaskService.findIntellectualTaskForList();
        map.put("list", list);
        return "/zscqsc";
    }



    @RequestMapping("/getIntellectualTaskById")
    @ResponseBody
    public IntellectualTask getIntellectualTaskById(@RequestParam(value = "id", required = true) Long id) {
        return intellectualTaskService.getIntellectualTaskById(id);
    }
}
