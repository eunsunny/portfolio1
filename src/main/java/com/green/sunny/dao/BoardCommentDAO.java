package com.green.sunny.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.BoardCommentVO;
import com.green.sunny.utils.Criteria;

@Repository
public class BoardCommentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BoardCommentVO> getCommentListWithPaging(Criteria criteria, int bseq) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("bseq", bseq);
		
		return mybatis.selectList("BoardCommentDAO.getCommentListWithPaging", map);
	}
	
	public int countCommentList(int bseq) {
		
		return mybatis.selectOne("BoardCommentDAO.countCommentList", bseq);
	}
		
	public int saveComment(BoardCommentVO vo) {
			return mybatis.insert("BoardCommentDAO.saveComment", vo);
	}
	
	public void updateComment(Map<String,Object> paramMap) {
		mybatis.update("BoardCommentDAO.updateComment", paramMap); 
	}
	
	public void deleteComment(Map<String,Object> paramMap) {
		mybatis.delete("BoardCommentDAO.deleteComment", paramMap);
	}
	
	public void deleteAllComment(int bseq) {
		mybatis.delete("BoardCommentDAO.deleteAllComment", bseq);
	}
}
