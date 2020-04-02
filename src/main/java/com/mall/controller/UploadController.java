package com.mall.controller;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.annotations.JsonAdapter;
import com.mall.component.ThreadVariable;
import com.mall.constant.AttachConstants;
import com.mall.domain.Session;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.service.UploadService;
import com.mall.utils.RandomUtil;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

@Controller
@RequestMapping("/upload")
public class UploadController {

	@Autowired
	private UploadService uploadService;

	@RequestMapping("/uploadImg")
	@ResponseBody
	public JSONObject uploadImg(@RequestParam(value = "img") MultipartFile[] img, HttpServletResponse response,
								HttpServletRequest request) {
		JSONObject result = new JSONObject();
		String url = request.getSession().getServletContext().getRealPath(AttachConstants.IMAGE_DIR);
		boolean flag = uploadService.uploadImg(img, result, url);
		result.put("flag", flag);
		response.setContentType("text/html;charset=UTF-8");
		// 解决跨域名访问问题
		response.setHeader("Access-Control-Allow-Origin", "*");
		return result;
	}

	@RequestMapping("/uploadVideo")
	@ResponseBody
	public JSONObject uploadVideo(@RequestParam(value = "video") MultipartFile video, HttpServletResponse response,
								  HttpServletRequest request) {
		JSONObject result = new JSONObject();
		String url = request.getSession().getServletContext().getRealPath(AttachConstants.VIDEO_DIR);
		boolean flag = uploadService.uploadVideo(video, result, url);
		result.put("flag", flag);
		response.setContentType("text/html;charset=UTF-8");
		// 解决跨域名访问问题
		response.setHeader("Access-Control-Allow-Origin", "*");
		return result;
	}
}
