package com.green.sunny.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.sunny.dto.GongziVO;
import com.green.sunny.utils.Criteria;

@Repository
public class GongziDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<GongziVO> getAllGongzi() {
		return mybatis.selectList("GongziDAO.getAllGongzi");
	}
	
	public List<GongziVO> getAllGongziPaging(Criteria criteria, String key){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("key", key);
		
		return mybatis.selectList("GongziDAO.getAllGongziPaging", map);
	}
	
	public int getTotalGongzi(String title) {
		return mybatis.selectOne("GongziDAO.getTotalGongzi", title);
	}
	
	public GongziVO getGongzi(int gseq) {
		return mybatis.selectOne("GongziDAO.getGongzi", gseq);
	}
	
	public void insertGongzi(GongziVO vo) {
		mybatis.insert("GongziDAO.insertGongzi", vo);
	}
	
	public void updateGongzi(GongziVO vo) {
		mybatis.update("GongziDAO.updateGongzi", vo);
	}
	
	public void deleteGongzi(int gseq) {
		mybatis.delete("GongziDAO.deleteGongzi", gseq);
	}
}
