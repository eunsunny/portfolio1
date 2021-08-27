package com.green.sunny.comment;

import java.util.List;
import java.util.Map;

import com.green.sunny.dto.ProductCommentVO;
import com.green.sunny.utils.Criteria;

public interface CommentService {

	public List<ProductCommentVO> getCommentListWithPaging(Criteria criteria, int pseq);
	
	public int countCommentList(int pseq);
	
	public int saveComment(ProductCommentVO vo);
	
	public void updateComment(Map<String,Object> paramMap);
}
