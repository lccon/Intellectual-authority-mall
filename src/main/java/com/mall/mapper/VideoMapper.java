package com.mall.mapper;

import com.mall.domain.Video;
import com.mall.vo.VideoVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VideoMapper {

    /**
     * 新增视频
     * @param record
     * @return
     */
    int addVideo(Video record);

    /**
     * 修改视频信息
     * @param videoVo
     * @return
     */
    int updateVideo(VideoVO videoVo);

    VideoVO findById(@Param("id") Integer id);

    VideoVO findByUrl(@Param ("url") String url);

    List<VideoVO> findAllVideos();

    List<VideoVO> queryVideo(@Param ("keyword") String keyword);
}