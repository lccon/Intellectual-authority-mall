package com.mall.service;

import com.mall.domain.Video;
import com.mall.vo.VideoVO;

import java.util.List;

public interface VideoService {
	VideoVO findVideoById(Integer id);
	
	VideoVO findVideoByUrl(String url);

	VideoVO addVideo(Video video, Long userId);

	VideoVO updateVideo(Integer id, Integer readCount, Long userId);
	
	List<VideoVO> showVideos();
	
	List<VideoVO> queryVideos(String keyword);
}
