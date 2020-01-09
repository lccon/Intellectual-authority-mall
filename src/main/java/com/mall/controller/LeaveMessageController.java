package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.domain.LeaveMessage;
import com.mall.service.LeaveMessageService;
import com.mall.vo.LeaveMessageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Description:
 *
 * @Date:2020/1/8
 * @Author:lc
 */
@RequestMapping("/leaveMessage")
@Controller
public class LeaveMessageController {

    @Autowired
    private LeaveMessageService leaveMessageService;

    @RequestMapping("/listPage")
    public String listPage() {
        return "/admin/leaveMessage/leaveMessageListPage";
    }

    @RequestMapping("/gotoAddLeaveMessagePage")
    public String gotoAddLeaveMessagePage() {
        return "/admin/leaveMessage/addLeaveMessageDlg";
    }

    @RequestMapping("/gotoUpdateLeaveMessagePage")
    public String gotoUpdateLeaveMessagePage(Long id, ModelMap map) {
        LeaveMessage leaveMessage = leaveMessageService.getLeaveMessageById(id);
        map.put("leaveMessage", leaveMessage);
        return "/admin/leaveMessage/updateLeaveMessageDlg";
    }

    @RequestMapping("/addLeaveMessage")
    @ResponseBody
    public LeaveMessage addLeaveMessage(LeaveMessage leaveMessage) {
        return leaveMessageService.addLeaveMessage(leaveMessage);
    }

    @RequestMapping("/updateLeaveMessage")
    @ResponseBody
    public LeaveMessage updateLeaveMessage(LeaveMessage leaveMessage) {
        return leaveMessageService.updateLeaveMessage(leaveMessage);
    }

    @RequestMapping("/updateLeaveMessageState")
    @ResponseBody
    public Boolean updateLeaveMessageState() {
        return leaveMessageService.updateLeaveMessageState();
    }

    @RequestMapping("/deleteLeaveMessage")
    @ResponseBody
    public Boolean deleteLeaveMessage(@RequestParam(value = "ids[]", required = true) Long[] ids) {
        return leaveMessageService.deleteLeaveMessage(ids);
    }

    @RequestMapping("/findLeaveMessageForList")
    @ResponseBody
    public GridPage<LeaveMessage> findLeaveMessageForList(LeaveMessageVO leaveMessageVO) {
        PageInfo<LeaveMessage> leaveMessageList = leaveMessageService.findLeaveMessageForList(leaveMessageVO);
        GridPage<LeaveMessage> gridPage = new GridPage<>(leaveMessageList);
        return gridPage;
    }

}
