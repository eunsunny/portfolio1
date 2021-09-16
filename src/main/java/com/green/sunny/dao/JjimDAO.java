package com.green.sunny.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.JjimVO;
import com.green.sunny.utils.Criteria;

@Repository
public class JjimDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<JjimVO> jjimList(String id) {
		
		return mybatis.selectList("JjimDAO.jjimList", id);
	}
	
	public void insertJjim(JjimVO vo) {
		
		mybatis.insert("JjimDAO.insertJjim", vo);
	}
	
	public void deleteJjim(int jjseq) {
		
		mybatis.delete("JjimDAO.deleteJjim", jjseq);
	}
	
	// 买其捞瘤 其捞隆贸府
	public List<JjimVO> getJjimListPaging(Criteria criteria, String id) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("id", id);
		
		return mybatis.selectList("JjimDAO.jjimWithPaging", map);
		
	}
	
	public int countJjimList(String id) {
		
		return mybatis.selectOne("JjimDAO.countJjimList", id);
	}
	
	public int jjimCheck(JjimVO vo) {
		
		return mybatis.selectOne("JjimDAO.jjimCheck", vo);
	}

}
