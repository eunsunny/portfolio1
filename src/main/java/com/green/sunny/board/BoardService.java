package com.green.sunny.board;

import java.util.List;
import java.util.Map;

import com.green.sunny.dto.BoardVO;

public interface BoardService {

	public List<Map<String,Object>> selectBoardList();
	
	public Map<String,Object> selectBoardDetail(int bseq);
	
	public int selectCount(int bseq);
	
	public void plusCount(BoardVO vo);
	
	public void deleteBoard(int bseq);
	
	public int insertBoardInfo(Map<String, Object> param);
}
