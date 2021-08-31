package com.green.sunny.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Map<String,Object>> selectBoardList() {
		return mybatis.selectList("BoardDAO.selectBoardList");
	}
	
	public Map<String,Object> selectBoardDetail(int bseq) {
		
		return mybatis.selectOne("BoardDAO.selectBoardDetail", bseq);
	}
	
	public int selectCount(int bseq) {
		
		return mybatis.selectOne("BoardDAO.selectCount", bseq);
	}
	
	public void plusCount(BoardVO vo) {
		 mybatis.update("BoardDAO.plusCount", vo);
	}
	
	public void deleteBoard(int bseq) {
		
		mybatis.delete("BoardDAO.deleteBoard", bseq);
	}
	
	public int insertBoardInfo(Map<String, Object> param) {
		return mybatis.insert("BoardDAO.insertBoardInfo", param);
	}
}
