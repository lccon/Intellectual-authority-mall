package com.mall.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.mall.constant.AttachConstants;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.service.UploadService;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.util.Calendar;
import java.util.UUID;

/**
 * Description:
 *
 * @Date:2020/1/13
 * @Author:lc
 */
@Service("/uploadService")
public class UploadServiceImpl implements UploadService {

    @Override
    public boolean uploadImg(MultipartFile[] imgs, JSONObject result, String url) {
        if (imgs == null || imgs.length <=0 || StringUtils.isEmpty(url)) {
            throw new BusinessValidationException("参数错误!");
        }
        try {
            StringBuilder sb = new StringBuilder();
            for (MultipartFile img : imgs) {
                // 过滤合法的文件类型
                String fileName = img.getOriginalFilename();
                String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
                String allowSuffixs = "jpg,jpeg,png";
                if (allowSuffixs.indexOf(suffix) == -1) {
                    result.put("message", "不支持这种文件类型!");
                    return false;
                }
                // 创建新目录
                String uri = File.separator + getNowDateStr(File.separator);
                File dir = new File(url + uri);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                // 创建新文件
                String newFileName = getUniqueFileName();
                File f = new File(dir.getPath() + File.separator + newFileName + "." + suffix);
                // 将输入流中的数据复制到新文件
                FileUtils.copyInputStreamToFile(img.getInputStream(), f);
                String urlPath = AttachConstants.IMAGE_DIR + uri.replace("\\", "/") + "/" + newFileName + "." + suffix;
                sb.append(urlPath).append(",");
            }
            result.put("resultStr", sb.toString());
            return true;
        } catch (Exception e) {
            throw new ServiceValidationException("上传图片出错!", e);
        }
    }

    @Override
    public boolean uploadVideo(MultipartFile video, JSONObject result, String url) {
        if (video == null || StringUtils.isEmpty(url)) {
            throw new BusinessValidationException("参数错误!");
        }
        try {
            // 过滤合法的文件类型
            String fileName = video.getOriginalFilename();
            String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
            String allowSuffixs = "mp4";
            if (allowSuffixs.indexOf(suffix) == -1) {
                result.put("message", "不支持这种文件类型!");
                return false;
            }
            // 创建新目录
            String uri = File.separator + getNowDateStr(File.separator);
            File dir = new File(url + uri);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            // 创建新文件
            String newFileName = getUniqueFileName();
            File f = new File(dir.getPath() + File.separator + newFileName + "." + suffix);
            // 将输入流中的数据复制到新文件
            FileUtils.copyInputStreamToFile(video.getInputStream(), f);
            String urlPath = AttachConstants.VIDEO_DIR + uri.replace("\\", "/") + "/" + newFileName + "." + suffix;
            result.put("resultStr", urlPath);
            return true;
        } catch (Exception e) {
            throw new ServiceValidationException("上传图片出错!", e);
        }
    }

    private String getNowDateStr(String separator) {
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH) + 1;
        int day = now.get(Calendar.DATE);

        return year + separator + month + separator + day;
    }

    private String getUniqueFileName() {
        String str = UUID.randomUUID().toString();
        return str.replace("-", "");
    }
}
