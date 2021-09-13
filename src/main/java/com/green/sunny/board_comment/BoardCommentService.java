package com.green.sunny.board_comment;

import java.util.List;
import java.util.Map;

import com.green.sunny.dto.BoardCommentVO;
import com.green.sunny.utils.Criteria;

public interface BoardCommentService {

	public int countCommentList(int bseq);
	
	public List<BoardCommentVO> getCommentListWithPaging(Criteria criteria, int bseq);
	
	public int saveComment(BoardCommentVO vo);
	
	public void updateComment(Map<String,Object> paramMap);
	
	public void deleteAllComment(int bseq);
	
	
}
