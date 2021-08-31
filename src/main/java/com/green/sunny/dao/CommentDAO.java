package com.green.sunny.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.ProductCommentVO;
import com.green.sunny.utils.Criteria;

@Repository
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductCommentVO> getCommentListWithPaging(Criteria criteria, int pseq) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("pseq", pseq);
		
		return mybatis.selectList("CommentDAO.getCommentListWithPaging", map);
	}
	
	public int countCommentList(int pseq) {
		
		return mybatis.selectOne("CommentDAO.countCommentList", pseq);
	}
		
	public int saveComment(ProductCommentVO vo) {
			return mybatis.insert("CommentDAO.saveComment", vo);
	}
	
	public void updateComment(Map<String,Object> paramMap) {
		mybatis.update("CommentDAO.updateComment", paramMap); 
	}
	
	public void deleteComment(Map<String,Object> paramMap) {
		mybatis.delete("CommentDAO.deleteComment", paramMap);
	}
}
