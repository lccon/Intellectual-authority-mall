package com.mall.service;

import com.alibaba.fastjson.JSONObject;
import org.springframework.web.multipart.MultipartFile;

/**
 * Description:
 *
 * @Date:2020/1/13
 * @Author:lc
 */
public interface UploadService {
    /**
     * 上传图片
     * @param img
     * @param result
     * @param url
     * @return
     */
    boolean uploadImg(MultipartFile[] img, JSONObject result, String url);

    /**
     * 上传视频
     * @param video
     * @param result
     * @param url
     * @return
     */
    boolean uploadVideo(MultipartFile video, JSONObject result, String url);
}
