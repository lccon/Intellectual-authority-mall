package com.mall.service.impl;

import com.mall.constant.VideoConstants;
import com.mall.mapper.VideoMapper;
import com.mall.domain.User;
import com.mall.exception.base.BusinessValidationException;
import com.mall.exception.base.ServiceValidationException;
import com.mall.domain.Video;
import com.mall.service.UserService;
import com.mall.service.VideoService;
import com.mall.vo.VideoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.ZonedDateTime;
import java.util.List;

@Service ("videoService")
public class VideoServiceImpl implements VideoService {
	@Autowired
	private VideoMapper videoMapper;
	@Autowired
	private UserService userService;

	@Override
	public VideoVO findVideoById(Integer id) {
		if (id == null) {
			throw new BusinessValidationException("主键id不能为空");
		}
		try {
			return videoMapper.findById(id);
		} catch (Exception e) {
			throw new ServiceValidationException("没有该视频！", e);
		}
	}
	
	@Override
	public VideoVO findVideoByUrl(String url) {
	    if(StringUtils.isEmpty(url)) {
	        throw new BusinessValidationException("视频地址不能为空!");
        }
        try {
            return videoMapper.findByUrl(url);
        } catch (Exception e) {
	        throw new ServiceValidationException("获取视频出错!", e);
        }
	}
	
	@Override
	public VideoVO addVideo(Video video, Long userId) {
		User user = userService.findUserById(userId);
		if (user == null) {
			throw new BusinessValidationException("用户不存在");
		}
		if (StringUtils.isEmpty(video.getTitle())) {
			throw new BusinessValidationException("视频标题为空");
		}
		if (video.getTitle().length() == 0 || video.getTitle().length() > 50) {
			throw new BusinessValidationException("视频标题为空或超过50长度限制");
		}
		if (StringUtils.isEmpty(video.getUrl())) {
			throw new BusinessValidationException("视频地址为空");
		}
		if (video.getUrl().length() == 0 || video.getUrl().length() > 100) {
			throw new BusinessValidationException("视频地址为空或超过100长度限制");
		}
		if (StringUtils.isEmpty(video.getPicUrl())) {
			throw new BusinessValidationException("视频封面地址为空");
		}
		if (video.getPicUrl().length() == 0 || video.getPicUrl().length() > 100) {
			throw new BusinessValidationException("视频封面地址为空或超过100长度限制");
		}
		try {
			video.setUploadUserid(user.getId());
			video.setId(null);
			video.setUploadTime(ZonedDateTime.now());
			video.setCountPlay(0);
			video.setCountLike(0);
			videoMapper.addVideo(video);
			return findVideoByUrl(video.getUrl());
		} catch (Exception e) {
			throw new ServiceValidationException("新增视频出错！", e);
		}
	}
	
	@Override
	public VideoVO updateVideo(Integer id, Integer readCount, Long userId) {
		VideoVO videoVo = findVideoById(id);
		if(VideoConstants.PLAY_COUNT.equals(readCount)) {
			videoVo.setCountPlay(videoVo.getCountPlay() + 1);
		} else if (VideoConstants.LIKE_COUNT.equals(readCount)) {
		}
		try {
			videoMapper.updateVideo(videoVo);
			return videoVo;
		} catch (Exception e) {
			throw new ServiceValidationException("修改视频信息出错", e);
		}
	}
	
	@Override
	public List<VideoVO> showVideos() {
	    try {
            return videoMapper.findAllVideos();
        } catch (Exception e) {
	        throw new ServiceValidationException("获取所有的视频出错！", e);
        }
	}
	
	@Override
	public List<VideoVO> queryVideos(String keyword) {
	    if (StringUtils.isEmpty(keyword)) {
	        throw new BusinessValidationException("关键词不能为空!");
        }
        try {
            return videoMapper.queryVideo(keyword);
        } catch (Exception e) {
	        throw new ServiceValidationException("获取视频出错!", e);
        }
	}
}
