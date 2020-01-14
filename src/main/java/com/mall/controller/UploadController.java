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

	@RequestMapping (value = "/upload/{bgsound}", method = RequestMethod.POST)
	@ResponseBody
	public String upload(MultipartFile file, @PathVariable ("bgsound") String bgsound,
						 HttpServletRequest request) throws Exception {
		Session session = ThreadVariable.getSession();
		if(session == null) {
			throw new BusinessValidationException("请重新登录!");
		}
		if (file == null || file.isEmpty()) {
			throw new BusinessValidationException("没有选择文件");
		}
		if (file.getSize() >= AttachConstants.MAX_FILE_SIZE) {
			throw new BusinessValidationException("文件体积超过上限");
		}

		String realPath = request.getSession().getServletContext().getRealPath(null);
		String fileOriginalName = file.getOriginalFilename();
		String[] fileOriginalNameArr = fileOriginalName.split("\\.");
		String filename = fileOriginalName.substring(0, fileOriginalName.lastIndexOf("."));
		String extension = fileOriginalNameArr[fileOriginalNameArr.length - 1];
		String storageFilename;
		File storageFile;
		try {
			storageFilename = RandomUtil.getRandomFilename(extension, filename, session.getSessionId());
			storageFile = new File(realPath + File.separator + storageFilename);
			file.transferTo(storageFile);
			if(bgsound != null && !"null".equals(bgsound) && !"0".equals(bgsound)) {
				Encoder encoder =new Encoder();
				MultimediaInfo m = encoder.getInfo(storageFile);
				long seconds = m.getDuration()/1000;

				String videoConvertUrl = null;
				/*if(bgsound.equals("1")) {
					videoConvertUrl = AttachConvertUtil.existSoundVideoConvert(storageFilename, seconds, request);
				} else if (bgsound.equals("2")) {
					videoConvertUrl = AttachConvertUtil.noSoundVideoConvert(storageFilename, seconds, request);
				}*/
				File originalFile = new File(realPath + File.separator + storageFilename);
				if (originalFile.exists()) {
					originalFile.delete();
				}
				return videoConvertUrl;
			}
			return storageFilename;
		} catch (Exception e) {
			throw new ServiceValidationException("上传失败！", e);
		}
	}

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
