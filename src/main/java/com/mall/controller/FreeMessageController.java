package com.mall.controller;

import com.github.pagehelper.PageInfo;
import com.mall.base.GridPage;
import com.mall.domain.FreeMessage;
import com.mall.service.FreeMessageService;
import com.mall.vo.FreeMessageVO;
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
@RequestMapping("/freeMessage")
@Controller
public class FreeMessageController {

    @Autowired
    private FreeMessageService freeMessageService;

    @RequestMapping("/listPage")
    public String listPage() {
        return "/admin/freeMessage/freeMessageListPage";
    }

    @RequestMapping("/gotoAddFreeMessagePage")
    public String gotoAddFreeMessagePage() {
        return "/admin/freeMessage/addFreeMessageDlg";
    }

    @RequestMapping("/gotoUpdateFreeMessagePage")
    public String gotoUpdateFreeMessagePage(Long id, ModelMap map) {
        FreeMessage freeMessage = freeMessageService.getFreeMessageById(id);
        map.put("freeMessage", freeMessage);
        return "/admin/freeMessage/updateFreeMessageDlg";
    }

    @RequestMapping("/addFreeMessage")
    @ResponseBody
    public FreeMessage addFreeMessage(FreeMessage freeMessage) {
        return freeMessageService.addFreeMessage(freeMessage);
    }

    @RequestMapping("/updateFreeMessage")
    @ResponseBody
    public FreeMessage updateFreeMessage(FreeMessage freeMessage) {
        return freeMessageService.updateFreeMessage(freeMessage);
    }

    @RequestMapping("/deleteFreeMessage")
    @ResponseBody
    public Boolean deleteFreeMessage(@RequestParam(value = "ids[]", required = true) Long[] ids) {
        return freeMessageService.deleteFreeMessage(ids);
    }

    @RequestMapping("/findFreeMessageForPage")
    @ResponseBody
    public GridPage<FreeMessage> findFreeMessageForPage(FreeMessageVO freeMessageVO) {
        PageInfo<FreeMessage> freeMessagePage = freeMessageService.findFreeMessageForPage(freeMessageVO);
        GridPage<FreeMessage> gridPage = new GridPage<>(freeMessagePage);
        return gridPage;
    }

    @RequestMapping("/getFreeMessageById")
    @ResponseBody
    public FreeMessage getFreeMessageById(Long id) {
        return freeMessageService.getFreeMessageById(id);
    }
}
