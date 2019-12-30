package com.mall.service;

import com.mall.domain.Comment;
import com.mall.vo.CommentVO;

import java.util.List;

public interface CommentService {
	Comment findCommentById(Integer id);

	Comment addComment(Comment comment);

	Boolean deleteComment(Integer id, Integer userId);

	Comment updateComment(Integer id, Integer userId);
	
	List<CommentVO> findListCommentByVideoId(Integer videoId, Integer offset);
}
